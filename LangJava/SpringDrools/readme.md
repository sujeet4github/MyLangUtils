Drools Tutorial
===============

** UPDATED by spring.boot.drools project

This is deprecated....

To run:
	mvn clean -Dtest=**IntegrationTest test
	OR
	mvn clean package
	java -jar target\drools-1.0.0-SNAPSHOT-spring-boot.jar

Start from SimpleDrools, trying to move over the code into spring.

http://www.baeldung.com/drools-spring-integration

see *AppConfiguration.java* for code for following:

KieServices is a singleton which acts as a single point entry to get all services provided by Kie. KieServices is retrieved using KieServices.Factory.get().

KieContainer is a placeholder for all the objects that we need to run the rule engine.
KieContainer is built with the help of other beans including KieFileSystem, KieBuilder, and KieModule.

KieModule is a container of all the resources which are required to define rule knowledge known as KieBase.
KieBase is a repository which contains all knowledge related to the application such as rules, processes, functions, type models and it is hidden inside KieModule.
The KieBase can be obtained from the KieContainer.

KieSession is created using KieContainer instance.
A KieSession instance is a place where input data can be inserted.
The KieSession interacts with the engine to process the actual business logic defined in rule based on inserted Facts.

