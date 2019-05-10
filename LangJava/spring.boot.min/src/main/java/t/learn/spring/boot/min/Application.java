package t.learn.spring.boot.min;

import java.util.Arrays;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;

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
