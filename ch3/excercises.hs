module Exercises where

-- Given "Curry is awesome"
-- Return "Curry is awesome!"
ex2A :: [Char] -> [Char]
ex2A x = x ++ "!"

-- Given "Curry is awesome!"
-- Return "y"
ex2B :: [Char] -> [Char]
ex2B x = if null (drop 4 x) then "" else (x !! 4) : ""

-- Given "Curry is awesome!"
-- Return "awesome!"
ex2C :: [Char] -> [Char]
ex2C x = if null (drop 9 x) then "" else drop 9 x

-- Write a function of type String -> Char which returns the third character in a String.
ex3 :: String -> Char
ex3 x = x !! 3

ex4 :: Int -> Char
ex4 x = "Curry is awesome!" !! x

-- rvrs should take the string “Curry is awesome” and return the result “awesome is Curry.”
-- This may not be the most lovely Haskell code you will ever write, but it is quite possible using only what we’ve learned so far.
-- This doesn’t need to, and shouldn’t, work for reversing the words of any sentence.
-- You’re expected only to slice and dice this particular string with take and drop.
rvrs :: String -> String
rvrs x = drop 9 x ++ take 4 (drop 5 x) ++ take 5 x 

main :: IO ()
main = do
  putStrLn $ ex2A "Curry is awesome"
  putStrLn $ ex2B "Curry is awesome!"
  putStrLn $ ex2C "Curry is awesome!"
  print $ ex3  "Curry is awesome!"
  print $ ex4 3
  putStrLn $ rvrs "Curry is awesome"