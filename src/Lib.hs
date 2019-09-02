module Lib
    ( 
    findWords
    ,findWordInLine
    ,findWord
    ,outputGrid
    ,formatGrid
    ,getLines
    ,skew
    ,diagonalize
    ) where

-- User Defined modules
import Data

-- HASKELL modules
import Data.List (transpose, isInfixOf)
import Data.Char (toUpper)
import Data.Maybe (catMaybes)

-- Types
type Grid = [String] -- more readable code by defining symbols like this
skewSymbol = '^' -- global variable used in skew function



-- Application Logic functions
findWords :: Grid -> [String] -> [String]
findWords grid words = 
    let foundWords = map (findWord grid) words
    in catMaybes foundWords

findWord :: Grid -> String -> Maybe String
findWord grid word = 
  let lines = getLines grid
      found = or $ map (findWordInLine $ map toUpper word) lines
  in if found then Just word else Nothing

findWordInLine :: String -> String -> Bool
findWordInLine word line = word `isInfixOf` line


-- Helper functions
outputGrid :: Grid -> IO()
outputGrid grid = putStrLn $ formatGrid grid

formatGrid :: Grid -> String
formatGrid = unlines

getLines :: Grid -> [String]
getLines grid = 
    let horizontal = grid
        vertical = transpose grid
        diagonal1 = diagonalize horizontal 
        diagonal2 = diagonalize (map reverse horizontal) 
        lines = horizontal ++ vertical ++ diagonal1 ++ diagonal2
    in lines ++ (map reverse lines)

skew :: Grid -> Grid
skew [] = []
skew (l:ls) = l : skew (map indent ls)
    where indent line = skewSymbol : line

diagonalize :: Grid -> Grid
diagonalize  = transpose . skew 