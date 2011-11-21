module Main where

import qualified L01.List.Tests
import Test.Framework

main ::
  IO ()
main = 
  defaultMain tests 

tests ::
  [Test]
tests =
  [
    testGroup "Tests"
      [
        L01.List.Tests.test
      ]
  ]

