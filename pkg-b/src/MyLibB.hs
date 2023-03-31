module MyLibB (someFuncB) where

import MyLibA (someFuncA)

someFuncB :: IO ()
someFuncB = do
  someFuncA
  someFuncA
