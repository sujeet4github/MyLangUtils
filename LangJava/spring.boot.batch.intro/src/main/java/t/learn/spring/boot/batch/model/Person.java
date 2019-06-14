package t.learn.spring.boot.batch.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Person implements Serializable {

	private static final long serialVersionUID = 1L;

	private String lastName;
	private String firstName;

}
