length'' :: [a] -> Int
length'' xs = length' 0 xs
            where length' acc []     = acc
                  length' acc (y:ys) = length' (acc+1) ys

null'' :: [a] -> Bool   
null'' []    = True
null'' (_:_) = False

head'' :: [a] -> a
head'' []    = error "Error: empty list!"
head'' (x:_) = x

tail'' :: [a] -> [a]
tail'' []     = error "Error: empty list!"
tail'' (_:xs) = xs

last'' :: [a] -> a
last'' []     = error "Error: empty list!"
last'' (x:[]) = x
last'' (_:xs) = last'' xs

init'' :: [a] -> [a]
init'' []     = error "Empty: empty list!"
init'' (x:[]) = []
init'' (x:xs) = x : init'' xs

(++-) :: [a] -> [a] -> [a]
(++-) xs     [] = xs
(++-) []     ys = ys
(++-) (x:xs) ys = x : xs ++- ys

concat'' :: [[a]] -> [a]
concat'' []     = []
concat'' (x:xs) = x ++ concat'' xs

reverse'' :: [a] -> [a]
reverse'' []     = []
reverse'' (x:xs) = reverse'' xs ++ [x]

and'' :: [Bool] -> Bool
and'' []     = True
and'' (x:xs) = x && and'' xs 

or'' :: [Bool] -> Bool
or'' []     = False
or'' (x:xs) = x || or'' xs

all'' :: (a -> Bool) -> [a] -> Bool
all'' _    []     = True
all'' cond (x:xs) = cond x && all'' cond xs

any'' :: (a -> Bool) -> [a] -> Bool
any'' _    []     = False
any'' cond (x:xs) = cond x || any'' cond xs

take'' :: Int -> [a] -> [a]
take'' times xs
  | times <= 0 || null xs = []
  | otherwise             = head xs : take'' (times-1) (tail xs)

drop'' :: Int -> [a] -> [a]
drop'' times xs
  | times <= 0 || null xs = xs
  | otherwise             = drop (times-1) (tail xs)

splitAt'' :: Int -> [a] -> ([a],[a])
splitAt'' times xs= (take times xs, drop times xs)

takeWhile'' :: (a -> Bool) -> [a] -> [a]
taheWhile'' _    []     = []
takeWhile'' cond (x:xs)
  | cond x    = x : takeWhile'' cond xs
  | otherwise = []

dropWhile'' :: (a -> Bool) -> [a] -> [a]
dropWhile'' _    []     = []
dropWhile'' cond (x:xs)
  | cond x    = dropWhile'' cond xs
  | otherwise = x:xs
  
span'' :: (a -> Bool) -> [a] -> ([a],[a])
span'' cond xs = (takeWhile cond xs, dropWhile cond xs)

break'' :: (a -> Bool) -> [a] -> ([a],[a])
break'' cond xs = (takeWhile (not . cond) xs, dropWhile (not . cond) xs)

elem'' :: (Eq a) => a -> [a] -> Bool
elem'' _ []     = False
elem'' a (x:xs)
  | a == x    = True
  | otherwise = elem'' a xs

notElem'' :: (Eq a) => a -> [a] -> Bool
notElem'' a xs = not (elem'' a xs)

filter'' :: (a -> Bool) -> [a] -> [a]
filter'' _    []     = []
filter'' cond (x:xs)
  | cond x    = x : filter'' cond xs
  | otherwise = filter'' cond xs
  
zip'' :: [a] -> [b] -> [(a,b)]
zip'' _      []     = []
zip'' []     _      = []
zip'' (x:xs) (y:ys) = (x,y) : zip'' xs ys

zipWith'' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith'' _   _      []     = []
zipWith'' _   []     _      = []
zipWith'' fun (x:xs) (y:ys) = fun x y : zipWith'' fun xs ys

testLines = lines "foo\nbar"
testUnlines = unlines ["foo", "var"]
testWords = words "the  \r  quick \t brown\n\n\nfox"

