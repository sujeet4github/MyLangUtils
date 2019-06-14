package t.sbintro.sqlite;

import java.net.MalformedURLException;

import javax.sql.DataSource;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.launch.support.SimpleJobLauncher;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.batch.core.repository.support.JobRepositoryFactoryBean;
import org.springframework.batch.support.transaction.ResourcelessTransactionManager;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.datasource.init.DataSourceInitializer;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.transaction.PlatformTransactionManager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Main {

	public static void main(String[] args) {

		try (AnnotationConfigApplicationContext springContext = new AnnotationConfigApplicationContext(
				SpringBatchSqlLiteConfig.class, SpringBatchJobLoadPersonsConfig.class)) {

			final JobLauncher jobLauncher = (JobLauncher) springContext.getBean("jobLauncher");
			final Job job = (Job) springContext.getBean(SpringBatchJobLoadPersonsConfig.JOB_NAME);
			runBatchJob(jobLauncher, job);
		}
		log.info("done with main {}", args.length);
	}

	private static void runBatchJob(final JobLauncher jobLauncher, final Job job) {

		log.info("Starting the batch job {}.", job.getName());

		try {

			final JobExecution execution = jobLauncher.run(job, new JobParameters());

			log.info("Job Status : {}.", execution.getStatus());
			log.info("Job succeeded");

		} catch (final Exception e) {
			e.printStackTrace();
			log.error("Job failed. {}", e.getMessage());
		}
	}
}

/**
 * 
 * @author ssukumaran
 *
 *         the @EnableBatchProcessing annotation adds many critical beans that
 *         support jobs and saves you a lot of leg work. We are not using the in-memory
 *         database provided by @EnableBatchProcessing, rather we are using a SQLite DB.
 */
@Configuration
@EnableBatchProcessing
class SpringBatchSqlLiteConfig {

	// Set up Spring Batch required DB tables...
	// BEGIN-{
    @Value("org/springframework/batch/core/schema-drop-sqlite.sql")
    private Resource dropRepositoryTables;

    @Value("org/springframework/batch/core/schema-sqlite.sql")
    private Resource dataRepositorySchema;

    @Value("schema-sqlite.sql")
    private Resource applicationSchema;

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.sqlite.JDBC");
        dataSource.setUrl("jdbc:sqlite:repository.sqlite");
        return dataSource;
    }

    // Create job-meta-tables automatically if needed
    @Bean
    public DataSourceInitializer dataSourceInitializer(DataSource dataSource) throws MalformedURLException {
        ResourceDatabasePopulator databasePopulator = new ResourceDatabasePopulator();

        databasePopulator.addScript(dropRepositoryTables);
        databasePopulator.addScript(dataRepositorySchema);
        databasePopulator.addScript(applicationSchema);
        databasePopulator.setIgnoreFailedDrops(true);

        DataSourceInitializer initializer = new DataSourceInitializer();
        initializer.setDataSource(dataSource);
        initializer.setDatabasePopulator(databasePopulator);

        return initializer;
    }

    // job-meta-data in database
    private JobRepository getJobRepository() throws Exception {
        JobRepositoryFactoryBean factory = new JobRepositoryFactoryBean();
        factory.setDataSource(dataSource());
        factory.setTransactionManager(getTransactionManager());
        // JobRepositoryFactoryBean's methods Throws Generic Exception,
        // it would have been better to have a specific one
        factory.afterPropertiesSet();
        return (JobRepository) factory.getObject();
    }

    private PlatformTransactionManager getTransactionManager() {
        return new ResourcelessTransactionManager();
    }
	// END-}

    public JobLauncher getJobLauncher() throws Exception {
        SimpleJobLauncher jobLauncher = new SimpleJobLauncher();
        // SimpleJobLauncher's methods Throws Generic Exception,
        // it would have been better to have a specific one
        jobLauncher.setJobRepository(getJobRepository());
        jobLauncher.afterPropertiesSet();
        return jobLauncher;
    }

}