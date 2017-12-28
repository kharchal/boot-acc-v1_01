package ua.com.hav.acc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.com.hav.acc.model.Role;
import ua.com.hav.acc.model.User;
import ua.com.hav.acc.model.repository.RoleRepository;
import ua.com.hav.acc.model.service.UserService;

import javax.validation.Valid;

import static java.util.Arrays.asList;

/**
 * Created by sunny on 28.12.17
 */
@Controller
public class RegisterController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleRepository roleRepository;

    @RequestMapping("/register")
    public String regPage(Model model) {
        model.addAttribute("user", new User());
        return "reg_page";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Valid User user, BindingResult errors) {

            System.out.println("user = " + user);
            if (errors.hasErrors()) {
                return "reg_page";
            }
            user.setRoles(asList(roleRepository.findByValue("GUEST")));
            userService.save(user, true);
            return "redirect:/login";
    }
}
