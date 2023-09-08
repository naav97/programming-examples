import Data.Map (Map)
import qualified Data.Map as Map

addEdge :: Map Int [Int] -> Int -> Int -> Map Int [Int]
addEdge graph ini fin = 
    let gcini = insertNode graph ini fin 
        gcfin = insertNode gcini fin ini 
    in gcfin

insertNode :: Map Int [Int] -> Int -> Int -> Map Int [Int]
insertNode graph ini fin = 
    let li = Map.findWithDefault [] ini graph
        nli = (fin : li)
    in Map.insert ini nli graph

printGraph :: Map Int [Int] -> IO ()
printGraph graph = do
    let nodes = Map.keys graph
    mapM_ (\node -> putStrLn $ formatRow node (Map.findWithDefault [] node graph)) nodes
    where
        formatRow node adj =
            "(" ++ show node ++ ") -> " ++ formatAdj adj

        formatAdj [] = ""
        formatAdj (h:t) = show h ++ formatTail t

        formatTail [] = ""
        formatTail (h:t) = " -> " ++ show h ++ formatTail t

dfs :: Map Int [Int] -> IO ()
dfs graph = do
    procesar [0] [] graph
    putStrLn ""

procesar :: [Int] -> [Int] -> Map Int [Int] -> IO ()
procesar [] vis _ = putStr ""
procesar (node:stack) vis graph = do
    if elem node vis
        then procesar stack vis graph
        else do 
            putStr (show node ++ " -> ")
            procesar (adj ++ stack) (node : vis) graph
    where
        adj = filter (\n -> notElem n vis) (Map.findWithDefault [] node graph)

main = do
    let g = addEdge (addEdge (addEdge (addEdge (addEdge (addEdge (addEdge Map.empty 0 1 ) 0 4 ) 1 2 ) 1 3 ) 1 4 ) 2 3 ) 3 4
    printGraph g
    dfs g
