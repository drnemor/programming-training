oddList :: [Int] -> [Int]
oddList (x:xs) | odd x     = x : oddList xs
               | otherwise = oddList xs
oddList []     = []

filter' :: (a -> Bool) -> [a] -> [a]
filter' cond (x:xs) | cond x    = x : oddList xs
                    | otherwise = oddList xs
filter' _    []     = []

