package pl.KamilGolda.Workshop.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.KamilGolda.Workshop.model.Parts;
import pl.KamilGolda.Workshop.repository.PartsRepository;

import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@RequestMapping("/parts")
public class PartsController {
    private final PartsRepository partsRepository;

    @GetMapping("/list")
    public String getList(Model model) {
        model.addAttribute("parts", partsRepository.findAll());
        return "parts/list";
    }

    @GetMapping("/add")
    public String addParts(Model model) {
        model.addAttribute("parts", new Parts());
        return "parts/form";
    }

    @PostMapping("/add")
    public String saveParts(@Valid Parts parts, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "parts/form";
        }
        partsRepository.save(parts);
        return "redirect:/parts/list";
    }

}
