package ua.com.hav.acc.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.hav.acc.model.User;

/**
 * Created by sunny on 26.12.17
 */

public interface UserRepository extends JpaRepository<User, Long> {

    User findByLogin(String login);
}
