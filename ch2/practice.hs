module Practice where

mult1 = x * y
  where x = 5
        y = 6

foo = x * 3 + y
  where x = 3
        y = 1000

bar = x * 5
  where y = 10
        x = 10

baz = z / x + y
  where x = 7
        y = negate x
        z = y * 10

sugarWax = x * 5
  where z = 7
        x = y ^ 2
        y = z + 8

triple x = x * 3

waxOff x = triple x
