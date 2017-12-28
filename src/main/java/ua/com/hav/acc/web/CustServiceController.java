package ua.com.hav.acc.web;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.com.hav.acc.model.CustService;
import ua.com.hav.acc.model.service.CustServiceService;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by sunny on 28.12.17
 */
@Controller
@RequestMapping("/service/")
public class CustServiceController {

    @Autowired
    private CustServiceService serviceService;

    @RequestMapping("")
    public String list(Model model) {
        List<CustService> services = serviceService.findAll();
        services.sort((a, b) -> a.getId().compareTo(b.getId()));
        model.addAttribute("list", services);
        return "serv_list";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        serviceService.delete(id);
        return "redirect:/service/";
    }

    @RequestMapping("/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("service", serviceService.findOne(id));
        return "serv_form";
    }

    @RequestMapping("/new")
    public String newService(Model model) {
        model.addAttribute("service", new CustService());
        return "serv_form";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@Valid CustService service, BindingResult result) {
        if (result.hasErrors()) {
            return "serv_form";
        }
        serviceService.save(service);
        return "redirect:/service/";
    }
}
