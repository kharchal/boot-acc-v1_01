package ua.com.hav.acc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.com.hav.acc.model.User;
import ua.com.hav.acc.model.service.UserService;

import javax.validation.Valid;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by sunny on 26.12.17
 */
@Controller
@RequestMapping("/users/")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("")
    public String list(Model model) {
        List<User> userList = userService.findAll();
        userList.sort((a, b) -> a.getId().compareTo(b.getId()));
        model.addAttribute("userList", userList);
        return "user_list";
    }

    @RequestMapping("/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("user", userService.findOne(id));
        return "user_form";
    }

    @RequestMapping("/new")
    public String addNew(Model model) {
        model.addAttribute("user", new User());
        return "user_form";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@Valid User user, BindingResult errors) {
//        if ()
        System.out.println("user = " + user);
        if (errors.hasErrors()) {
            return "user_form";
        }
        userService.save(user);
        return "redirect:/users/";
    }

    @RequestMapping("/delete/{id}")
    public String edit(@PathVariable Long id) {
        userService.delete(id);
        return "redirect:/users/";
    }
}
