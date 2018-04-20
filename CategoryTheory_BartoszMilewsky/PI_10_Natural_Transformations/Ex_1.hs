{-# LANGUAGE Rank2Types, FlexibleContexts #-}

-- 1. Define a natural transformation from the Maybe functor to the list functor.
--    Prove the naturality condition for it.
--

-- proving the naturality condition means proving
--   G f . alpha_a  = alpha_b . F f
-- where:
--   G = []
--   F = Maybe
--   f :: a -> b
--   alpha is the natural transformation defined below
--
-- that is prove:
--   fmap f . alpha = alpha . 

-- Simple defn:
--   alpha :: Maybe a -> [a]
--   alpha Nothing = []
--   alpha (Just x) = [x]
--
--
-- 1. for Nothing
--
-- LHS = fmap f (alpha Nothing)
--     = fmap f []
--     = []
-- RHS = (alpha . fmap f) Nothing
--     = alpha (fmap f Nothing)
--     = alpha Nothing
--     = []
--
-- 2. for (Just x)
--
-- LHS = fmap f (alpha (Just x))
--     = fmap f [x]
--     = [f x]
-- RHS = (alpha . fmap f) (Just x)
--     = alpha (fmap f (Just x))
--     = alpha (Just (f x))
--     = [f x]

type NatTran f f' a = (Functor f, Functor f') => f a -> f' a

to_assert :: (Functor f, Functor f', Eq (f' b)) => (a -> b) -> NatTran f f' a -> NatTran f f' b -> f a -> Bool
to_assert g h h' f = (fmap g . h) f == (h' . fmap g) f

alpha :: NatTran Maybe [] a
alpha Nothing = []
alpha (Just x) = [x]

test_func :: Num a => a -> (a, a)
test_func x = (x, x+1)

success = all (to_assert test_func alpha alpha) [Nothing, Just 1]

main :: IO()
main = do
   if success then putStrLn "Success!" else putStrLn "Failure."

