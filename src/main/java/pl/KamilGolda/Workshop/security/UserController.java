package pl.KamilGolda.Workshop.security;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.KamilGolda.Workshop.model.Mechanic;
import pl.KamilGolda.Workshop.repository.MechanicRepository;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
@Secured("ROLE_ADMIN")
public class UserController {

    private final UserService userService;
    private final MechanicRepository mechanicRepository;

    @GetMapping("/users")
    public String getUsersList(){
        return "adminPanel/userList";
    }

    @GetMapping("/create-user")
    public String createUser() {
        Mechanic mechanic = new Mechanic();
        mechanic.setLogin("Bart");
        mechanic.setPassword("coderslab");
        mechanic.setName("Bartholomew");
        userService.saveUser(mechanic);
        return "admin";
    }


    @ModelAttribute("user")
    public Mechanic logged(){
        return mechanicRepository.findByLogin(SecurityContextHolder.getContext().getAuthentication().getName());
    }
}
