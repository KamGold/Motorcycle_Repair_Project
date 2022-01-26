package pl.KamilGolda.Workshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.KamilGolda.Workshop.model.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

}
