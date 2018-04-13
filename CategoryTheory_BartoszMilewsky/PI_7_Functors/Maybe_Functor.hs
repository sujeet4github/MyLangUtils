-- The definition of Maybe is a mapping from type a to type Maybe a:
data Maybe a = Nothing | Just a

-- Here’s an important subtlety: Maybe itself is not a type, it’s a type constructor.
-- You have to give it a type argument, like Int or Bool, in order to turn it into a type.
-- Maybe without any argument represents a function on types.
-- But can we turn Maybe into a functor?
-- NOTE: when I speak of functors in the context of programming, I will almost always mean endofunctors
-- endofunctor is a functor that maps from one category back to same category.

-- We often say that fmap lifts a function. The lifted function acts on Maybe values.

fmap' :: (a -> b) -> (Maybe a -> Maybe b)
fmap' _ Nothing  = Nothing
fmap' f (Just x) = Just (f x)

-- Applying the Functor type constructor from Prelude to Maybe
--
instance Functor Maybe where
   fmap _ Nothing  = Nothing
   fmap f (Just x) = Just (f x)

-- Functor laws
-- preserves Category ... composition
--  ... 1. preserves identity
prop_maybe_preserves_identity_Nothing :: () -> Bool
prop_maybe_preserves_identity_Nothing
  = fmap' id Nothing == id Nothing
--  = fmap' id Nothing
--  = Nothing
--  = id Nothing

prop_maybe_preserves_identity_Just :: a -> Bool
prop_maybe_preserves_identity_Just x
  = fmap' id (Just x) == Just (id x)
--  = fmap' id (Just x)
--  = Just (id x)
--  = Just x
--  = id (Just x)
  

--  ... 2. preserves composition ... proved by Equational Reasoning
-- fmap' (g. f) Nothing
--    = Nothing
--    = fmap' g Nothing
--    = fmap' g (fmap' f Nothing)
--
-- fmap' (g . f) Just x
--    = Just (g . f) x
--    = Just g ( f x )
--    = fmap g Just (f x)
--    = fmap g (fmap' f (Just x))
--    = (fmap g . fmap' f) (Just x)
--

