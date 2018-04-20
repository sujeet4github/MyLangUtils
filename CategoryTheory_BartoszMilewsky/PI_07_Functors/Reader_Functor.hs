// In Haskell, a function type is constructed using the arrow type constructor (->)
// which takes two types:
//   the argument type and the result type.
// You’ve already seen it in infix form, a->b,
// but it can equally well be used in prefix form, when parenthesized: (->) a b
//
// Another explanation:
//  (->) is a type function:
//       a function that acts on types and produces a type.
// When you apply it to two types, a and b, you get a function type, a->b.
//

// We have to solve the following puzzle:
//    given a function f::a->b and a function g::r->a, create a function r->b.
//
// There is only one way we can compose the two functions, f . g
//
// fmap f g = f . g can be written in point-free notation as fmap = (.)
//
instance Functor ((->) r) where
    fmap = (.)

// This combination of the type constructor (->) r with the above implementation of fmap
// is called the *reader* functor.
