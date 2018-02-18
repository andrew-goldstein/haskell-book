module DayOfWeek where

data DayOfWeek =
  Mon | Tue | Weds | Thu | Fri | Sat | Sun
  deriving Show

data Date =
  Date DayOfWeek Int
  deriving Show

instance Eq DayOfWeek where
  (==) Mon Mon   = True
  (==) Tue Tue   = True
  (==) Weds Weds = True
  (==) Thu Thu   = True
  (==) Fri Fri   = True
  (==) Sat Sat   = True
  (==) _ _       = False

instance Eq Date where
  (==) (Date weekday dayOfMonth)
       (Date weekday' dayOfMonth') =
    weekday == weekday' && dayOfMonth == dayOfMonth'

f :: Int -> Bool
f 1 = True
f 2 = True
f 3 = True
f _ = False
