package t.drools.app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import t.drools.model.*;
import t.drools.service.TaxiFareCalculatorService;
import t.drools.service.BackwardChainingService;
import t.drools.service.AppConfiguration;

public class ApplicationRunner {

    public static void main(String[] args) {

        ApplicationContext context = new AnnotationConfigApplicationContext(AppConfiguration.class);

        TaxiFareCalculatorService taxiFareCalculatorService = (TaxiFareCalculatorService) context.getBean(TaxiFareCalculatorService.class);
        TaxiRide taxiRide = new TaxiRide();
        taxiRide.setIsNightSurcharge(true);
        taxiRide.setDistanceInMile(190L);
        Fare rideFare = new Fare();
        taxiFareCalculatorService.calculateFare(taxiRide, rideFare);

        BackwardChainingService backwardChainingService = (BackwardChainingService) context.getBean(BackwardChainingService.class);
        Result result = backwardChainingService.process();
        System.out.println(result.getValue());
        result.getFacts()
            .stream()
            .forEach(System.out::println);
    }

}