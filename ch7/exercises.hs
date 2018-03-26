module Exercises where

foo :: Char -> String
foo = undefined

bar :: String -> [String]
bar = undefined

baz = bar . foo

f' :: Ord a => a -> a -> Bool
f' = undefined

f'' :: a -> a
f'' x = x

foldBool :: a -> a -> Bool -> a
foldBool x y z = if z then y else x

foldBool' :: a -> a -> Bool -> a
foldBool' x y z =
  case z of
    True -> y
    False -> x

foldBool'' :: a -> a -> Bool -> a
foldBool'' x y z
  | z = y
  | otherwise = x

zoo :: (a -> b) -> (a, c) -> (b, c)
zoo f (x, y) = (f x, y)

