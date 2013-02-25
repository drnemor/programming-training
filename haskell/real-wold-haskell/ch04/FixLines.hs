import System.Environment (getArgs)

interactWith function inputFile outputFile = do
  input <- readFile inputFile
  writeFile outputFile (function input)

main = mainWith myFunction
  where mainWith function = do
          args <- getArgs
          case args of
            [input,output] -> interactWith function input output
            _ -> putStrLn "error: exactly two arguments needed"

        -- replace "id" with the name of our function below
        myFunction = transposeFile

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
  where getFirstWords :: String -> [String]
        getFirstWords [] = []
        getFirstWords cs = (take1st . getWords . splitLines) cs
        getWords :: [String] -> [[String]]
        getWords []     = []
        getWords xs = map words xs
        take1st :: [[String]] -> [String]
        take1st []        = []
        take1st ([]:xs) = take1st xs
        take1st (x:xs)    = (!!) x 0 : take1st xs

transposeFile :: String -> String
transposeFile input = unlines $ stringZip $ splitLines input
  where stringZip :: [String] -> [String]
        stringZip xs | all null xs = []
                     | otherwise   = map takeChar xs : stringZip (map (drop 1) xs)
          where takeChar :: String -> Char
                takeChar []     = ' '
                takeChar (x:xs) = x