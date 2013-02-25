foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' step zero (x:xs) = foldl step (step zero x) xs
foldl' _    zero []     = zero
{-
foldl (+) 0 (1:2:3:[])
            == foldl (+) (0 + 1)             (2:3:[])
            == foldl (+) ((0 + 1) + 2)       (3:[])
            == foldl (+) (((0 + 1) + 2) + 3) []
            == (((0 + 1) + 2) + 3)
-}

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' step zero (x:xs) = step x (foldr step zero xs)
foldr' _    zero []     = zero 
{- 
foldr (+) 0 (1:2:3:[])
			 == 1 +           foldr (+) 0 (2:3:[])
			 == 1 + (2 +      foldr (+) 0 (3:[])
			 == 1 + (2 + (3 + foldr (+) 0 []))
			 == 1 + (2 + (3 + 0))
-}
foldSum :: Num a => [a] -> a
foldSum xs = foldl step 0 xs
  where step acc x = acc + x

niceSum :: Num a => [a] -> a
niceSum xs = foldl (+) 0 xs

myFilter p xs = foldr step [] xs

adler32_foldl xs = (b `shiftL` 16) .|. a
                     where (a,b) = foldl step (1,0) xs
                       where step (a,b) x = (a' `mod` base, (a' + b) `mod` base)
                         where a' = a + (ord x .&. 0xff)

filter' :: (a -> Bool) -> [a] -> [a]
filter' cond xs = foldr step [] xs
  where step x ys | cond x    = x : ys
                  | otherwise = ys

map' :: (a -> b) -> [a] -> [b]
map' fun xs = foldr step [] xs
	where step x ys = fun x : xs