import Text.Read (readMaybe)
import Text.Printf (printf)
import System.IO


main :: IO ()
main = do
    --get 10 floats from grades.dat

    -- get file contents
    contents <- readFile "grades.dat"
    -- get floats out of contents
    let floats = read <$> lines contents :: [Float]

    --do calculations and show results
    putStrLn ("mean " ++ (show (calcMean floats)))
    putStrLn ("max " ++ (show (maximum floats)))
    putStrLn ("min " ++ (show (minimum floats)))
    printf "std dev %.2f\n" (calcStdev floats)


calcStats :: [Float] -> [Float]
calcStats floatlist =
    calcMean floatlist : minimum floatlist : maximum floatlist 
    : calcStdev floatlist : []


calcMean :: [Float] -> Float
calcMean floatlist = (sum floatlist) / (fromIntegral (length floatlist))


calcStdev :: [Float] -> Float
--uses a list comprehension wow so haskell
calcStdev floatlist = sqrt ((sum [(x - (calcMean floatlist))**2 | x <- floatlist]) / 
    fromIntegral (length floatlist - 1))