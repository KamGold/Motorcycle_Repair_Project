package pl.KamilGolda.Workshop.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import pl.KamilGolda.Workshop.model.Mechanic;
import java.util.Collection;

public class CurrentUser extends User {
    private final Mechanic mechanic;
    public CurrentUser(String username, String password, Collection<? extends GrantedAuthority> authorities,Mechanic mechanic) {
        super(username, password, authorities);
        this.mechanic = mechanic;
    }
    public Mechanic getMechanic(){return mechanic;}
}
