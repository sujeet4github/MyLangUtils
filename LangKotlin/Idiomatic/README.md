#About
From:
 Blogpost:
  https://blog.philipphauer.de/idiomatic-kotlin-best-practices/
 Github:
  https://github.com/phauer/blog-related/tree/master/kotlin-idiomatic/src/main/kotlin/idiomaticKotlin

# Idioms
## Use Expressions

## Use apply() for Grouping Object Initialization

The extension function apply() helps to group and centralize initialization code for an object. Besides, we don’t have to repeat the variable name over and over again.

See Apply.kt


# Kotlin’s Built-in Support for Common Java Idioms and Patterns

In Java, we have to write quite some boilerplate code to implemented certain idioms and patterns.
Fortunately, many patterns are built-in right into Kotlin’s language or its standard library.

|Java Idiom or Pattern 			| Idiomatic Solution in Kotlin
|Optional				| Nullable Types
|Getter, Setter, Backing Field		| Properties
|Static Utility Class			| Top-Level (extension) functions
|Immutability, Value Objects		| data class with immutable properties, copy()
|Fluent Setter (Wither)			| Named and default arguments, apply()
|Method Chaining			| Default arguments
|Singleton				| object
|Delegation				| Delegated properties by
|Lazy Initialization (thread-safe)	| Delegated properties by: lazy()
|Observer 				| Delegated properties by: Delegates.observable()

# Functional Programming
In contrast to Java 8, Kotlin has way better support for functional programming:

    Immutability: val for variables and properties, immutable data classes, copy()
    Expressions: Single expression functions. if, when and try-catch are expressions. We can combine these control structures with other expressions concisely.
    Function Types
    Concise Lambda Expressions
    Kotlin’s Collection API
