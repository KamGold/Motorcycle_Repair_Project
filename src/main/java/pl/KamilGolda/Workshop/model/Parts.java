package pl.KamilGolda.Workshop.model;

import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import javax.persistence.*;

@Entity
@Table(name = "parts")
@Data
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Parts {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String partName;
    String manufacturer;
    int price;
    int availability;
}
