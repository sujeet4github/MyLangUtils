package t.learn.spring.boot.drools;

import java.util.Arrays;
import java.util.List;

import org.kie.api.KieServices;
import org.kie.api.builder.KieBuilder;
import org.kie.api.builder.KieFileSystem;
import org.kie.api.builder.KieModule;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.kie.internal.io.ResourceFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import t.learn.spring.boot.drools.model.Fact;
import t.learn.spring.boot.drools.model.Fare;
import t.learn.spring.boot.drools.model.Result;
import t.learn.spring.boot.drools.model.TaxiRide;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

    @Bean
    public KieContainer kieContainer() {

    	String rulesPath = "t/drools/rules/";
        List<String> rules=Arrays.asList(
			"BackwardChaining.drl",
			"SuggestApplicant.drl",
			"TAXI_FARE_RULE.drl",
			"Discount.xls");

        KieServices kieServices = KieServices.Factory.get();

        KieFileSystem kieFileSystem = kieServices.newKieFileSystem();

		for (String filename:rules) {
			kieFileSystem.write(
				ResourceFactory.newClassPathResource(
					rulesPath + filename));
		}

        KieBuilder kieBuilder = kieServices.newKieBuilder(kieFileSystem);
        kieBuilder.buildAll();
        KieModule kieModule = kieBuilder.getKieModule();

        return kieServices.newKieContainer(kieModule.getReleaseId());

    }

	@Bean
	public CommandLineRunner commandLineRunner(ApplicationContext ctx) {

		return args -> {
			System.out.println("Lets inspect beans provided by spring boot:");
			
			var beanNames = ctx.getBeanDefinitionNames();
			Arrays.sort(beanNames);
			for (var beanName : beanNames)
				System.out.println(beanName);

	        TaxiFareCalculatorService taxiFareCalculatorService = (TaxiFareCalculatorService) ctx.getBean(TaxiFareCalculatorService.class);
	        TaxiRide taxiRide = new TaxiRide();
	        taxiRide.setIsNightSurcharge(true);
	        taxiRide.setDistanceInMile(190L);
	        Fare rideFare = new Fare();
	        taxiFareCalculatorService.calculateFare(taxiRide, rideFare);

	        BackwardChainingService backwardChainingService = (BackwardChainingService) ctx.getBean(BackwardChainingService.class);
	        Result result = backwardChainingService.process();
	        System.out.println(result.getValue());
	        result.getFacts()
	            .stream()
	            .forEach(System.out::println);
		};
	}
}

@Service
class BackwardChainingService {

    @Autowired
    private KieContainer kContainer;

    public Result process() {

        KieSession kieSession = kContainer.newKieSession();

    	Result result = new Result();

        kieSession.setGlobal("result", result);
        kieSession.insert(new Fact("Asia", "Planet Earth"));
        kieSession.insert(new Fact("China", "Asia"));
        kieSession.insert(new Fact("Great Wall of China", "China"));

        kieSession.fireAllRules();
        kieSession.dispose();

        return result;
    }
}

@Service
class TaxiFareCalculatorService {

    @Autowired
    private KieContainer kContainer;

    public Long calculateFare(TaxiRide taxiRide, Fare rideFare) {
        KieSession kieSession = kContainer.newKieSession();
        kieSession.setGlobal("rideFare", rideFare);
        kieSession.insert(taxiRide);
        kieSession.fireAllRules();
        kieSession.dispose();
        System.out.println("!! RIDE FARE !! " + rideFare.getTotalFare());
        return rideFare.getTotalFare();
    }
}