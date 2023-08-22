insert x [] = [x]
insert x (h:t)
    | x <= h = x : h : t
    | otherwise = h : insert x t

sort :: Ord a => [a] -> [a]
sort [] = []
sort (h:t) = insert h (sort t)

main :: IO ()
main = do
    let a = [12,4,23,5,14,73,1,435,76,2,24,6,143,54,7,122,234,7564,1222]
    print a
    print (sort a)
