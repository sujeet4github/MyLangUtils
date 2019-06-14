package t.sbintro.sqlite;

import javax.sql.DataSource;

import org.springframework.batch.core.BatchStatus;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.launch.support.RunIdIncrementer;
import org.springframework.batch.core.listener.JobExecutionListenerSupport;
import org.springframework.batch.item.ItemProcessor;
import org.springframework.batch.item.database.BeanPropertyItemSqlParameterSourceProvider;
import org.springframework.batch.item.database.JdbcBatchItemWriter;
import org.springframework.batch.item.database.builder.JdbcBatchItemWriterBuilder;
import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.batch.item.file.builder.FlatFileItemReaderBuilder;
import org.springframework.batch.item.file.mapping.BeanWrapperFieldSetMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.core.JdbcTemplate;

import lombok.extern.slf4j.Slf4j;
import t.sbintro.model.Person;

@Configuration
public class SpringBatchJobLoadPersonsConfig {

	static public final String JOB_NAME = "importUserJob";

	@Autowired
	private JobBuilderFactory jobBuilderFactory;

	@Autowired
	private StepBuilderFactory stepBuilderFactory;

	@Value("input/people/sample-data.csv")
	private Resource inputCsv;

	// tag::readerwriterprocessor[]
	@Bean
	public FlatFileItemReader<Person> reader() {

		String readerName = "personItemReader";

		String[] fieldNames = new String[] { "firstName", "lastName" };

		// @formatter:off
		return new FlatFileItemReaderBuilder<Person>().name(readerName).resource(inputCsv).delimited().names(fieldNames)
				.fieldSetMapper(new BeanWrapperFieldSetMapper<Person>() {
					{
						setTargetType(Person.class);
					}
				}).build();
		// @formatter:on
	}

	@Bean
	public ItemProcessor<Person, Person> itemProcessor() {
		return new PersonItemProcessor();
	}

	@Bean
	public JdbcBatchItemWriter<Person> writer(DataSource dataSource) {

		// dataSource is the one created by @EnableBatchProcessing (in-memory)

		// @formatter:off
		return new JdbcBatchItemWriterBuilder<Person>()
				.itemSqlParameterSourceProvider(new BeanPropertyItemSqlParameterSourceProvider<>())
				.sql("INSERT INTO people (first_name, last_name) VALUES (:firstName, :lastName)").dataSource(dataSource)
				.build();
		// @formatter:on
	}
	// end::readerwriterprocessor[]

	// tag::jobstep[]

	@Bean
	public Job importUserJob(JobCompletionNotificationListener listener, Step step1) {

		// @formatter:off
		return jobBuilderFactory.get(JOB_NAME).incrementer(new RunIdIncrementer()).listener(listener).flow(step1).end()
				.build();
		// @formatter:on
	}

	@Bean
	public Step step1(JdbcBatchItemWriter<Person> writer) {
		// @formatter:off
		return stepBuilderFactory.get("step1").<Person, Person>chunk(10).reader(reader()).processor(itemProcessor())
				.writer(writer).build();
		// @formatter:on
	}
	// end::jobstep[]

	@Bean
	public JdbcTemplate jdbcTemplate(DataSource dataSource) {
		return new JdbcTemplate(dataSource);
	}

	@Bean
	public JobCompletionNotificationListener jobCompletionNotificationListener(JdbcTemplate jdbcTemplate) {
		return new JobCompletionNotificationListener(jdbcTemplate);
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
					.query("SELECT person_id, first_name, last_name FROM people",
							(rs, row) -> new Person(rs.getString(1), rs.getString(2), rs.getString(3)))
					.forEach(person -> log.info("Found <" + person + "> in the database."));
		}
	}
}
