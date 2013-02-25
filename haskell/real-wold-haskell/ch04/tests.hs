isLineTerminator :: Char -> Bool
isLineTerminator c = c == '\r' || c == '\n'

splitLines :: String -> [String]
splitLines [] = []
splitLines cs =
	let (pre, suf) = break isLineTerminator cs
	in pre : case suf of 
              ('\r':'\n':rest) -> splitLines rest
              ('\r':rest)      -> splitLines rest
              ('\n':rest)      -> splitLines rest
              _ -> []

fixLines :: String -> String
fixLines input = unlines (splitLines input)

printFirstWords :: String -> String
printFirstWords input = unlines (getFirstWords input)

getFirstWords :: String -> [String]
getFirstWords [] = []
getFirstWords cs = (take1st . getWords . splitLines) cs

getWords :: [String] -> [[String]]
getWords []     = []
getWords (x:xs) = words x : getWords xs

take1st :: [[String]] -> [String]
take1st []     = []
take1st ([]:xs) = take1st xs
take1st (x:xs) = (!!) x 0 : take1st xs