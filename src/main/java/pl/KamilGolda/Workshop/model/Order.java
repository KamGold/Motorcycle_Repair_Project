package pl.KamilGolda.Workshop.model;

import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import javax.persistence.*;
import java.util.HashSet;
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
    String brand;
    String model;
    int year;
    String registrationNumber;
    String ownerName;
    String ownerSurname;
    int ownerPhone;

    @ManyToOne
    @JoinColumn(name = "Mechanic_id")
    Mechanic mechanic;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "orders_services", joinColumns = @JoinColumn(name = "Order_Service_id"),
            inverseJoinColumns = @JoinColumn(name = "Service_id"))
    private Set<Service> services = new HashSet<>();

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "orders_parts", joinColumns = @JoinColumn(name = "Order_Parts_id"),
            inverseJoinColumns = @JoinColumn(name = "Parts_id"))
    private Set<Parts> parts = new HashSet<>();

}
