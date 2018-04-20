{-

Exercise 5: 

Show that a + a = 2 * a holds for types (up to isomorphism).
Remember that 2 corresponds to Bool, according to our translation table.

LHS = a + a  -> Either a a
RHS = 2 * a -> (Bool, a)

are there mapping functions?

-}

f :: Either a a -> (Bool, a)
f Left x = (True, x)
f Right x = (False, x)

g :: (Bool, a) -> Either a a
g True x -> Left x
g False x -> Right x


assertion1 = map (f . g) [(False, 1), (True, 1)] == map id [(False, 1), (True, 1)]
assertion2 = map (g . f) [Left 1, Right 1] == map id [Left 1, Right 1]

main :: IO ()
main = do
    print assertion1
    print assertion2

main