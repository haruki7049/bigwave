module Main where

import Bigwave (Samples (..), Wave (..), WritableWave (..))
import Data.Array

main :: IO ()
main = do
  -- 1. Generate 100 dummy samples (e.g., 16-bit PCM data initialized to 0)
  let sampleData :: Array Int Int
      sampleData = listArray (0, 99) (replicate 100 0)

  -- 2. Wrap the array in 'Samples'
  let mySamples = Samples sampleData

  -- 3. Create the 'Wave' record
  let myWave =
        Wave
          { waveSamples = mySamples,
            waveSampleRate = 44100,
            waveChannels = 2
          }

  -- 4. Use the typeclass method to write it to a file
  writeWave "output.wav" myWave
  putStrLn "File written."
