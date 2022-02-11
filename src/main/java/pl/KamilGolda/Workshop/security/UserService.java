package pl.KamilGolda.Workshop.security;

import pl.KamilGolda.Workshop.model.Mechanic;

public interface UserService {
    Mechanic findByLogin(String login);

    void saveUser(Mechanic mechanic);
}
