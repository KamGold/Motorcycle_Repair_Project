package pl.KamilGolda.Workshop.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.KamilGolda.Workshop.model.Mechanic;
import pl.KamilGolda.Workshop.model.Order;
import pl.KamilGolda.Workshop.model.Parts;
import pl.KamilGolda.Workshop.model.Service;
import pl.KamilGolda.Workshop.repository.MechanicRepository;
import pl.KamilGolda.Workshop.repository.OrderRepository;
import pl.KamilGolda.Workshop.repository.PartsRepository;
import pl.KamilGolda.Workshop.repository.ServiceRepository;


import javax.validation.Valid;
import java.util.Collection;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {

    private final OrderRepository orderRepository;
    private final MechanicRepository mechanicRepository;
    private final PartsRepository partsRepository;
    private final ServiceRepository serviceRepository;

    @GetMapping("/list")
    public String getList(Model model) {
        model.addAttribute("orders", orderRepository.findAll());
        return "order/list";
    }

    @GetMapping("/open")
    public String getActive(Model model) {
        model.addAttribute("orders", orderRepository.findByActive(true));
        return "order/list";
    }

    @GetMapping("/closed")
    public String getclosed(Model model) {
        model.addAttribute("orders", orderRepository.findByActive(false));
        return "order/list";
    }

    @GetMapping("/close/{id}")
    public String closeOrder(@PathVariable int id) {
        Optional<Order> order = orderRepository.findById(id);
        if (order.isPresent()) {
            Order toUpdate = order.get();
            toUpdate.setActive(false);
            orderRepository.save(toUpdate);
            return "redirect:/order/open";
        } else {
            return "errors/id";
        }
    }

    @GetMapping("/add")
    public String getForm(Model model) {
        model.addAttribute("order", new Order());
        return "order/form";
    }

    @PostMapping("/add")
    public String saveOrder(@Valid Order order, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "order/form";
        }
        orderRepository.save(order);
        return "redirect:/order/list";
    }

    @GetMapping("/edit/{id}")
    public String getEditOrder(@PathVariable int id, Model model) {
        Optional<Order> orderOptional = orderRepository.findById(id);
        if (orderOptional.isPresent()) {
            model.addAttribute("order", orderOptional.get());
        } else {
            return "errors/id";
        }
        return "order/edit";
    }

    @PostMapping("/edit")
    public String updateOrder(@Valid Order order, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "order/edit";
        }
        orderRepository.save(order);
        return "redirect:/order/open";
    }

    @GetMapping("/addService/{id}")
    public String addService(@PathVariable int id, Model model) {
        Optional<Order> byId = orderRepository.findById(id);
        if (byId.isPresent()) {
            model.addAttribute("order", byId.get());
            model.addAttribute("service", new Service());
        } else {
            return "errors/id";
        }
        return "order/addService";
    }

    @PostMapping("/addService")
    public String addServiceUpdate(@Valid Order order,@Valid Service service, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "order/addService";
        }
        order.getServices().add(service);
        orderRepository.save(order);
        return "redirect:/order/open";
    }
    @GetMapping ("deleteService/{id}")
        public String deleteServiceFromOrder(int id, Model model){


    }

    @PostMapping("/summary/{id}")
    public String getOrderSummary(@PathVariable int id, Model model) {
        Optional<Order> optionalOrder = orderRepository.findById(id);
        if (optionalOrder.isPresent()) {
            model.addAttribute("order", optionalOrder.get());
        } else {
            return "Error sorry :(";
        }
        Order order = optionalOrder.get();
        double partsTotalCost = order.getParts().stream().mapToDouble(Parts::getPrice).reduce(0, Double::sum);
        double servicesTotalCost = order.getServices().stream().mapToDouble(Service::getPrice).reduce(0, Double::sum);
        double orderTotalCost = partsTotalCost + servicesTotalCost;
        model.addAttribute("partsTotalCost", partsTotalCost);
        model.addAttribute("servicesTotalCost", servicesTotalCost);
        model.addAttribute("orderTotalCost", orderTotalCost);
        return "order/summary";
    }

    @PostMapping("/summary")
    public String orderSummary(@Valid Order order, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "Error Sorry :(";
        }
        order.setActive(false);
        orderRepository.save(order);
        return "index";
    }

    @ModelAttribute("mechanics")
    public Collection<Mechanic> mechanics() {
        return mechanicRepository.findAll();
    }

    @ModelAttribute("parts")
    public Collection<Parts> parts() {
        return partsRepository.findAll();
    }

    @ModelAttribute("services")
    public Collection<Service> services() {
        return serviceRepository.findAll();
    }
}
