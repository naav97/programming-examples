merge :: Ord a => [a] -> [a] -> [a]
merge [] x = x
merge x [] = x
merge (xh:xt) (yh:yt)
    | xh <= yh = xh : merge xt (yh:yt)
    | otherwise = yh : merge (xh:xt) yt

sort :: Ord a => [a] -> [a]
sort [] = []
sort [x] = [x]
sort arr = merge (sort l) (sort r)
    where (l, r) = splitAt (div (length arr) 2) arr

main :: IO ()
main = do
    let nums = [43,76,22,543,6,2,33,3,7,4,5,8,9,0,54,66,23,77,78,34,87,23,42,224,76575,234,45,777,556,64]
    print nums
    print (sort nums)
