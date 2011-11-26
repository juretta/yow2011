module Main where

import qualified L02.List.Tests
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
        L02.List.Tests.test
      ]
  ]

