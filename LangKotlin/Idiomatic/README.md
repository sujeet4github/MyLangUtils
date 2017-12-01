#About
From:
 Blogpost:
  https://blog.philipphauer.de/idiomatic-kotlin-best-practices/
 Github:
  https://github.com/phauer/blog-related/tree/master/kotlin-idiomatic/src/main/kotlin/idiomaticKotlin

# Kotlin�s Built-in Support for Common Java Idioms and Patterns

In Java, we have to write quite some boilerplate code to implemented certain idioms and patterns.
Fortunately, many patterns are built-in right into Kotlin's language or its standard library.

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

# Idioms

## Destructuring

See Destructuring.kt

## Functional Programming
In contrast to Java 8, Kotlin has way better support for functional programming:

    Immutability: val for variables and properties, immutable data classes, copy()
    Expressions: Single expression functions. if, when and try-catch are expressions. We can combine these control structures with other expressions concisely.
    Function Types
    Concise Lambda Expressions
    Kotlin's Collection API

See FunctionalProgramming.kt

## Use Expressions

See about topic in <<linkTo:Functional Programming>>

## Top Level Functions for Utility Functions

No need for static functions to be in classes:
See TopLevelExtensionFunctions.kt

## Named Arguments instead of Fluent Setter

no need for fluent setters now
See NamedArgs.kt

### Use apply() for Grouping Object Initialization

The extension function apply() helps to group and centralize initialization code for an object. Besides, we don't have to repeat the variable name over and over again.

See Apply.kt

## Dont overload for Default Arguments (method or constructor chaining)

See DefaultArgs.kt

## Dealing with Nullability

See Nullability.kt for all 4 points below:

### Avoid if-null checks

Every time you write an if-null check, hold on. Kotlin provides much better ways to handle nulls. Often, you can use a null-safe call ?. or the elvis operator ?: instead.

### Avoid if-type checks

Use as? and ?:

### Avoid not-null assertions

Designers of kotlin deliberably used !!. as nudge to find a better solution

### consider let()

## Leverage Value Objects

Even for value objects containing only a single property.

See ValueObjects.kt

## Concise Mapping with Single Expression Functions

See Mapping.kt

With single expression functions and named arguments we can write easy, concise and readable mappings between objects
 see mapToDTO2 in Mapping.kt

If you prefer extension functions, you can use them here to make both the function definition and the usage even shorter and more readable. At the same time, we don't pollute our value object with the mapping logic.
 see "fun SnippetEntity.toDTO()" in Mapping.kt

## Refer to Constructor Parameters in Property Initializers

See InitBlock.kt

Think twice before you define a constructor body (init block) only to initialize properties.
 see UsersClient2 in InitBlock.kt

## object for Stateless Interface Implementations

see ObjectForStatelessFWImpls.kt
Kotlin's object comes in handy when we need to implement a framework interface that doesn't have any state
 see StringToInstantConverter

See blog https://blog.philipphauer.de/kotlin-practice-spring-boot-vaadin/
 for Kotlin, Spring Boot, Vaadin

## Destructuring

see Destructuring.kt

## Ad-Hoc creation of Structs

listOf, mapOf and the infix function to can be used to create structs (like JSON) quite concisely. Well, it's still not as compact as in Python or JavaScript, but way better than in Java.

see Structs.kt
