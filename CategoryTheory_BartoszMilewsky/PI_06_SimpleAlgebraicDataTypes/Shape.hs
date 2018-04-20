// Ex 2 - 
// Here’s a sum type defined in Haskell:
//
data Shape = Circle Float
           | Rect Float Float
           | Square Float

// When we want to define a function like area that acts on a Shape,
// we do it by pattern matching on the two constructors:
//
area :: Shape -> Float
area (Circle r) = pi * r * r
area (Rect d h) = d * h
area (Square s) = s * s

// Implement this in Java/C++ as interface and 2 classes
//   - Shape_Ex2.java

// Ex 3 -
// We can easily add a new function circ that calculates the circumference of a Shape.
// We can do it without touching the definition of Shape:
//
circ :: Shape -> Float
circ (Circle r) = 2.0 * pi * r
circ (Rect d h) = 2.0 * (d + h)
circ (Square s) = 4 * s

// Add this to your C++/Java implementation. What parts of the original code did you have to touch
//
//   - Shape_Ex2.java

// Ex 4 - Continuing further: Add a new shape, Square, to Shape and make all the necessary updates.
// What code did you have to touch in Haskell vs. C++ or Java?
// (Even if you’re not a Haskell programmer, the modifications should be pretty obvious.)
