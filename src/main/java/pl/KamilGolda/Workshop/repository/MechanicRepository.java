package pl.KamilGolda.Workshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.KamilGolda.Workshop.model.Mechanic;

@Repository
public interface MechanicRepository extends JpaRepository<Mechanic, Integer> {
}
