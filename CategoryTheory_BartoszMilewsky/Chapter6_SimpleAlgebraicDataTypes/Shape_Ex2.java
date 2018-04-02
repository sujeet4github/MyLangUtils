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

interface IShape {
	String area();
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
}

public class Shape_Ex2 {

	public static void main (String[] args) {

		IShape c = new Circle(10);
		System.out.println(c.area());

		IShape r = new Rect(3, 4);
		System.out.println(r.area());
	}
}

