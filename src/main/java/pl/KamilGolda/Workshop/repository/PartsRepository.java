package pl.KamilGolda.Workshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.KamilGolda.Workshop.model.Parts;

public interface PartsRepository extends JpaRepository<Parts, Integer> {

}
