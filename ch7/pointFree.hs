module PointFree where

f :: (Num a) => [a] -> a
f = negate . sum

f' :: Int -> [Int] -> Int
f' z xs = foldr (+) z xs

f'' :: Int -> [Int] -> Int
f'' = foldr (+)

foo = length . filter (== 'a')
