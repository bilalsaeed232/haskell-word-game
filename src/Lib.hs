module Lib
    ( 
    grid
    ,languages
    ,outputGrid
    ,formatGrid
    ,skew
    ,findWordInLine
    ,findWord
    ,findWords
    ,getLines
    ) where

import Data.List (transpose, isInfixOf)
import Data.Char (toUpper)
import Data.Maybe (catMaybes)

type Grid = [String]

outputGrid :: Grid -> IO()
outputGrid grid = putStrLn $ formatGrid grid


formatGrid :: Grid -> String
formatGrid = unlines



skew :: Grid -> Char -> Grid
skew [] sym = []
skew (l:ls) sym = l : skew (map indent ls) sym
  where indent line = sym : line


getLines :: Grid -> [String]
getLines grid = 
    let horizontal = grid
        vertical = transpose grid
        diagonal = transpose $ skew grid '*'
        lines = horizontal ++ vertical ++ diagonal
    in lines ++ (map reverse lines)

findWord :: Grid -> String -> Maybe String
findWord grid word = 
  let lines = getLines grid
      found = or $ map (findWordInLine $ map toUpper word) lines
  in if found then Just word else Nothing

findWords :: Grid -> [String] -> [String]
findWords grid words = 
    let foundWords = map (findWord grid) words
    in catMaybes foundWords

findWordInLine :: String -> String -> Bool
findWordInLine word line = word `isInfixOf` line



grid = [ "__C________R___"
       , "__SI________U__"
       , "__HASKELL____B_"
       , "__A__A_____S__Y"
       , "__R___B___C____"
       , "__PHP____H_____"
       , "____S_LREP_____"
       , "____I__M_Y__L__"
       , "____L_E__T_O___"
       , "_________HB____"
       , "_________O_____"
       , "________CN_____"
       ]

languages = [ "BASIC"
            , "COBOL"
            , "CSHARP"
            , "HASKELL"
            , "LISP"
            , "PERL"
            , "PHP"
            , "PYTHON"
            , "RUBY"
            , "SCHEME"
            ]

