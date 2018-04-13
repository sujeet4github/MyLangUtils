
-- Challenge 4: Prove functor laws for the list functor.
--              Assume that the laws are true for the tail part of the list
--              you’re applying it to (in other words, use induction).
--

instance Functor [] where
    fmap g []     = []
    fmap g (x:xs) = g x : (fmap g xs)

-- preserves Category ... composition
--
--  ... 1. preserves identity - by equational reasoning
-- fmap id (x:xs)
--  = id x : (fmap id xs)     - defn of fmap
--  = x : (fmap id xs)        - defn of id
--  = x : xs                  - inductive assumption provided in challenge
--  = id (x : xs)             - defn of id

--  ... 2. preserves composition ... proved by Equational Reasoning
-- fmap (g . h) (x:xs)
--  = (g . h) x : (fmap (g . h) xs)       - defn of fmap
--  = (g . h) x : (fmap g ( fmap h xs))   - inductive assumption provided in challenge
--  = g (h x) : (fmap g ( fmap h xs))     - defn of function composition
--  = fmap g ( h x : (fmap h xs) )        - defn of fmap
--  = fmap g ( fmap h (x:xs) )            - defn of fmap
--  = (fmap g . fmap h) (x:xs)            - defn of composition of functors
