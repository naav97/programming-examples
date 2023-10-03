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

main = do
    let g = [[-1, 1, 15, -1, -1],
             [-1, -1, -1, 6, 2],
             [-1, -1, -1, -1, -1],
             [-1, 1, 5, -1, -1],
             [-1, -1, -1, 3, -1]]
    printGraph g 0
