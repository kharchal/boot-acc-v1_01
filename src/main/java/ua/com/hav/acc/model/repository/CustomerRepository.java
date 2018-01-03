package ua.com.hav.acc.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.hav.acc.model.Customer;

import java.util.List;

/**
 * Created by sunny on 29.12.17
 */
public interface CustomerRepository extends JpaRepository<Customer, Long> {

    List<Customer> findByNumberContains(String number);

}
