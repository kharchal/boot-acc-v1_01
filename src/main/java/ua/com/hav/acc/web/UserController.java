package ua.com.hav.acc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.com.hav.acc.model.Role;
import ua.com.hav.acc.model.User;
import ua.com.hav.acc.model.repository.RoleRepository;
import ua.com.hav.acc.model.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import static java.util.stream.Collectors.toMap;

/**
 * Created by sunny on 26.12.17
 */
@Controller
@RequestMapping("/users/")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleRepository roleRepository;

//    @SessionAttribute(name = "principal")
//    public UserDetails userDetails() {
//        UserDetails principal = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//
//        return principal;
//    }
//    @ModelAttribute(name = "rolesMap")
//    public Map<Long, String> rolesMap() {
//        return roleRepository.findAll().stream().collect(toMap(Role::getId, Role::getValue));
//    }

    @ModelAttribute(name = "rolesList")
    public List<Role> rolesList() {
        return roleRepository.findAll();
    }

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

    @RequestMapping("/init")
    public String init() {
        userService.init();
        return "redirect:/users/";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@Valid User user, BindingResult errors,
                       @RequestParam String cmd,
                       @RequestParam(value = "psw_change", required = false, defaultValue = "false") Boolean pswChange) {

        System.out.println("user = " + user);
        if (user.getId() == null && !pswChange || errors.hasErrors() || cmd.toLowerCase().equals("change")) {
            return "user_form";
        }
        userService.save(user, pswChange);
        return "redirect:/users/";
    }

    @RequestMapping("/delete/{id}")
    public String edit(@PathVariable Long id) {
        userService.delete(id);
        return "redirect:/users/";
    }

    @RequestMapping(value = "/massdelete", method = RequestMethod.POST)
    @ResponseBody
    public String massDelete(@RequestParam(value = "ids[]", required = false) Long[] ids) {
        System.out.println("ids to delete= " + Arrays.toString(ids));
        if (ids != null) {
            for (long id : ids) {
                userService.delete(id);
            }
        }
        return "ok";
    }
}
