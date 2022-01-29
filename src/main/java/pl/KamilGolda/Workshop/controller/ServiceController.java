package pl.KamilGolda.Workshop.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.KamilGolda.Workshop.model.Parts;
import pl.KamilGolda.Workshop.model.Service;
import pl.KamilGolda.Workshop.repository.ServiceRepository;

import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@RequestMapping("/service")
public class ServiceController {
    private final ServiceRepository serviceRepository;

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
}
