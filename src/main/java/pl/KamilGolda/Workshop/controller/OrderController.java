package pl.KamilGolda.Workshop.controller;

import lombok.RequiredArgsConstructor;
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
        Order order = orderRepository.getById(id);
        order.setActive(false);
        orderRepository.save(order);
            return "redirect:/order/open";

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
        order.setActive(true);
        orderRepository.save(order);
        return "redirect:/order/list";
    }

    @ModelAttribute("mechanics")
    public Collection<Mechanic> mechanics() {
        return mechanicRepository.findAll();
    }
}
