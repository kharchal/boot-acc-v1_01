package ua.com.hav.acc.web;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.com.hav.acc.model.CustView;
import ua.com.hav.acc.model.Customer;
import ua.com.hav.acc.model.Payment;
import ua.com.hav.acc.model.service.CustomerService;
import ua.com.hav.acc.model.service.PaymentService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * Created by sunny on 02.01.18
 */
@Controller
@RequestMapping("/admin/payment/")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private CustomerService customerService;

    @RequestMapping("")
    public String list(Model model) {
        model.addAttribute("list", paymentService.findAll());
        return "paym_list";
    }

    @RequestMapping("/new")
    public String addNew(Model model) {
        model.addAttribute("payment", new Payment());
        return "paym_form";
    }

    @RequestMapping("{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("payment", paymentService.findOne(id));
        return "paym_form";
    }

    @RequestMapping("/save")
    public String save(@Valid Payment payment, BindingResult result, @RequestParam("cust_id") Long id) {
        if (result.hasErrors()) {
            return "paym_form";
        }
        if (payment.getDate() == null) {
            payment.setDate(new Date());
        }
        if (payment.getCustomer() == null) {
            Customer customer = customerService.findOne(id);
            payment.setCustomer(customer);
        }
        paymentService.save(payment);
        return "redirect:/admin/payment/";
    }

    @RequestMapping(value = "/massdelete", method = RequestMethod.POST)
    @ResponseBody
    public String massDelete(@RequestParam(value = "ids[]", required = false) Long[] ids) {
        System.out.println("ids to delete= " + Arrays.toString(ids));
        if (ids != null) {
            for (long id : ids) {
                paymentService.delete(id);
            }
        }
        return "ok";
    }

    @RequestMapping(value = "/massprocess", method = RequestMethod.POST)
    @ResponseBody
    public String massProcess(@RequestParam(value = "ids[]", required = false) Long[] ids) {
        System.out.println("ids to process= " + Arrays.toString(ids));
        if (ids != null) {
            Date d = new Date();
            for (int i = 0; i < ids.length; i++) {
                Payment payment = paymentService.findOne(ids[i]);
                payment.setProcessed(d);
                paymentService.save(payment);
            }
        }
        return "ok";
    }

    @RequestMapping(value = "/ajax/find", method = RequestMethod.POST)
    @ResponseBody
    public String find(@RequestParam("number") String number) {
        List<Customer> customers = customerService.findByNumber(number);
        List<CustView> cst = new ArrayList<>();
        for (Customer c : customers) {
            cst.add(CustView.builder().id(c.getId()).number(c.getFormattedNumber()).build());
        }
        String json = new Gson().toJson(cst);
        return json;
    }
}
