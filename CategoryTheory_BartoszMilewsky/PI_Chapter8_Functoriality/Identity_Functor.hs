// I mentioned the identity functor previously, as the identity morphism in Cat, but didn’t give its definition in Haskell.

// Here it is:

data Identity a = Identity a

instance Functor Identity where
    fmap f (Identity x) = Identity (f x)
    
// You can think of Identity as the simplest possible container that always stores just one (immutable) value of type a.