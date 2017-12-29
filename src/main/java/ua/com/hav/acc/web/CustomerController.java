package ua.com.hav.acc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.com.hav.acc.model.CustService;
import ua.com.hav.acc.model.Customer;
import ua.com.hav.acc.model.User;
import ua.com.hav.acc.model.service.CustServiceService;
import ua.com.hav.acc.model.service.CustomerService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

/**
 * Created by sunny on 29.12.17
 */
@Controller
@RequestMapping("/customer/")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CustServiceService custServiceService;

    @ModelAttribute("servList")
    public List<CustService> serviceList() {
        return custServiceService.findAll();
    }

    @RequestMapping("")
    public String list(Model model) {
        model.addAttribute("list", customerService.findAll());
        return "cust_list";
    }

    @RequestMapping("/new")
    public String newItem(Model model) {
        model.addAttribute("customer", new Customer());
        return "cust_form";
    }

    @RequestMapping("/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("customer", customerService.findOne(id));
        return "cust_form";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        customerService.delete(id);
        return "redirect:/customer/";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@Valid Customer customer, BindingResult result, @RequestParam(value = "serv", required = false) List<Long> services, HttpSession session) {
        System.out.println("customer = " + customer);
        System.out.println();
        System.out.println("services = " + services);
        System.out.println();
        if (result.hasErrors()) {
            return "cust_form";
        }
        if (customer.getId() == null) {
            User loggedUser = (User) session.getAttribute("logged_user");
            customer.setUser(loggedUser);
        }
        customerService.addServices(customer, services);
        customerService.save(customer);
        return "redirect:/customer/";
    }

    @RequestMapping(value = "/massdelete", method = RequestMethod.POST)
    @ResponseBody
    public String massDelete(@RequestParam(value = "ids[]", required = false) Long[] ids) {
        System.out.println("ids to delete= " + Arrays.toString(ids));
        if (ids != null) {
            for (long id : ids) {
                customerService.delete(id);
            }
        }
        return "ok";
    }
}
