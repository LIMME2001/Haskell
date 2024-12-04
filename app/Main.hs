module Main (main) where

import Lib
import Chapter1
import Chapter2

main :: IO ()
main = do
    let result = c1e4 [3, 1, 4, 1, 5, 9, 2, 6]
    putStrLn $ show result