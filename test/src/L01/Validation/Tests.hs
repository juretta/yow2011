module L01.Validation.Tests where

import Test.Framework
import Test.Framework.Providers.QuickCheck2 (testProperty)
import L01.Validation
import Test.QuickCheck
import Test.QuickCheck.Function

instance Arbitrary a => Arbitrary (Validation a) where
  arbitrary =
    error "todo"

main :: 
  IO ()
main = 
  defaultMain [test]

test :: 
  Test
test =
  
    testGroup "Validation"
      [

      ]

