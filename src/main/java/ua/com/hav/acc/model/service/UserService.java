package ua.com.hav.acc.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.hav.acc.model.User;
import ua.com.hav.acc.model.repository.UserRepository;

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

//    public Page<User> findAllPage() {
//        new Page<User>();
//    }

//    @PostConstruct

//    @Autowired
//    RoleRepository roleRepository;
    public void init() {

//        Role admin = new Role();
//        Role user = new Role();
//        Role guest = new Role();
//        admin.setValue("ADMIN");
//        user.setValue("USER");
//        guest.setValue("GUEST");
//        roleRepository.save(admin);
//        roleRepository.save(user);
//        roleRepository.save(guest);

        Random r = new Random();
        for (int i = 0; i < 10; i++) {
            User user = new User();
            user.setAge(r.nextInt(60) + 10);
            user.setName("username_" + i);
            userRepository.save(user);
        }
    }

    public User findByLogin(String login) {
        return userRepository.findByLogin(login);
    }
}
