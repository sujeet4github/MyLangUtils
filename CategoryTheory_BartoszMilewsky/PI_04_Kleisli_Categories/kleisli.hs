
-- suppose we have two pure functions
--
toUpper1 :: String -> String
toWords1 :: String -> [String]

-- We want to define a composition of these 2 functions
toUpperWords1 :: String -> [String]
toUpperWords1 = toWords1 . toUpper1

{-
Now if we wanted an audit trail (or log) of the function calls.
The usual imperative way to do this might be to append to a global
log, which will cause these two functions no longer be pure.

Another way is to embellish these functions - add something to
return value.

-}
toUpper2 :: String -> (String, String)
toWords2 :: String -> ([String], String)
toUpperWords2 :: String -> ([String], String)
toUpperWords2 s =
    let (s1, l1) = toUpper s
        (s2, l2) = toWords s1
    in (s2, l1 ++ l2)
{-
We can get a better separation of concerns, by working at a
higher level of abstraction.

First, let's make up a more generic type for this sort of embellished function:
-}
type Writer a = (a, String)

-- the composition of any two functions returning Writers
embellished_compose :: (a -> Writer b) ->
                       (b -> Writer c) ->
                       (a -> Writer c)
embellished_compose f g s =
    let (s1, l1) = f s
        (s2, l2) = g s1
    in (s2, l1 + l2)
    
toUpper :: String -> (String, String)
toWords :: String -> ([String], String)

toUpperWords :: String -> ([String], String)
toUpperWords s = embellished_compose toUpper toWords

{-
Now we can look at this new composition from a categorical point of view.
The types are still objects, and the morphisms are the embellished functions.

The important point is that the morphism is still considered an arrow
between String and String, or String and [String], although the function
actually returns a pair.

In this new category, embellished_compose is composition,
and the identity morphism will take a type to the same type,
and not add anything to the log, implemented as the  return function:
-}
return :: a -> Writer a
return s = (s, "")

{-
Does this form a category:
1. Morphisms compose - using embellished_compose - Rule 1
2. Composition is associative - since in the implementation of embellished_compose
    let (s1, l1) = f s
        (s2, l2) = g s1
    in (s2, l1 + l2)
   the composition of functions is associative, g uses result of f(s)...
     and string concatenation is associative., - Rule 2
3. Every object has a unit of composition, the return function, - Rule 3

NOTE: the Writer is also monoidal, "" is mempty and + is mappend
-}
