import Data.Bifunctor
-- A bifunctor is a type constructor that takes two type arguments.
-- Ex 1. Show that the data type: data Pair a b = Pair a b is a bifunctor.

data Pair a b = Pair a b

-- 1. Pair takes two type arguments, so we try to make instance of Bifunctor for Pair

instance Bifunctor Pair
where
   -- bimap :: (a -> c) -> (b -> d) -> f a b -> f c d
   -- bimap g h = first g . second h
   bimap f g (Pair x y) = Pair (f x) (g y)

   -- first :: (a -> c) -> f a b -> f c b
   -- first g = bimap g id
   first f (Pair a b) = Pair (f a) b

   -- second :: (b -> d) -> f a b -> f a d
   -- second = bimap id
   second f (Pair a b) = Pair a (f b)

/*
bimap f g (Pair x y)
   = ( first f . second g ) Pair x y   -- defn in default implementation
   = (second g) ( (first f) Pair x y ) -- defn of .
   = (second g) ( Pair (f x) y )       -- defn of first above
   = Pair (f x) (g y)                  -- defn of second above
   = defn of bimap above


first g (Pair x y)
   = bimap g id (Pair x y)             -- defn in default implementation
   = Pair (g x) (id y)                 -- defn of bimap above
   = Pair (g x) y                      -- defn of id
   = defn of first above

second (Pair x y)
   = bimap id g (Pair x y)             -- defn in default implementation
   = Pair (id x) (g y)                 -- defn of bimap above
   = Pair x (g y)                      -- defn of id
   = defn of second above
*/