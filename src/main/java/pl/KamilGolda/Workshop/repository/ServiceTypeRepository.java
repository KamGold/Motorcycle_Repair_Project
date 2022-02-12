package pl.KamilGolda.Workshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.KamilGolda.Workshop.model.ServiceType;

public interface ServiceTypeRepository extends JpaRepository<ServiceType,Integer> {
}
