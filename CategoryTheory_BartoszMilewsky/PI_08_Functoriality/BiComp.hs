// We’ve already seen that a composition of functors is a functor — we can easily convince ourselves
// that the same is true of bifunctors.

// Given two morphisms, we simply lift one with one functor and the other with the other functor.
// We then lift the resulting pair of lifted morphisms with the bifunctor.

// We can express this composition in Haskell.
// Let’s define a data type that is parameterized by
//  a bifunctor bf (it’s a type variable that is a type constructor that takes two types as arguments),
//  two functors fu and gu (type constructors that take one type variable each),
//  and two regular types a and b.
//
// We apply fu to a and gu to b, and then apply bf to the resulting two types:

newtype BiComp bf fu gu a b = BiComp (bf (fu a) (gu b))

// BiComp Either (Const ()) Identity a b
//          - bf = Either
//          - fu = Const ()
//          - gu = Identity
//    = BiComp (Either (Const () a) (Identity b)) 
//    = BiComp (Either () b)
//    = BiComp (Maybe b)
//
// See Ex_2.hs for proof of this isomorphism

// The new data type BiComp is a bifunctor in a and b, but only if bf is itself a Bifunctor and fu and gu are Functors.
// The compiler must know that there will be a definition of bimap available for bf,
// and definitions of fmap for fu and gu.
//
// In Haskell, this is expressed as a precondition in the instance declaration:
// a set of class constraints followed by a double arrow:
//
instance (Bifunctor bf, Functor fu, Functor gu) =>
  Bifunctor (BiComp bf fu gu) where
    bimap f1 f2 (BiComp x) = BiComp ((bimap (fmap f1) (fmap f2)) x)

// The implementation of bimap for BiComp is given in terms of bimap for bf and the two fmaps for fu and gu.
// The compiler automatically infers all the types and picks the correct overloaded functions whenever BiComp is used.

// The x in the definition of bimap has the type:
// bf (fu a) (gu b)

// If the types of f1 and f2 are:
// 
// f1 :: a -> a'
// f2 :: b -> b'
// then the final result is of the type bf (fu a') (gu b')
// 
// bimap :: (fu a -> fu a')
//          -> (gu b -> gu b') 
//          -> bf (fu a) (gu b) -> bf (fu a') (gu b')
