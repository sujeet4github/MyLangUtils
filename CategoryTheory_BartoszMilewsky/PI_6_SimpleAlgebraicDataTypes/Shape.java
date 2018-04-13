// Challenge
// 2. Here’s a sum type defined in Haskell:
// data Shape = Circle Float
//            | Rect Float Float
// When we want to define a function like area that acts on a Shape, we do it by pattern matching on the two constructors:
//
// area :: Shape -> Float
// area (Circle r) = pi * r * r
// area (Rect d h) = d * h
//
// Implement Shape in C++ or Java as an interface and create two classes: Circle and Rect.
// Implement area as a virtual function.
//

// 3. Add circ to your C++ or Java implementation. What parts of the original code did you have to touch?
//

// Ex 4 - Continuing further: Add a new shape, Square, to Shape and make all the necessary updates.
// What code did you have to touch in Haskell vs. C++ or Java?
// (Even if you’re not a Haskell programmer, the modifications should be pretty obvious.)

interface IShape {
	String area();
	// For Ex 3:
	String circ();
}

class Circle implements IShape {

	public Circle(int r) {
		this.r = r;
	}

	private int r;

	public String area() {
		String rv = "Area of Circle = PI * " + r + " * " + r;
		return rv;
	}

	public String circ() {
		String rv = "Circumference of Circle = 2.0 * PI * " + r;
		return rv;
	}
}

class Rect implements IShape {

	public Rect (int d, int h) {
		this.d = d;
		this.h = h;
	}

	private int d, h;

	public String area() {
		String rv = "Area of Rect = " + d + " * " + h;
		return rv;
	}

	public String circ() {
		String rv = "Circumference of Rect = 2.0 * (" + d + " + " + h + ")";
		return rv;
	}
}

class Square implements IShape {

	public Square (int s) {
		this.s = s;
	}

	private int s;

	public String area() {
		String rv = "Area of Square = " + s + " * " + s;
		return rv;
	}

	public String circ() {
		String rv = "Circumference of Square = 4.0 * " + s;
		return rv;
	}
}

public class Shape {

	public static void main (String[] args) {

		IShape c = new Circle(10);
		System.out.println(c.area());

		IShape r = new Rect(3, 4);
		System.out.println(r.area());

		System.out.println(c.circ());
		System.out.println(r.circ());

		IShape s = new Square(5);
		System.out.println(s.area());
		System.out.println(s.circ());
	}
}

