package pl.KamilGolda.Workshop.security;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.KamilGolda.Workshop.model.Mechanic;
import pl.KamilGolda.Workshop.repository.MechanicRepository;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService{

    private final MechanicRepository mechanicRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    @Override
    public Mechanic findByLogin(String login) {
        return mechanicRepository.findByLogin(login);
    }

    @Override
    public void saveUser(Mechanic mechanic) {
        mechanic.setPassword(passwordEncoder.encode(mechanic.getPassword()));
        mechanic.setEnabled(1);
        Role userRole = roleRepository.findByName("ROLE_USER");
        mechanic.setRoles(new HashSet<>(List.of(userRole)));
        mechanicRepository.save(mechanic);
    }
}
