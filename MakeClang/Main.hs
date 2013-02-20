module Main where

import SourceDB

main = do putStrLn "hello world"
          handle <- openDB
          putStrLn "got it opened!"
          addOrUpdateRecord handle "/sprockets" "mksprocket /sprockets"
          addOrUpdateRecord handle "/sprockets" "newmksprocket /sprockets"
          closeDB handle
          putStrLn "got it closed!"
