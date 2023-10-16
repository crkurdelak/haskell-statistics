import Text.Read (readMaybe)
import Text.Printf (printf)
import System.IO

main :: IO ()
main = do
    --get 10 floats from grades.dat
    --contents <- map readMaybe <$> lines <$> readFile "grades.dat" :: [Maybe Float]
    floats <- (map readMaybe (lines (readFile "grades.dat"))) :: [Maybe Float]

    --do calculations and show results
    --putStrLn show (calcStats (map readMaybe (lines contents)))
    putStrLn show (calcStats floats)

calcStats :: [Maybe Float] -> [Maybe Float]
calcStats floatlist =
    calcMean floatlist : minimum floatlist : maximum floatlist : calcStdev floatlist : []


calcMean :: [Maybe Float] -> Maybe Float
calcMean floatlist = sum floatlist / length floatlist


calcStdev :: [Maybe Float] -> Maybe Float
calcStdev floatlist = map sqrt (((sum x - calcMean floatlist)^2) / length floatlist)
