package greeter

import groovy.transform.CompileStatic

@CompileStatic
public class GreetingFormatter {
    static String greeting(final String name) {
        "Hello, ${name.capitalize()}"
    }
}
