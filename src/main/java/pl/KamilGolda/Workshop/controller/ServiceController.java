package pl.KamilGolda.Workshop.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.KamilGolda.Workshop.model.Mechanic;

import pl.KamilGolda.Workshop.model.Service;
import pl.KamilGolda.Workshop.repository.MechanicRepository;
import pl.KamilGolda.Workshop.repository.ServiceRepository;

import javax.validation.Valid;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/service")
//@Secured({"ROLE_USER","ROLE_SU,","ROLE_ADMIN"})
public class ServiceController {
    private final ServiceRepository serviceRepository;
    private final MechanicRepository mechanicRepository;

    @GetMapping("/list")
    public String getList(Model model) {
        model.addAttribute("service", serviceRepository.findAll());
        return "service/list";
    }

    @GetMapping("/add")
    public String addService(Model model) {
        model.addAttribute("service", new Service());
        return "service/form";
    }

    @PostMapping("/add")
    public String saveService(@Valid Service service, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "service/form";
        }
        serviceRepository.save(service);
        return "redirect:/service/list";
    }
    @GetMapping("/edit/{id}")
    public String getEditService(@PathVariable int id, Model model){
        Optional<Service> serviceOptional = serviceRepository.findById(id);
        if (serviceOptional.isPresent()){
            model.addAttribute("service", serviceOptional.get());
        }else {
            return "errors/id";
        }
        return "service/edit";
    }
    @PostMapping("/edit")
    public String updateOrder(@Valid Service service, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "service/edit";
        }
        serviceRepository.save(service);
        return "redirect:/service/list";
    }
    @ModelAttribute("user")
    public Mechanic logged(){
        return mechanicRepository.findByLogin(SecurityContextHolder.getContext().getAuthentication().getName());
    }
}
