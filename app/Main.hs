module Main where

-- Custom Modules
import Data
import Lib

-- Haskell Modules
import Data.List

main :: IO ()
main = do
  putStrLn "\n\nRunning word game...."
  putStrLn "\n<<<<<LANGUAGES>>>>>"
  print languages
  putStrLn "\n\n<<<<<GRID>>>>>"
  outputGrid grid