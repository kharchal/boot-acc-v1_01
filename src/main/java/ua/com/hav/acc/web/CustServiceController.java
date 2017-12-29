package ua.com.hav.acc.web;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.com.hav.acc.model.CustService;
import ua.com.hav.acc.model.service.CustServiceService;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

import static java.util.Comparator.comparing;

/**
 * Created by sunny on 28.12.17
 */
@Controller
@RequestMapping("/service/")
public class CustServiceController {

    @Autowired
    private CustServiceService serviceService;

    private String sortByField = "id";
    private Sort.Direction sortDir = Sort.Direction.ASC;

    @RequestMapping("")
    public String list(Model model) {
        Sort sort = new Sort(sortDir, sortByField);
        List<CustService> services = serviceService.findAll(sort);
        model.addAttribute("list", services);
        model.addAttribute("sort_col", sortByField);
        model.addAttribute("sort_order", sortDir.isAscending());
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

    @RequestMapping(value = "/massdelete", method = RequestMethod.POST)
    @ResponseBody
    public String massDelete(@RequestParam(value = "ids[]", required = false) Long[] ids) {
        System.out.println("ids to delete= " + Arrays.toString(ids));
        if (ids != null) {
            for (long id : ids) {
                serviceService.delete(id);
            }
        }
        return "ok";
    }

    @RequestMapping(value = "/sort", method = RequestMethod.POST)
    @ResponseBody
    public String sort(@RequestParam("sort") String sortField, @RequestParam("order") boolean order) {
        sortDir = order ? Sort.Direction.ASC : Sort.Direction.DESC;
        sortByField = sortField;
        return "ok";
    }
}
