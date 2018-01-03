package ua.com.hav.acc.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.hav.acc.model.Customer;
import ua.com.hav.acc.model.Payment;
import ua.com.hav.acc.model.repository.PaymentRepository;

import java.math.BigDecimal;
import java.util.Date;
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

    @Transactional
    public void processPayments(Long[] ids) {
        Date d = new Date();
        for (int i = 0; i < ids.length; i++) {
//            paymentRepository.process(ids[i]);
            Payment payment = paymentRepository.findOne(ids[i]);
            Customer customer = payment.getCustomer();
            BigDecimal sum = customer.getBalance().add(payment.getSum());
            customer.setBalance(sum);
            payment.setProcessed(d);
//            paymentRepository.save(payment);

        }
    }

    @Transactional
    public void unprocessPayment(Long id) {
        Payment payment = paymentRepository.findOne(id);
        Customer customer = payment.getCustomer();
        customer.setBalance(customer.getBalance().subtract(payment.getSum()));
        payment.setProcessed(null);
    }

    public List<Payment> findAll(Sort sort) {
        return paymentRepository.findAll(sort);
    }
}
