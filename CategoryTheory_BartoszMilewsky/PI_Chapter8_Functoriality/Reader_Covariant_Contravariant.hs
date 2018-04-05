-- The reader functor was based on the partially applied function-arrow type constructor:
--
-- (->) r
-- We can rewrite it as a type synonym:

type Reader r a = r -> a

-- for which the Functor instance, as we’ve seen before, reads:

instance Functor (Reader r) where
    fmap f g = f . g

-- Let’s try to make it functorial in the first argument.
-- We’ll start with a type synonym — it’s just like the Reader but with the arguments flipped:
newtype Op r a = Op (a -> r)

-- fmap (a -> b) -> (Op r a) -> (Op r b)
--   = fmap (a -> b) -> (a -> r) -> (b -> r)
-- We will need to somehow invert the first function so that it became (b -> a)
--  we use the opposite/dual category AND we get to the contramap in the contravariant endofunctor...

-- we have a functor, F that maps from Copp -> D
-- F :: (a -> b) -> (F a -> F b)
-- and a function, G that is not a functor, that maps from C -> D
-- G :: (b -> a) -> (G a -> G b), - it first maps (b -> a) to Copp (a -> b) and then uses functor F on it.

-- A mapping of categories that inverts the direction of morphisms in this manner is called a contravariant functor.
-- The regular functors, by the way — the kind we’ve been studying thus far — are called covariant functors.

-- Here’s the typeclass defining a contravariant functor (really, a contravariant endofunctor) in Haskell:
class Contravariant f where
    contramap :: (b -> a) -> (f a -> f b)

-- Our type constructor Op is an instance of it:
--
instance Contravariant (Op r) where
    -- (b -> a) -> Op r a -> Op r b
    --  = (b -> a) -> (a -> r) -> (b -> r)
    --         needs to lift (b -> a) INTO ( (a -> r) -> (b -> r) )
    --         this is done by the contravariant (G like method... contramap!)
    --     => first argument (b -> a) is Contravariant, needs to be (a -> b) before being functorized
    --        second argument ( (a -> r) -> (b -> r) ) is Covariant.
    -- contramap f (Op g) = Op (g . f)    
-- Notice that the function f inserts itself before (that is, to the right of) the contents of Op — the function g.
-- The definition of contramap for Op may be made even terser, if you notice that it’s just
-- the function composition operator with the arguments flipped.
-- There is a special function for flipping arguments, called flip:
    contramap = flip (.)

flip :: (a -> b -> c) -> (b -> a -> c)
flip f y x = f x y


-- Since, to first approximation, Haskell types are sets, we apply the name
-- Profunctor to a type constructor p of two arguments, which is contra-functorial
-- in the first argument and functorial in the second.

-- Here’s the appropriate typeclass taken from the Data.Profunctor library:

class Profunctor p where

  dimap :: (a -> b) -> (c -> d) -> p b c -> p a d
  dimap f g = lmap f . rmap g
  
  lmap :: (a -> b) -> p b c -> p a c
  lmap f = dimap f id
  
  rmap :: (b -> c) -> p a b -> p a c
  rmap = dimap id
  
-- All three functions come with default implementations.
-- Just like with Bifunctor, when declaring an instance of Profunctor,
-- you have a choice of either implementing dimap and accepting the defaults for lmap and rmap,
-- or implementing both lmap and rmap and accepting the default for dimap.


-- Now we can assert that the function-arrow operator is an instance of a Profunctor:
instance Profunctor (->) where
  -- dimap ab cd bc = cd . bc . ab
  lmap = flip (.)
  rmap = (.)

-- Profunctors have their application in the Haskell lens library.
-- We’ll see them again when we talk about ends and coends.
