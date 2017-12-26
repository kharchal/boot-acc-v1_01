package ua.com.hav.acc.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.hav.acc.model.User;
import ua.com.hav.acc.model.repository.UserRepository;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.Random;

/**
 * Created by sunny on 26.12.17
 */
@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public User findOne(Long id) {
        return userRepository.findOne(id);
    }

    public void save(User user) {
        userRepository.save(user);
    }

    public void delete(Long id) {
        userRepository.delete(id);
    }

    @PostConstruct
    public void init() {
        Random r = new Random();
        for (int i = 0; i < 10; i++) {
            User user = new User();
            user.setAge(r.nextInt(60) + 10);
            user.setName("username_" + i);
            userRepository.save(user);
        }
    }
}
