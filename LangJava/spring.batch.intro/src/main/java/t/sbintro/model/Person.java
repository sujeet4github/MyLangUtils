package t.sbintro.model;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Objects;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

/**
 * @author ssukumaran
 *
 *         The way Lombok works is by plugging into your build process and
 *         autogenerating Java bytecode into your .class files as per a number
 *         of project annotations you introduce in your code.
 * 
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
public class Person implements Serializable {

	private static final long serialVersionUID = 1L;

	
	private @NonNull BigInteger id;
	private String lastName;
	private String firstName;

	public Person(String firstName, String lastName) {
		this(null, firstName, lastName);
	}

	public Person(String idStr, String firstName, String lastName) {

		if (Objects.nonNull(idStr))
			this.id = new BigInteger(idStr);

		this.firstName = firstName;
		this.lastName = lastName;
	}
}
