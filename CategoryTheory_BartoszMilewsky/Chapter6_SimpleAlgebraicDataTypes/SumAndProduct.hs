// We have the sum types with Void as the neutral element,
// and the product types with the unit type, (), as the neutral element.
// We’d like to think of them as analogous to addition and multiplication.
// In this analogy, Void would correspond to zero, and unit, (), to one.

// Let’s see how far we can stretch this analogy.

// For instance, does multiplication by zero give zero?
// In other words, is a product type with one component being Void isomorphic to Void?
// For example, is it possible to create a pair of, say Int and Void?
// To create a pair you need two values.
// Although you can easily come up with an integer, there is no value of type Void.
// Therefore, for any type a, the type (a, Void) is uninhabited — has no values —
// and is therefore equivalent to Void. In other words, a*0 = 0.

// Distributive property of * over +
// a * (b + c) = a * b + a * c
//
// Does it also hold for product and sum types?
// Yes, it does — up to isomorphisms, as usual. The left hand side corresponds to the type:
//
// (a, Either b c)
//
// and the right hand side corresponds to the type:
// 
// Either (a, b) (a, c)

prodToSum :: (a, Either b c) -> Either (a, b) (a, c)
prodToSum (x, e) =
   case e of
      Left  y -> Left  (x, y)
      Right z -> Right (x, z)

sumToProduct :: Either (a, b) (a, c) -> (a, Either b c) 
sumToProduct Left  (a, b) = (a, Left  b)
sumToProduct Right (a, c) = (a, Right c)
