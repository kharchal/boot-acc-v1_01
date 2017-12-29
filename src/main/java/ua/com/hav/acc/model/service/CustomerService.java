package ua.com.hav.acc.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import ua.com.hav.acc.model.CustService;
import ua.com.hav.acc.model.Customer;
import ua.com.hav.acc.model.repository.CustServiceRepository;
import ua.com.hav.acc.model.repository.CustomerRepository;

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
    private CustServiceRepository custServiceRepository;

    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    public Customer findOne(Long id) {
        return customerRepository.findOne(id);
    }

    public void save(Customer customer) {
        customerRepository.save(customer);
    }

    public void delete(Long id) {
        customerRepository.delete(id);
    }

    public void addServices(Customer customer, List<Long> services) {
        if (services != null && services.size() > 0) {
            List<CustService> list = custServiceRepository.findAll().stream().filter(s -> services.contains(s.getId())).collect(toList());
            customer.setServiceList(list);
        }
    }
}
