package t.learn.spring.boot.min;

import java.util.Arrays;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@Bean
	public CommandLineRunner commandLineRunner(ApplicationContext ctx) {

		return args -> {
			System.out.println("Lets inspect beans provided by spring boot:");

			var beanNames = ctx.getBeanDefinitionNames();
			Arrays.sort(beanNames);
			for (var beanName : beanNames)
				System.out.println(beanName);
		};
	}
}

@RestController
class HelloController {

	@RequestMapping("/")
	public String index() {
		return "Greetings from S Boot!";
	}
}

@Controller
class GreetingController {
	/*
	 * The implementation of the method body relies on a view technology, in this
	 * case Thymeleaf, to perform server-side rendering of the HTML.
	 * 
	 * Thymeleaf parses the greeting.html template and evaluates the th:text
	 * expression to render the value of the ${name} parameter that was set in the
	 * controller.
	 * 
	 * Added src/main/resources/templates/greeting.html To go along with this code
	 */

	@GetMapping("/greeting")
	public String greeting(@RequestParam(name = "name", required = false) String name, Model model) {
		model.addAttribute("name", name);
		return "greeting";
	}
}