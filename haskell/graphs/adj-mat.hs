import Data.List

printGraph :: [[Int]] -> Int -> IO ()
printGraph g i
    | i >= length g = return ()
    | otherwise = do
        putStr $ "(" ++ show i ++ ")"
        printEdges (g !! i) 0
        printGraph g (i + 1)

printEdges :: [Int] -> Int -> IO ()
printEdges edges j
    | j >= length edges = putStrLn ""
    | edges !! j > 0 = do
        putStr $ " -" ++ show (edges !! j) ++ "> " ++ show j
        printEdges edges (j + 1)
    | otherwise = printEdges edges (j + 1)

bellmanFord :: [[Int]] -> Int -> [Int]
bellmanFord graph pn = checkN graph [pn] (initD graph) (initP graph)
    where
        initD g = 0 : replicate (length g-1) 100
        initP g = replicate (length g) False

checkN :: [[Int]] -> [Int] -> [Int] -> [Bool] -> [Int]
checkN _ [] dist _ = dist
checkN graph (act:rest) dist processed = checkN graph newQueue newD newP
    where
        newD = updateD graph act dist processed
        newP = updateP processed act
        newQueue = nub (rest ++ [j | (j, p) <- zip [0..] newP, not p])

updateP :: [Bool] -> Int -> [Bool]
updateP (h:t) 0 = (True : t)
updateP (h:t) ix = h : updateP t (ix-1)

updateD :: [[Int]] -> Int -> [Int] -> [Bool] -> [Int]
updateD graph act dist processed = zipWith3 updateN [0..] dist processed
    where
        updateN j d pro
            | graph !! act !! j > 0 && d > dist !! act + graph !! act !! j = dist !! act + graph !! act !! j
            | otherwise = d

printDist :: [Int] -> Int -> IO ()
printDist dist i 
    | i >= 0 = do
        printDist dist (i-1)
        putStrLn $ "De " ++ show 0 ++ " a " ++ show i ++ ": " ++ show (dist !! i)
    | otherwise = putStrLn ""

main = do
    let g = [[-1, 1, 15, -1, -1],
             [-1, -1, -1, 6, 2],
             [-1, -1, -1, -1, -1],
             [-1, 1, 5, -1, -1],
             [-1, -1, -1, 3, -1]]
    let distances = bellmanFord g 0
    printGraph g 0
    printDist distances (length distances - 1)
