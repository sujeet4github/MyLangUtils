package t.learn.spring.boot.batch.h2;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.batch.core.BatchStatus;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.listener.JobExecutionListenerSupport;
import org.springframework.batch.item.ItemProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import t.learn.spring.boot.batch.model.Person;

/**
 * @author ssukumaran
 *
 * @SpringBootApplication is a convenience annotation that adds all of the
 *                        following:
 * 
 *                        1. @Configuration tags the class as a source of bean
 *                        definitions for the application context.
 * 
 *                        2. @EnableAutoConfiguration tells Spring Boot to start
 *                        adding beans based on classpath settings, other beans,
 *                        and various property settings.
 * 
 *                        3. @ComponentScan tells Spring to look for other
 *                        components, configurations, and services in the hello
 *                        package, allowing it to find the controllers
 *
 *                        Normally you would add @EnableWebMvc for a Spring MVC
 *                        app, but Spring Boot adds it automatically when it
 *                        sees spring-webmvc on the classpath. This flags the
 *                        application as a web application and activates key
 *                        behaviors such as setting up a DispatcherServlet.
 */
@SpringBootApplication
public class App {

	public static void main(String[] args) {
		SpringApplication.run(App.class, args);
	}

}

/**
 * @author ssukumaran
 *
 *         A common paradigm in batch processing is to ingest data, transform
 *         it, and then pipe it out somewhere else.
 * 
 */
@Slf4j
class PersonItemProcessor implements ItemProcessor<Person, Person> {

	@Override
	public Person process(final Person person) throws Exception {

		final String firstName = person.getFirstName().toUpperCase();
		final String lastName = person.getLastName().toUpperCase();

		final Person transformedPerson = new Person(firstName, lastName);

		log.info("Converting (" + person + ") into (" + transformedPerson + ")");

		return transformedPerson;
	}

}

/**
 * @author ssukumaran
 *
 *         This code listens for when a job is BatchStatus.COMPLETED, and then
 *         uses JdbcTemplate to inspect the results
 */
@Component
@Slf4j
class JobCompletionNotificationListener extends JobExecutionListenerSupport {

	private final JdbcTemplate jdbcTemplate;

	@Autowired
	public JobCompletionNotificationListener(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public void afterJob(JobExecution jobExecution) {
		if (jobExecution.getStatus() == BatchStatus.COMPLETED) {
			log.info("!!! JOB FINISHED! Time to verify the results");

			jdbcTemplate
					.query("SELECT first_name, last_name FROM people",
							(rs, row) -> new Person(rs.getString(1), rs.getString(2)))
					.forEach(person -> log.info("Found <" + person + "> in the database."));
		}
	}
}
