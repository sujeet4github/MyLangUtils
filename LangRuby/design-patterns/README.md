# Design Patterns in Ruby

Original at: (https://github.com/davidgf/design-patterns-in-ruby/blob/master/README.md)

Summary of the design patterns explained in the book [Design Patterns in Ruby](http://designpatternsinruby.com/), where [Russ Olsen](http://russolsen.com/) explains and adapts to Ruby 14 of the original 23 GoF design patterns.

## Design Patterns

* [Template Method](template_method.md): redefines certain steps of an algorithm without changing the algorithm's structure
* [Strategy](strategy.md): varies part of an algorithm at runtime
* [Observer](observer.md): helps building a highly integrated system, maintainable and avoids coupling between classes
* [Composite](composite.md): builds a hierarchy of tree objects and interacts with all them the same way
* [Iterator](iterator.md): provides a way to access a collection of sub-objects without exposing the underlaying representation
* [Command](command.md): performs some specific task without having any information about the receiver of the request
* [Adapter](adapter.md): helps two incompatible interfaces to work together
* [Proxy](proxy.md): allows us having more control over how and when we access to a certain object
* [Decorator](decorator.md): vary the responsibilities of an object adding some features
* [Singleton](singleton.md): have a single instance of certain class across the application
* [Factory](factory.md): create objects without having to specify the exact class of the object that will be created
* [Builder](builder.md): create complex objects that are hard to configure.
