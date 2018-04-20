{-# LANGUAGE DeriveFunctor #-}

type Writer a = (a, String)

// the Writer type constructor is functorial in a.
// We don’t have to implement fmap for it, because it’s just a simple product type.
//

// A Kleisli category, being a category, defines composition and identity.
//
// composition via fish operator
(>=>) :: (a -> Writer b) -> (b -> Writer c) -> (a -> Writer c)
m1 >= m2 = \x ->
            let   (y, s1) = m1 x
                  (z, s2) = m2 y
            in (z, s1 ++ s2)

// identity via return
return :: a -> Writer a
return x = (x, "")



// The fmap for Writer would be defined as:
fmap :: (a -> b) -> Writer a -> Writer b
fmap f = id >=> (\x -> return (f x))

// Here, the fish operator combines two functions:
// one of them is the familiar id,
// and the other is a lambda that applies return to the result of acting with f on the lambda’s argument.

// Here id will take Writer a and turn it into Writer a.
// The fish operator will fish out the value of a and pass it as x to the lambda.
// There, f will turn it into a b and return will embellish it, making it Writer b.
// Putting it all together, we end up with a function that takes Writer a and returns Writer b,
// exactly what fmap is supposed to produce.

// Notice that this argument is very general: you can replace Writer with any type constructor.
// As long as it supports a fish operator and return, you can define fmap as well. So the embellishment
// in the Kleisli category is always a functor.
// (Not every functor, though, gives rise to a Kleisli category.)

// You might wonder if the fmap we have just defined is the same fmap the compiler would have
// derived for us with deriving Functor. Interestingly enough, it is. This is due to the way
// Haskell implements polymorphic functions. It’s called parametric polymorphism, and it’s a
// source of so called theorems for free.
// One of those theorems says that, if there is an implementation of fmap for a given type
// constructor, one that preserves identity, then it must be unique.
