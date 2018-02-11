module Parametricity where

-- Given the type a -> a, which is the type for id, attempt to make a function
-- that terminates successfully that does something other than returning the
-- same value. This is impossible, but you should try it anyway.
id' :: a -> a
id' a = a

-- We can get a more comfortable appreciation of parametricity by looking at
-- a -> a -> a. This hypothetical function a -> a -> a has
-- two–and only two–implementations. Write both possilble versions of
-- a -> a -> a. After doing so, try to violate the constraints of
-- parametrically polymorphic values we outlined above.
foo :: a -> a -> a
foo x _ = x

foo' :: a -> a -> a
foo' _ y = y

constrained :: Num a => a -> a -> a
constrained x y = x + y

-- Implement a -> b -> b. How many implementations can it have? Does the
-- behavior change when the types of 𝑎 and 𝑏 change?
bar :: a -> b -> b
bar x y = y
