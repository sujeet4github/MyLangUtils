safe_root :: Double -> Maybe Double
safe_root x
   | x < 0     = Nothing
   | otherwise = Just (sqrt(x))

(>=>) :: (a -> Maybe b) -> (b -> Maybe c) -> (a -> Maybe c)
m1 >=> m2 = \x -> case m1 x of
                     Just y => m2 y
                     Nothing => Nothing

return :: a -> Maybe a
return x = Just x

safe_reciprocal -> Double -> Optional Double
safe_reciprocal x =
    | x < 0        = Empty
    | otherwise    = Value (1/x)

safe_root_reciprocal -> Double -> Optional Double
safe_root_reciprocal x = safe_root >==> safe_reciprocal

