import Data.Char (toUpper)

upperCase :: String -> String
upperCase (x:xs) = toUpper x : upperCase xs
upperCase []     = []

square :: [Double] -> [Double]
square (x:xs) = x*x : square xs
square [] = []

square2 :: [Double] -> [Double]
square2 xs = map squareOne xs
  where squareOne x = x * x

upperCase2 :: [Char] -> [Char]
upperCase2 xs = map toUpper xs

map' :: (a -> b) -> [a] -> [b]
map' fun (x:xs) = fun x : map' fun xs
map' _   []     = []