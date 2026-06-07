module Bigwave (someFunc) where

import Data.Array
import Data.Word

newtype Samples a = Samples (Array Int a) deriving (Show, Eq)

data Wave a = Wave
  { waveSamples :: Samples a,
    waveSampleRate :: Word32,
    waveChannels :: Word16
  }
  deriving (Show, Eq)

someFunc :: IO ()
someFunc = putStrLn "someFunc"
