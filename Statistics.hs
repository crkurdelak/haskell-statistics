import Text.Read (readMaybe)
import Text.Printf (printf)
import System.IO

main :: IO ()
main = do
    --get 10 floats from grades.dat
    contents <- readMaybe <$> readFile "grades.dat"

    --do calculations and show results
    putStrLn (calcStats contents)

calcStats :: [Maybe Float] -> [Float]
calcStats floatlist =
    calcMean floatlist : calcMin floatlist : calcMax floatlist : calcStdev floatlist : []


calcMean :: [Maybe Float] -> Float
calcMean floatlist = 0.0


calcMin :: [Maybe Float] -> Float
calcMin floatlist = 0.0


calcMax :: [Maybe Float] -> Float
calcMax floatlist = 0.0


calcStdev :: [Maybe Float] -> Float
calcStdev floatlist = 0.0
