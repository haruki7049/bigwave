module Bigwave (Wave (..), Samples (..), WritableWave (..)) where

import Data.Array
import Data.Binary
import Data.ByteString.Lazy as BL

newtype Samples a = Samples (Array Int a) deriving (Show, Eq)

data Wave a = Wave
  { waveSamples :: Samples a,
    waveSampleRate :: Word32,
    waveChannels :: Word16
  }
  deriving (Show, Eq)

class WritableWave a where
  writeWave :: FilePath -> a -> IO ()

instance WritableWave (Wave a) where
  writeWave path _ = do
    let dummyData = BL.pack [0 .. 255]
    BL.writeFile path dummyData
