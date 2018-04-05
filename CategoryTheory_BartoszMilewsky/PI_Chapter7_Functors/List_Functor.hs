// The definition of List
data List a = Nil | Cons a (List a)

// But can we turn List into a functor?

// We often say that fmap lifts a function. The lifted function acts on List values.

fmap' :: (a -> b) -> (List a -> List b)
fmap' _ Nil = Nil
fmap' f (Cons x t) = Cons (f x) (fmap' f t)

// Applying the Functor type constructor from Prelude to List
//
instance Functor List where
   fmap _ Nil = Nil
   fmap f (Cons x t) = Cons (f x) (fmap f t)


// Challenge 4: Prove functor laws for the list functor.
//              Assume that the laws are true for the tail part of the list
//              you’re applying it to (in other words, use induction).
//
// preserves Category ... composition
//  ... 1. preserves identity
prop_list_preserves_identity_Nothing :: () -> Bool
prop_list_preserves_identity_Nothing
  = fmap id Nothing == id Nothing

prop_list_preserves_identity_Just :: [a] -> Bool
prop_list_preserves_identity_Just xs
  = fmap id xs == map id xs

//  ... 2. preserves composition ... proved by Equational Reasoning
// fmap (g. f) Nothing
//    = Nothing
//    = fmap g Nothing
//    = fmap g (fmap f Nothing)
//
// fmap (g . f) Just x
//    = Just (g . f) x
//    = Just g ( f x )
//    = fmap g Just (f x)
//    = fmap g (fmap f (Just x))
//    = (fmap g . fmap f) (Just x)
//
