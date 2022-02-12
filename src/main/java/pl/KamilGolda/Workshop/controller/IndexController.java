package pl.KamilGolda.Workshop.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.KamilGolda.Workshop.model.Mechanic;
import pl.KamilGolda.Workshop.repository.MechanicRepository;
import pl.KamilGolda.Workshop.repository.OrderRepository;
import pl.KamilGolda.Workshop.security.CurrentUser;
import pl.KamilGolda.Workshop.security.Role;
import pl.KamilGolda.Workshop.security.RoleRepository;


import java.time.LocalDate;

@Controller
@RequiredArgsConstructor
//@Secured({"ROLE_USER","ROLE_SU,","ROLE_ADMIN"})
public class IndexController {

    private final OrderRepository orderRepository;
    private final MechanicRepository mechanicRepository;
    private final RoleRepository roleRepository;

    @GetMapping
    public String getActive(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        model.addAttribute("orders", orderRepository.findByActive(true));
        model.addAttribute("dateTime", LocalDate.now());
        model.addAttribute("day", LocalDate.now().getDayOfWeek().toString().toLowerCase());
        return "index";
    }

    @ModelAttribute("user")
    public Mechanic logged() {
        return mechanicRepository.findByLogin(SecurityContextHolder.getContext().getAuthentication().getName());
    }

    @ModelAttribute("roleAdmin")
    public Role isAdmin() {
        return roleRepository.findByName("ROLE_ADMIN");
    }

}
