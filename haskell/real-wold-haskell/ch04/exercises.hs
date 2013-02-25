safeHead :: [a] -> Maybe a
safeHead []     = Nothing
safeHead (x:xs) = Just x

safeTail :: [a] -> Maybe [a]
safeTail []     = Nothing
safeTail (x:xs) = Just xs

safeLast :: [a] -> Maybe a
safeLast []     = Nothing
safeLast (x:[]) = Just x
safeLast (x:xs) = safeLast xs

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit xs = Just (init xs)

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _  []       = []
splitWith cond xs
           | null h    = splitWith cond (dropWhile (not . cond) t)
           | otherwise = h : splitWith cond (t)
  where (h,t) = span cond xs

wordsFromLines :: [String] -> [[String]]
wordsFromLines (x:xs) = words x : wordsFromLines xs 
wordsFromLines []     = []

firstWords :: [[String]] -> [String]
firstWords [] = []
firstWords input = head (head input) : firstWords (tail input)

myTranspose :: String -> String
myTranspose str = unlines $  multiZip $ lines str
  where multiZip :: [String] -> [String]
        multiZip xs | all null xs = []
                    | otherwise   = map takeChar xs : multiZip (map (drop 1) xs)
          where takeChar :: String -> Char
                takeChar []     = ' '
                takeChar (x:xs) = x


        