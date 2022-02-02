package pl.KamilGolda.Workshop.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.KamilGolda.Workshop.model.Parts;
import pl.KamilGolda.Workshop.model.Service;
import pl.KamilGolda.Workshop.repository.ServiceRepository;

import javax.validation.Valid;
import java.util.Optional;

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
}
