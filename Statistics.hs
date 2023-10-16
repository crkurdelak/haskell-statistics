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
calcStdev floatlist = sqrt ((sum (floatlist - calcMean floatlist))**2)