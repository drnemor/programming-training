import Data.Char (digitToInt, isDigit)
import Data.List

type ErrorMessage = String

loop :: Int -> String -> Int
loop acc [] = acc
loop acc (x:xs) = loop acc' xs
  where acc' = acc * 10 + digitToInt x --Уху! 

asInt :: String -> Int
asInt xs = loop 0 xs

a :: Int
a = 2147483647


asIntFold :: String -> Int
asIntFold ('-':xs) = -1 * asIntFold xs
asIntFold ("")     = error "No input"
asIntFold xs       = foldl toInt 0 xs
  where
  toInt acc next = 
    if    (acc > 0 && nextAcc < 0) 
       || (acc < 0 && nextAcc > 0)
    then error "Integer overflow"
    else nextAcc
      where 
      nextAcc = 
        if next `elem` ['0'..'9']
        then acc * 10 + digitToInt next
        else error $ "Bad char: " ++ [next]

asIntEither :: String -> Either ErrorMessage Int
asIntEither ("")     = Left "Empty input"
asIntEither ('-':xs) = case (asIntEither xs) of
                         (Right x) -> Right (- 1 * x)
                         (Left x)  -> Left x
asIntEither xs       = foldl toInt (Right 0) xs
  where
  toInt (Left acc)  _    = Left acc
  toInt (Right acc) next =
    case nextAcc of
      (Left x)  -> Left x
      (Right x) -> if isOverflow acc x 
                   then Left "Integer overwlow"
                   else Right x 
      where
      nextAcc =
        if isDigit next
        then Right $ acc * 10 + digitToInt next
        else Left $ "Bad char " ++ [next]
      isOverflow old new =
        (old > 0 && new < 0)
        || (old < 0 && new > 0)

myConcat :: [[a]] -> [a]
myConcat [] = []
myConcat xs = foldr (++) [] xs

myTakeWhileRec :: (a -> Bool) -> [a] -> [a]
myTakeWhileRec _    []     = []
myTakeWhileRec pred (x:xs) | pred x    = x : myTakeWhileRec pred xs
                           | otherwise = []

myTakeWhileFold :: (a -> Bool) -> [a] -> [a]
myTakeWhileFold pred xs = foldr fun [] xs
  where
  fun a b | pred a    = a : b
          | otherwise = []

myGroupBy :: (a -> a -> Bool) -> [a] -> [[a]]
myGroupBy pred xs = fold fun [] xs
  where
  fun a b | pred a 
