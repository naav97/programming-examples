import System.IO

main = do
    file <- openFile "file.txt" AppendMode
    hPutStrLn file "Hi!"
    hClose file
    file <- openFile "file.txt" ReadMode
    linesC <- hGetContents file >>= return . lines
    mapM_ putStrLn linesC
    hClose file
