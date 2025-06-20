module Main where

import qualified Bigwave (someFunc)

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  Bigwave.someFunc
