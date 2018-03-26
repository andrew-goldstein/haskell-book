functionC x y = if (x > y) then x else y

functionC' x y =
  case x > y of
    True -> x
    _ -> y

ifEvenAdd2 n = if even n then (n + 2) else n

ifEvenAdd2' n =
  case even n of
    True -> n + 2
    _ -> n

nums x =
  case compare x 0 of
  LT -> -1
  GT -> 1
  EQ -> 0

aflip :: (a -> b -> c) -> b -> a -> c
aflip f b a = f a b
