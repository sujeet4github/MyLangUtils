package t.drools.service;

import org.kie.api.KieServices;
import org.kie.api.builder.KieBuilder;
import org.kie.api.builder.KieFileSystem;
import org.kie.api.builder.KieModule;
import org.kie.api.runtime.KieContainer;
import org.kie.internal.io.ResourceFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import java.util.Arrays;
import java.util.List;

@Configuration
@ComponentScan("t.drools.service")
public class AppConfiguration {

    @Bean
    public KieContainer kieContainer() {

    	String rulesPath = "t/drools/rules/";
        List<String> rules=Arrays.asList(
			"BackwardChaining.drl",
			"SuggestApplicant.drl",
			"TAXI_FARE_RULE.drl",
			"Product_rules.xls");

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
}