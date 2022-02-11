package pl.KamilGolda.Workshop.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.KamilGolda.Workshop.model.Mechanic;
import pl.KamilGolda.Workshop.repository.MechanicRepository;
import pl.KamilGolda.Workshop.repository.OrderRepository;

@Controller
@RequiredArgsConstructor
//@Secured({"ROLE_USER","ROLE_SU,","ROLE_ADMIN"})
public class IndexController {

    private final OrderRepository orderRepository;
    private final MechanicRepository mechanicRepository;

    @GetMapping
    public String getActive(Model model) {
        model.addAttribute("orders", orderRepository.findByActive(true));
        return "index";
    }
    @ModelAttribute("user")
    public Mechanic logged(){
        return mechanicRepository.findByLogin(SecurityContextHolder.getContext().getAuthentication().getName());
    }
}
