package pl.KamilGolda.Workshop.model;


import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import javax.persistence.*;

@Entity
@Table(name = "service")
@Data
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Service {

    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String serviceName;
    int price;
}
