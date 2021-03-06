Source:
- [Safari Book Video](http://my.safaribooksonline.com/video/programming/python/9780134175249)
- [Effective Python Book](http://www.effectivepython.com/)
- [Effective Python Book Source Code and Errata](https://github.com/bslatkin/effectivepython)
- by [Brett Slatkin](http://www.onebigfluke.com/)

Pythonic style === idomatic python

# From Book:

## Chapter 1: Pythonic Thinking
-------------------------------------------------------

The Python community has come to use the adjective Pythonic to describe code that follows a particular style. The idioms of Python have emerged over time through experience using the language and working with others. This chapter covers the best way to do the most common things in Python.

- 01 Know Which Version of Python You're Using
- 02 Follow the PEP 8 Style Guide
- 03 Know the Differences Between bytes, str, and unicode
- 04 Write Helper Functions Instead of Complex Expressions
- 05 Know How to Slice Sequences
- 06 Avoid Using start, end, and stride in a Single Slice
- 07 Use List Comprehensions Instead of map and filter
- 08 Avoid More Than Two Expressions in List Comprehensions
- 09 Consider Generator Expressions for Large Comprehensions
- 10 Prefer enumerate Over range
- 11 Use zip to Process Iterators in Parallel
- 12 Avoid else Blocks After for and while Loops
- 13 Take Advantage of Each Block in try/except/else/finally

=======================================================
## Chapter 2: Functions
-------------------------------------------------------
Functions in Python have a variety of extra features that make a programmer's life easier. Some are similar to capabilities in other programming languages, but many are unique to Python. This chapter covers how to use functions to clarify intention, promote reuse, and reduce bugs.

- 14 Prefer Exceptions to Returning None
- 15 Know How Closures Interact with Variable Scope
- 16 Consider Generators Instead of Returning Lists
- 17 Be Defensive When Iterating Over Arguments
- 18 Reduce Visual Noise with Variable Positional Arguments
- 19 Provide Optional Behavior with Keyword Arguments
- 20 Use None and Docstrings to Specify Dynamic Default Arguments
- 21 Enforce Clarity with Keyword-Only Arguments

=======================================================
## Chapter 3: Classes and Inheritance
-------------------------------------------------------
Python is an object-oriented language. Getting things done in Python often requires writing new classes and defining how they interact through their interfaces and hierarchies. This chapter covers how to use classes and inheritance to express your intended behaviors with objects.

- 22 Prefer Helper Classes Over Bookkeeping with Dictionaries and Tuples
- 23 Accept Functions for Simple Interfaces Instead of Classes
- 24 Use @classmethod Polymorphism to Construct Objects Generically
- 25 Initialize Parent Classes with super
- 26 Use Multiple Inheritance Only for Mix-in Utility Classes
- 27 Prefer Public Attributes Over Private Ones
- 28 Inherit from collections.abc for Custom Container Types

=======================================================
## Chapter 4: Metaclasses and Attributes
-------------------------------------------------------
Metaclasses and dynamic attributes are powerful Python features. However, they also enable you to implement extremely bizarre and unexpected behaviors. This chapter covers the common idioms for using these mechanisms to ensure that you follow the rule of least surprise.

- 29 Use Plain Attributes Instead of Get and Set Methods
- 30 Consider @property Instead of Refactoring Attributes
- 31 Use Descriptors for Reusable @property Methods
- 32 Use `__getattr__`, `__getattribute__`, and `__setattr__` for Lazy Attributes
- 33 Validate Subclasses with Metaclasses
- 34 Register Class Existence with Metaclasses
- 35 Annotate Class Attributes with Metaclasses

=======================================================
## Chapter 5: Concurrency and Parallelism
-------------------------------------------------------

Python makes it easy to write concurrent programs that do many different things seemingly at the same time. Python can also be used to do parallel work through system calls, subprocesses, and C-extensions. This chapter covers how to best utilize Python in these subtly different situations.

- 36 Use subprocess to Manage Child Processes
- 37 Use Threads for Blocking I/O, Avoid for Parallelism
- 38 Use Lock to Prevent Data Races in Threads
- 39 Use Queue to Coordinate Work Between Threads
- 40 Consider Coroutines to Run Many Functions Concurrently
- 41 Consider concurrent.futures for True Parallelism

=======================================================
## Chapter 6: Built-in Modules
-------------------------------------------------------

Python is installed with many of the important modules that you'll need to write programs. These standard packages are so closely intertwined with idiomatic Python that they may as well be part of the language specification. This chapter covers the essential built-in modules.

- 42 Define Function Decorators with functools.wraps
- 43 Consider contextlib and with Statements for Reusable try/finally Behavior
- 44 Make pickle Reliable with copyreg
- 45 Use datetime Instead of time for Local Clocks
- 46 Use Built-in Algorithms and Data Structures
- 47 Use decimal When Precision is Paramount
- 48 Know Where to Find Community-Built Modules

=======================================================
## Chapter 7: Collaboration
-------------------------------------------------------

Collaborating on Python programs requires you to be deliberate about how you write your code. Even if you're working alone, you'll want to understand how to use modules written by others. This chapter covers the standard tools and best practices that enable people to work together on Python programs.

- 49 Write Docstrings for Every Function, Class, and Module
- 50 Use Packages to Organize Modules and Provide Stable APIs
- 51 Define a Root Exception to Insulate Callers from APIs
- 52 Know How to Break Circular Dependencies
- 53 Use Virtual Environments for Isolated and Reproducible Dependencies

=======================================================
## Chapter 8: Production
-------------------------------------------------------

Python has facilities for adapting to multiple deployment environments. It also has built-in modules that aid in hardening your programs and making them bulletproof. This chapter covers how to use Python to debug, optimize, and test your programs to maximize quality and performance at runtime.

- 54 Consider Module-Scoped Code to Configure Deployment Environments
- 55 Use repr Strings for Debugging Output
- 56 Test Everything with unittest
- 57 Consider Interactive Debugging with pdb
- 58 Profile Before Optimizing
- 59 Use tracemalloc to Understand Memory Usage and Leaks

=======================================================

# From Video:

## Lesson 1: Using Expressions and Statements
-------------------------------------------------------

1. 05 Know How to Slice Sequences
	- somelist[start:end]
	- start and end are inclusive index
	- works with any class that defines `__getitem__`
		- list, tuple, str, bytes

2. 06 Avoid Using start, end, and stride in a Single Slice

3. 10 Prefer enumerate Over range

4. 11 use ZIP to process iterators in parallel

5. 12 avoid using ELSE blocks after FOR and WHILE loops

6. 13 take advantage of each block in TRY/EXCEPT/ELSE/FINALLY

7. 43 consider CONTEXTLIB and with statements for reusable TRY/FINALLY behavior

=======================================================
## Lesson 2 - Using Comprehensions and Generators
-------------------------------------------------------

8. 07 Use List Comprehensions Instead of map and filter

9. 08 Avoid More Than Two Expressions in List Comprehensions

10. 09 Consider Generator Expressions for Large Comprehensions

11. 16 Consider Generators Instead of Returning Lists

12. 17 Be Defensive When Iterating Over Arguments

=======================================================
## Lesson 3 - Using Functions
-------------------------------------------------------

13. 15 Know How Closures Interact with Variable Scope

14. 23 Accept Functions for Simple Interfaces Instead of Classes

15. 18 Reduce Visual Noise with Variable Positional Arguments

16. 19 Provide Optional Behavior with Keyword Arguments
	- can specify default values for arguments.
	- makes calling code more readable

17. 21 Enforce Clarity with Keyword-Only Arguments

18. 20 Use None and Docstrings to Specify Dynamic Default Arguments

=======================================================
## Lesson 4 - Using Classes
-------------------------------------------------------

19. 22 Prefer Helper Classes Over Bookkeeping with Dictionaries and Tuples

20. 29 Use Plain Attributes Instead of Get and Set Methods

21. 27 Prefer Public Attributes Over Private Ones
	- Python only has public and private
	- private is more a guideline, not a real compiler protection
	- pepe style guide: (again guidelines, not enforced)
	 - __private_field
	 - _protected_field (for access by subclasses)
	 - public_field

22. 24 Use @classmethod Polymorphism to Construct Objects Generically

=======================================================
## Lesson 5 - Working with Concurrency and Parallelism
-------------------------------------------------------

23. 36 Use subprocess to Manage Child Processes

24. 37 Use Threads for Blocking I/O, Avoid for Parallelism
	- global interpreter lock
	 - python does not let multiple threads run in parallel unless it is IO blocked
	- for true parallelism see item 27/41 below

25. 38 Use Lock to Prevent Data Races in Threads
	- use this, dont depend on the global interpreter lock

26. 39 Use Queue to Coordinate Work Between Threads

27. 41 Consider concurrent.futures for True Parallelism
	- by passes the global interpreter lock by creating a child process :-)
	- This creates a child python interpreter process that is a child of the
	   main interpreter process.
	- Data serialization (using pickle module) and transfer
		happens between these processes.
	- when to use this?
		- functions are isolated => dont share state - to reduce the data transfer
		- functions are high leveraged => small amt of data -> large amt of computation

=======================================================
## Lesson 6 - Making Programs Robust
-------------------------------------------------------

28. 53 Use Virtual Environments for Isolated and Reproducible Dependencies
	- pyenv <folder> ... source bin/activate to activate the virtual env
	- how to reproduce an env?
	  - this puts out libraries with versions on to a text file
		```pip3 freeze > requirements.txt```
		- this file can be checked in...
		- when recreating...
		```
		pyenv otherproject
		cd other project
		source bin/activate
		pip3 list
		pip3 install -r requirements.txt
		pip3 list
		```
	- how to upgrade python within this env?

29. 56 Test Everything with unittest
30. 57 Consider Interactive Debugging with pdb
31. 58 Profile Before Optimizing
32. 59 Use tracemalloc to Understand Memory Usage and Leaks

=======================================================
