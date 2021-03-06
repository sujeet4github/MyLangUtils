-- Challenge 1:
-- Can we turn the Maybe type constructor into a functor by defining:
--
-- fmap _ _ = Nothing
--
-- which ignores both of its arguments? (Hint: Check the functor laws.)
--
--
-- 1. preserves identity is not met because,
--    fmap _ (Just x) will not be = Just x
--
-- similarly composition will not be met if either LHS, RHS are not Nothing
--
