package ua.com.hav.acc.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ua.com.hav.acc.model.Payment;

import java.util.List;

/**
 * Created by sunny on 02.01.18
 */
public interface PaymentRepository extends JpaRepository<Payment, Long> {
    List<Payment> findByProcessedIsNull();

    @Query("UPDATE Payment p SET p.processed = CURRENT_TIMESTAMP WHERE p.id = ?1")
    void process(Long id);
}
