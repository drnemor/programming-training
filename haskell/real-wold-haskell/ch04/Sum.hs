mySum :: Num a => [a] -> a
mySum xs = helper 0 xs
  where hepler acc (x:xs) = helper (acc + x) xs
        helper acc []     = acc