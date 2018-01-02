package ua.com.hav.acc.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.com.hav.acc.model.Payment;
import ua.com.hav.acc.model.repository.PaymentRepository;

import java.util.List;

/**
 * Created by sunny on 02.01.18
 */
@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    public List<Payment> findAll() {
        return paymentRepository.findAll();
    }

    public List<Payment> findAllUnprocessed() {
        return paymentRepository.findByProcessedIsNull();
    }

    public Payment findOne(Long id) {
        return paymentRepository.findOne(id);
    }

    public void delete(Long id) {
        paymentRepository.delete(id);
    }

    public void save(Payment payment) {
        paymentRepository.save(payment);
    }

    public void processPayments(Long[] ids) {
        for (int i = 0; i < ids.length; i++) {
            paymentRepository.process(ids[i]);
        }
    }
}
