{-# LANGUAGE DeriveFunctor #-}

// define Tree as a recursive sum type:
data Tree a =  Leaf a
      | Node (Tree a) (Tree a)
   deriving Functor

// implementation of map, avoiding automatic derivation
instance Functor Tree where
   fmap f (Leaf a)   = Leaf (f a)
   fmap f (Node l r) = Node (fmap f l) (fmap f r)
