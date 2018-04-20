{-# LANGUAGE Rank2Types, FlexibleContexts #-}

-- 3. Continue the previous exercise with Reader Bool and Maybe.
--    that is Define at least two different natural transformations between Reader Bool and the Maybe functor.
--

newtype Reader e a = Reader {runReader :: (e -> a) }

instance Functor (Reader e) where  
    fmap f (Reader g) = Reader (\x -> f (g x))

-- First natural transformation ==> obvious
reader_to_maybe :: Reader Bool a -> Maybe a
reader_to_maybe m = Just $ runReader m True

-- Second natural transformation ==> dumb
reader_to_maybe' :: Reader Bool a -> Maybe a
reader_to_maybe' m = Nothing


reader_func :: Bool -> Int
reader_func False = 0
reader_func True  = 1

reader_func' :: Bool -> Int
reader_func' False = 1
reader_func' True  = 0

test_func :: Num a => a -> (a, a)
test_func x = (x, x + 1)

type NatTran f f' a = (Functor f, Functor f') => f a -> f' a

to_assert :: (Functor f, Functor f', Eq (f' b)) => (a -> b) -> NatTran f f' a -> NatTran f f' b -> f a -> Bool
to_assert g h h' f = (fmap g . h) f == (h' . fmap g) f

success = (all (to_assert test_func reader_to_maybe reader_to_maybe)    [Reader reader_func, Reader reader_func']) &&
          (all (to_assert test_func reader_to_maybe' reader_to_maybe')  [Reader reader_func, Reader reader_func'])

main :: IO ()
main = do
    if success then putStrLn "Success!" else putStrLn "Failure."
