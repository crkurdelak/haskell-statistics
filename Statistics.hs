import Text.Read (readMaybe)
import Text.Printf (printf)
import System.IO

--this program is so short but it was really hard to make bc haskell is so confusing
main :: IO ()
main = do
    --get 10 floats from grades.dat

    -- get file contents
    contents <- readFile "grades.dat"
    -- get floats out of contents
    let floats = read <$> lines contents :: [Float]

    --do calculations and show results

    --let results = [show x | x <- calcStats floats] :: [String]

    --putStrLn "Mean: " : results[0] : "\nMin: " : results[1] : "\nMax: " : results[2] : "\nStdev: " : results[3] : []
    --let resultstring = "Mean: " : show <$> calcMean floats : "\nMin: " : show <$> minimum floats : "\nMax: " : show <$> maximum floats : "\nStdev: " : show <$> calcStdev floats : []
    --putStrLn resultstring

    putStrLn (show (calcMean floats))
    putStrLn (show (minimum floats))
    putStrLn (show (maximum floats))
    putStrLn (show (calcStdev floats))

    --putStrLn show results

    --putStrLn show <$> calcStats floats

    --map putStrLn (map show (calcStats floats))


calcStats :: [Float] -> [Float]
calcStats floatlist =
    calcMean floatlist : minimum floatlist : maximum floatlist : calcStdev floatlist : []


calcMean :: [Float] -> Float
calcMean floatlist = (sum floatlist) / (fromIntegral (length floatlist))


calcStdev :: [Float] -> Float
--calcStdev floatlist = map sqrt (((sum x - calcMean floatlist)^2) / length floatlist) floatlist
-- currently it's trying to subtract scalar from list
--let meandiffs = [x - calcmean floatlist | x <- floatlist]
--calcStdev floatlist = sqrt ((sum (floatlist - calcMean floatlist))**2)

--uses a list comprehension wow so haskell
calcStdev floatlist = sqrt (sum [(x - (calcMean floatlist))**2 | x <- floatlist])