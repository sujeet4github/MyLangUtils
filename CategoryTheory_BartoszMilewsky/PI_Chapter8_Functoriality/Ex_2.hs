import Data.Functor.Const
import Control.Monad.Identity

-- Ex Show the isomorphism between the standard definition of Maybe and this desugaring:
-- type Maybe' a = Either (Const () a) (Identity a)
-- Hint: Define two mappings between the two implementations.
-- For additional credit, show that they are the inverse of each other using equational reasoning.

type Maybe2 a = Either (Const () a) (Identity a)

maybeToMaybe2 :: Maybe a -> Maybe2 a
maybeToMaybe2 Nothing  = Left (Const Nothing) -- this doesnot compile ??? 
maybeToMaybe2 (Just x) = Right (Identity x)

maybe2ToMaybe :: Maybe2 a -> Maybe a
maybe2ToMaybe (Left (Const ()))     = Nothing
maybe2ToMaybe (Right (Identity x))  = Just x

{-
equational reasoning:

1.
maybeToMaybe2  Nothing
   = Left (Const () Nothing)        -- apply def
   = Left ()                        -- def of Const
maybe2ToMaybe (Left ())
   = maybe2ToMaybe (Left Const ())  -- def of Const
   = Nothing                        -- apply def

2.
maybeToMaybe2  (Just x)
   = Right (Identity x)             -- apply def
   = Right x                        -- def of Identity
maybe2ToMaybe (Right x)
   = maybe2ToMaybe (Right (Identity x))   -- def of Identity
   = Just x                         -- apply def

-}