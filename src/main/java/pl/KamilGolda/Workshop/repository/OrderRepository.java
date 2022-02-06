package pl.KamilGolda.Workshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.KamilGolda.Workshop.model.Order;
import pl.KamilGolda.Workshop.model.Service;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

    Optional<Order> findById(int id);

    List<Order> findByActive(boolean active);


}
