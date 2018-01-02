package ua.com.hav.acc.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.com.hav.acc.model.CustServicePeriod;
import ua.com.hav.acc.model.repository.CustServicePeriodRepository;

import java.util.List;

/**
 * Created by sunny on 02.01.18
 */
@Service
public class CustServicePeriodService {

    @Autowired
    private CustServicePeriodRepository periodRepository;

    public List<CustServicePeriod> findAll() {
        return periodRepository.findAll();
    }

    public CustServicePeriod findOne(Long id) {
        return periodRepository.findOne(id);
    }

    public void save(CustServicePeriod period) {
        periodRepository.save(period);
    }

    public void delete(Long id) {
        periodRepository.delete(id);
    }
}
