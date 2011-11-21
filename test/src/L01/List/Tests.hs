module L01.List.Tests
  (
    main
  , test
  ) where

import Prelude hiding (reverse)
import Test.Framework
import Test.Framework.Providers.QuickCheck2 (testProperty)
import L01.List

main :: 
  IO ()
main = 
  defaultMain [test]

test :: 
  Test
test =
    testGroup "List"
      [
        testProperty "reverse with single value" prop_reverse_single_value
      ]

prop_reverse_single_value ::
  Int
  -> Bool
prop_reverse_single_value n =
  reverse (n :| Nil) == (n :| Nil)

