module TypeKwonDo5 where

munge :: (x -> y)
      -> (y -> (w, z))
      -> x
      -> w
munge f g x = fst $ g (f x)
