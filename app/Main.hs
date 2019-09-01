module Main where

import Lib
import Data.List

main :: IO ()
main = do
  putStrLn "Running word game...."
  putStrLn "<<<<<LANGUAGES>>>>>"
  print languages
  putStrLn "<<<<<FORMATEED GRID>>>>>"
  outputGrid $ getLines grid