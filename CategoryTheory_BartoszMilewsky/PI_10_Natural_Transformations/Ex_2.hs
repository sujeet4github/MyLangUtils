{-# LANGUAGE Rank2Types, FlexibleContexts #-}

-- 2. Define at least two different natural transformations between Reader () and the list functor.
--    How many different lists of () are there? - Ans Infinite
--
-- Simple defn:
--   alpha :: Reader () a -> [a]
--   dumb    (Reader _) = []
--   obvious (Reader a) = [a ()]
--

newtype Reader e a = Reader {runReader :: (e -> a) }

instance Functor (Reader e) where  
    fmap f (Reader g) = Reader (\x -> f (g x))


-- First natural transformation ==> obvious
reader_to_list :: Reader () a -> [a]
reader_to_list m = runReader m () : []

-- Second natural transformation ==> dumb
reader_to_list' :: Reader () a -> [a]
reader_to_list' m = []

test_func :: Num a => a -> (a, a)
test_func x = (x, x + 1)

type NatTran f f' a = (Functor f, Functor f') => f a -> f' a

to_assert :: (Functor f, Functor f', Eq (f' b)) => (a -> b) -> NatTran f f' a -> NatTran f f' b -> f a -> Bool
to_assert g h h' f = (fmap g . h) f == (h' . fmap g) f

success = (all (to_assert test_func reader_to_list reader_to_list) [Reader (const 1), Reader (const 2)]) &&
          (all (to_assert test_func reader_to_list' reader_to_list') [Reader (const 1), Reader (const 2)])

--    How many different lists of () are there? - Ans Infinite
l   = [()]
l'  = [(), ()]
l'' = [(), (), ()]

main :: IO ()
main = do
    if success then putStrLn "Success!" else putStrLn "Failure."
    print l
    print l'
    print l''
    print (l == l')
