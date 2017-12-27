package ua.com.hav.acc.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.hav.acc.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
}
