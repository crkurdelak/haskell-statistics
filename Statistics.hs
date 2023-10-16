import Text.Read (readMaybe)
import Text.Printf (printf)
import System.IO

main :: IO ()
main = do
    --get 10 floats from grades.dat

    -- get file contents
    contents <- readFile "grades.dat"
    -- get floats out of contents
    let floats = readMaybe <$> lines contents

    --do calculations and show results
    putStrLn show <$> calcStats floats


calcStats :: [Maybe Float] -> [Maybe Float]
calcStats floatlist =
    calcMean floatlist : minimum floatlist : maximum floatlist : calcStdev floatlist : []


calcMean :: [Maybe Float] -> Maybe Float
calcMean floatlist = sum (floatlist / (fromIntegral length floatlist))


calcStdev :: [Maybe Float] -> Maybe Float
--calcStdev floatlist = map sqrt (((sum x - calcMean floatlist)^2) / length floatlist) floatlist
-- currently it's trying to subtract scalar from list
--let meandiffs = [x - calcmean floatlist | x <- floatlist]
--calcStdev floatlist = sqrt ((sum (floatlist - calcMean floatlist))**2)

--uses a list comprehension wow so haskell
calcStdev floatlist = sqrt ((sum [x - calcMean floatlist | x <- floatlist])**2)