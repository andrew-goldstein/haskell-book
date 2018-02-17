module EqInstances where

data TisAnInteger =
  TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn x) (TisAn x') = x == x'

data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
  (==) (Two x1 x2) (Two x1' x2') = x1 == x1' && x2 == x2'

data StringOrInt =
    TisAnInt Int
  | TisAString String
  deriving Show

instance Eq StringOrInt where
  (==) (TisAnInt x) (TisAnInt x') = x == x'
  (==) (TisAString x) (TisAString x') = x == x'
  (==) _ _ = False

data Pair a =
  Pair a a
  deriving Show

instance Eq a => Eq (Pair a) where
  (==) (Pair a1 a2) (Pair a1' a2') = a1 == a1' && a2 == a2'

data Tuple a b =
  Tuple a b
  deriving Show

instance (Eq a, Eq b) =>  Eq (Tuple a b) where
  (==) (Tuple a1 b1) (Tuple a1' b1') = a1 == a1' && b1 == b1'

data Which a =
    ThisOne a
  | ThatOne a
  deriving Show

instance Eq a => Eq (Which a) where
  (==) (ThisOne a) (ThisOne a') = a == a'
  (==) (ThatOne a) (ThatOne a') = a == a'
  (==) _ _                      = False

data EitherOr a b =
    Hello a
  | Goodbye b
  deriving Show

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello a) (Hello a') = a == a'
  (==) (Goodbye b) (Goodbye b') = b == b'
  (==) _ _ = False
