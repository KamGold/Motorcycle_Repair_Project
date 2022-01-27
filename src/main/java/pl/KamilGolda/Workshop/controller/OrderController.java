package pl.KamilGolda.Workshop.controller;

import lombok.RequiredArgsConstructor;
import org.aspectj.weaver.ast.Or;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.KamilGolda.Workshop.model.Mechanic;
import pl.KamilGolda.Workshop.model.Order;
import pl.KamilGolda.Workshop.repository.MechanicRepository;
import pl.KamilGolda.Workshop.repository.OrderRepository;


import javax.validation.Valid;
import java.util.Collection;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {

    private final OrderRepository orderRepository;
    private final MechanicRepository mechanicRepository;

    @GetMapping("/list")
    public String getList(Model model) {
        model.addAttribute("orders", orderRepository.findAll());
        return "order/list";
    }

    @GetMapping("/open")
    public String getActive(Model model) {
        model.addAttribute("orders", orderRepository.findByActiveTrue());
        return "order/list";
    }

    @GetMapping("/close/{id}")
    public String closeOrder(@PathVariable int id) {
        Optional<Order> order = orderRepository.findById(id);
        if(order.isPresent()){
            Order toUpdate = order.get();
            toUpdate.setActive(false);
            orderRepository.save(toUpdate);
            return "redirect:/order/open";
        }else {
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
    public String getEditOrder(@PathVariable int id, Model model){
        Optional<Order> orderOptional = orderRepository.findById(id);
        if (orderOptional.isPresent()){
            model.addAttribute("order", orderOptional.get());
        }else {
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

    @ModelAttribute("mechanics")
    public Collection<Mechanic> mechanics() {
        return mechanicRepository.findAll();
    }
}
