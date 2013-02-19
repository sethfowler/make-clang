module Main where

import SourceDB

main = do putStrLn "hello world"
          handle <- openDB
          putStrLn "got it opened!"
          closeDB handle
          putStrLn "got it closed!"
