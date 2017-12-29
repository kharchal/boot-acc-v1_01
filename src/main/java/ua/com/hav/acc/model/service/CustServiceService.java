package ua.com.hav.acc.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import ua.com.hav.acc.model.CustService;
import ua.com.hav.acc.model.repository.CustServiceRepository;

import java.util.List;

/**
 * Created by sunny on 28.12.17
 */
@Service
public class CustServiceService {

    @Autowired
    private CustServiceRepository serviceRepository;

    public CustService findOne(Long id) {
        return serviceRepository.findOne(id);
    }

    public List<CustService> findAll() {
        return serviceRepository.findAll();
    }

    public void delete(Long id) {
        serviceRepository.delete(id);
    }

    public void save(CustService service) {
        serviceRepository.save(service);
    }

    public List<CustService> findAll(Sort sort) {
        return serviceRepository.findAll(sort);
    }
}
