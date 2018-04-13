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
