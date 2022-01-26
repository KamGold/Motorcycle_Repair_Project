package pl.KamilGolda.Workshop.model;


import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import javax.persistence.*;


@Entity
@Table(name = "mechanics")
@Data
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Mechanic {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    String login;

    String password;

    String name;
}
