import Data.List

type ErrorMessage = String

some :: [Int] -> Either ErrorMessage Int
some [] = Left "No input!"
some xs = foldl' specAdd (Right 0) xs
  where
  specAdd (Right acc) new = if new >= 0
                            then Right (acc + new)
                            else Left "Negative num!"
  specAdd (Left acc) new = Left acc
  

a = some [1,1,2]

someFun = case cort of
            1 -> "1"
            _ -> "Don't know"
          where
            cort = 1