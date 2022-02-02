package pl.KamilGolda.Workshop.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.KamilGolda.Workshop.repository.OrderRepository;

@Controller
@RequiredArgsConstructor
public class IndexController {

    private final OrderRepository orderRepository;

    @GetMapping
    public String getActive(Model model) {
        model.addAttribute("orders", orderRepository.findByActive(true));
        return "index";
    }
}
