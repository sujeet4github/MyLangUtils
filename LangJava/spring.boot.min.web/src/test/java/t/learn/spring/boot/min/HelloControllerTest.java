package t.learn.spring.boot.min;

import static org.hamcrest.Matchers.equalTo;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class HelloControllerTest {

	/*
	 * The MockMvc comes from Spring Test and allows you, via a set of convenient
	 * builder classes, to send HTTP requests into the DispatcherServlet and make
	 * assertions about the result.
	 * 
	 * Note the use of the @AutoConfigureMockMvc together with @SpringBootTest to
	 * inject a MockMvc instance.
	 * 
	 * Having used @SpringBootTest we are asking for the whole application context
	 * to be created. An alternative would be to ask Spring Boot to create only the
	 * web layers of the context using the @WebMvcTest.
	 */

	@Autowired
	private MockMvc mvc;

	@Test
	public void getHello() throws Exception {

		mvc.perform(MockMvcRequestBuilders.get("/").accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk())
				.andExpect(content().string(equalTo("Greetings from S Boot!")));
	}
}
