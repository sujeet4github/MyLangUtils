-- the Reader Functor
--

instance Functor ((->) r) where
    fmap = (.)

f :: r -> a


-- Challenge 2: Prove functor laws for the reader functor. Hint: it’s really simple.
--
--  ... 1. preserves identity
--  fmap id f
--     = id . f
--     = f
--     = (id f)
--  fmap f id
--     = f . id
--     = f
--     = (id f)
--
--  ... 2. preserves composition
--  (fmap f . fmap g) f
--  = fmap g (fmap h f)  - defn of composition
--  = fmap g (h . f)     - defn of fmap on (->)
--  = g . (h . f)        - defn of fmap on (->)
--  = (g . h) . f        - associativity of regular function composition
--  = fmap (g . h) f     - defn of fmap on (->)

--  fmap (g . h) f
--  = (g . h) . f           - defn of fmap on (->)
--  = g . (h . f)           - associativity of regular function composition
--  = fmap g (h . f)        - defn of fmap on (->)
--  = fmap g (fmap h f)     - defn of fmap on (->)
--  = (fmap f . fmap g) f   - defn of composition
