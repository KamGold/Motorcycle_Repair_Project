package pl.KamilGolda.Workshop.security;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import pl.KamilGolda.Workshop.model.Mechanic;

import java.util.HashSet;
import java.util.Set;


public class SpringDataUserDetailsService implements UserDetailsService {
    private UserService userService;

    @Autowired
    public void setUserRepository(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String login) {
        Mechanic mechanic = userService.findByLogin(login);
        if (mechanic == null) {
            throw new UsernameNotFoundException(login);
        }
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        mechanic.getRoles().forEach(r ->
                grantedAuthorities.add(new SimpleGrantedAuthority(r.getName())));
        return new CurrentUser(
                mechanic.getLogin(),
                mechanic.getPassword(),
                grantedAuthorities,
                mechanic);
    }
}
