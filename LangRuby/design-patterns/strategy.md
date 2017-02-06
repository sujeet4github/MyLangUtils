# Strategy Pattern

## Problem
We need to vary part of an algorithm, something we previously solved using the [Template Method](template_method.md) pattern, although we want to avoid its drawbacks, introduced by the fact that it's built around inheritance.

## Solution
To avoid problems introduced by inheritance we should use delegation. So, instead of creating subclasses (like in the Template Method pattern), we tear out the varying part of the code and isolate it in its own class, creating one of them for each variation. The key idea of the Strategy pattern is to define a family of objects (strategies), which all do (almost) the same thing and support the same interface. Then, the user of the strategy (context) can treat the strategies as interchangeable parts.

## Limitation

## Demo Implementation

### The Report class
02-S-Report.rb

### The Formatter Implementations
02-S-HTMLFormatter.rb
02-S-PlainTextFormatter.rb

### The Report Driver
02-S-ReportDriver.rb
