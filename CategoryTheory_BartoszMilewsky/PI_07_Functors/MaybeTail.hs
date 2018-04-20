// Functor composition between Maybe and []
//
maybeTail :: [a] -> Maybe [a]
maybeTail [] = Nothing
maybeTail (x:xs) = Just xs

// The result of maybeTail is of a type that’s a composition of two functors,
// Maybe and [], acting on a. Each of these functors has its own version of fmap.

square x = x * x

mis :: Maybe [Int]
mis = Just [1, 2, 3]

mis2 = fmap (fmap square) mis

// The compiler, after analyzing the types, will figure out that, for the outer fmap,
// it should use the implementation from the Maybe instance, and for the inner one,
// the list functor implementation.

// It may not be immediately obvious that the above code may be rewritten as:
mis3 = (fmap . fmap) square mis

// the first fmap is:
// fmap1 :: (Int -> Int) -> [Int] -> [Int]
// the second is
// fmap2 :: ([Int] -> [Int]) -> Maybe [Int] -> Maybe [Int]
//
// the composed function looks like
// fmap2 . fmap1 :: (Int -> Int) -> Maybe [Int] -> Maybe [Int]
//

