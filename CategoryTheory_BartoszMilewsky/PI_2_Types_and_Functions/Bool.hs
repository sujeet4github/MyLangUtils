{-
Bool is a set with 2 values T, F
possible functions
T -> F   - not
F -> T   - not
T -> T   - id
F -> F   - id
* -> T   - true
* -> F   - false
-}

-- not == complement
complement :: Bool -> Bool
complement True = False
complement False = True

-- id == constant
constant :: Bool -> Bool
constant x = x

true :: Bool -> Bool
true _ = True

false :: Bool -> Bool
false _ = False

bottom :: Bool -> Bool
bottom _ = undefined

main :: IO()
main = do
   putStrLn "constant: "
   putStrLn $ "\tTrue -> " ++ (show $ constant True)
   putStrLn $ "\tFalse -> " ++ (show $ constant False)
   putStrLn "complement:"
   putStrLn $ "\tTrue -> " ++ (show $ complement True)
   putStrLn $ "\tFalse -> " ++ (show $ complement False)
   putStrLn "true:"
   putStrLn $ "\tTrue -> " ++ (show $ true True)
   putStrLn $ "\tFalse -> " ++ (show $ true False)
   putStrLn "false:"
   putStrLn $ "\tTrue -> " ++ (show $ false True)
   putStrLn $ "\tFalse -> " ++ (show $ false False)
   putStrLn "bottom:"
   putStrLn "\t(Attempting to call 'bottom' short circuits the monad, and we get no output.)"
