import Data.Bifunctor
{-
Let’s try another data structure.
I call it a PreList because it’s a precursor to a List.
It replaces recursion with a type parameter b.

data PreList a b = Nil | Cons a b

You could recover our earlier definition of a List by recursively applying PreList to itself
(we’ll see how it’s done when we talk about fixed points).

Show that PreList is an instance of Bifunctor.
-}

data PreList a b = Nil | Cons a b
   deriving (Show)

-- A bifunctor is a type constructor that takes two type arguments.
-- try to make PreList a bifunctor

instance Bifunctor PreList where
   -- bimap :: (a -> c) -> (b -> d) -> f a b -> f c d
   -- bimap2 g h = first g . second h
   bimap f g (Cons x y) = Cons (f x) (g y)
   bimap f g Nil        = Nil

   -- first :: (a -> c) -> f a b -> f c b
   first g = bimap g id
   -- first2 f (Cons a b)  = Cons (f a) b
   -- first2 f Nil         = Nil

   -- second :: (b -> d) -> f a b -> f a d
   second = bimap id
   -- second2 f (PreList a b) = PreList a (f b)
   -- second2 f Nil           = Nil
