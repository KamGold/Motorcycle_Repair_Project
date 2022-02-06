package pl.KamilGolda.Workshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.KamilGolda.Workshop.model.Service;


public interface ServiceRepository extends JpaRepository<Service, Integer> {

}
