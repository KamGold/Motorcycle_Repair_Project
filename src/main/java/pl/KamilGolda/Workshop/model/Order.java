package pl.KamilGolda.Workshop.model;

import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "orders")
@Data
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @Size(min = 3)
    @NotBlank
    String brand;

    @NotBlank
    String model;

    int year;
    String licensePlate;
    String ownerName;
    String ownerSurname;
    @Pattern(regexp = "[0-9]{3}?-[0-9]{3}?-[0-9]{3}")
    String ownerPhone;
    boolean active;

    @ManyToOne
    @JoinColumn(name = "Mechanic_id")
    Mechanic mechanic;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "orders_services", joinColumns = @JoinColumn(name = "Order_Service_id"),
            inverseJoinColumns = @JoinColumn(name = "Service_id"))
    private Set<Service> services = new HashSet<>();

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "orders_parts", joinColumns = @JoinColumn(name = "Order_Parts_id"),
            inverseJoinColumns = @JoinColumn(name = "Parts_id"))
    private List<Parts> parts = new ArrayList<>();

}
