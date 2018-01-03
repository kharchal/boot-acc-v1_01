package ua.com.hav.acc.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.com.hav.acc.model.CustService;
import ua.com.hav.acc.model.Customer;
import ua.com.hav.acc.model.User;
import ua.com.hav.acc.model.repository.CustServiceRepository;
import ua.com.hav.acc.model.repository.CustomerRepository;
import ua.com.hav.acc.model.repository.UserRepository;

import java.util.ArrayList;
import java.util.List;

import static java.util.stream.Collectors.toList;

/**
 * Created by sunny on 29.12.17
 */
@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CustServiceRepository custServiceRepository;

    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    public Customer findOne(Long id) {
        return customerRepository.findOne(id);
    }

    public void save(Customer customer) {
        if (customer.getUser() == null) {
            customer.setUser(userRepository.findOne(customerRepository.findOne(customer.getId()).getUser().getId()));
        }
        customerRepository.save(customer);
    }

    public void delete(Long id) {
//        customerRepository.findOne(id).setServiceList(new ArrayList<>());
        customerRepository.delete(id);
    }

    public void addServices(Customer customer, List<Long> services) {
        if (services != null && services.size() > 0) {
            List<CustService> list = custServiceRepository.findAll().stream().filter(s -> services.contains(s.getId())).collect(toList());
            customer.setServiceList(list);
        }
    }

    public List<Customer> findByNumber(String number) {
        return customerRepository.findByNumberContains(number);
    }


}
