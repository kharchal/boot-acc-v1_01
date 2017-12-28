package ua.com.hav.acc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.Date;

@Controller
@SpringBootApplication
public class BootAccV101Application {

	public static void main(String[] args) {
		SpringApplication.run(BootAccV101Application.class, args);
	}

	@RequestMapping("")
	public String index() {
		System.out.println("index...");
		return "index";
	}

	@RequestMapping("/time")
	public String time(Model model) {
		model.addAttribute("time", new Date());
		return "time";
	}

	@RequestMapping("/login")
	public String loginPage() {
		return "login";
	}

	@RequestMapping("/403")
	public String _403() {
		return "error";
	}

}
