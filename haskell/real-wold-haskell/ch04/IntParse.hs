import Data.Char (digitToInt)

loop :: Int -> String -> Int
loop acc [] = acc
loop acc (x:xs) = loop acc' xs
  where acc' = acc * 10 + digitToInt x --Уху! 

asInt :: String -> Int
asInt xs = loop 0 xs