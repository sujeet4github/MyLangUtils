{-

Show that the following data types define bifunctors in a and b:
   data K2 c a b = K2 c
   data Fst a b = Fst a
   data Snd a b = Snd b

For additional credit, check your solutions against:
   Conor McBride’s paper Clowns to the Left of me, Jokers to the Right.
   http://strictlypositive.org/CJ.pdf
-}

data K2 c a b = K2 c
   deriving Show

data Fst a b = Fst a

data Snd a b = Snd b

