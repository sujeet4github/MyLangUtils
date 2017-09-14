package t.spr5.app

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.context.annotation.Bean
import t.spr5.controllers.*

@SpringBootApplication
class Application {
	@Bean
	fun controller() = AppController()
}

fun main(args: Array<String>) {
	SpringApplication.run(Application::class.java, *args)
}


/** Another Way
// This class must not be final or Spring Boot is not happy.
open class Application {

	companion object {
		@JvmStatic
		fun main(args: Array<String>) {
    			SpringApplication.run(Application::class.java, *args)
		}
	}
}

*/