-- + Complete the 10 exercises below by filling out the function bodies.
--   The code currently compiles, but none of the tests pass (the test function).
--   Replace the function bodies (error "todo") with an appropriate solution.
-- + These exercises may be done in any order, however:
--   Exercises are generally increasing in difficulty, though some people may find later exercise easier.
--   You will find the tests in the `tests` directory under the `L02.List.Tests` module.
-- + Note the existence of the library function max :: Int -> Int -> Int which will help you with Exercise 9.
-- + Bonus for using the provided functions or for using one exercise solution to help solve another.
-- + Approach with your best available intuition; just dive in and do what you can!


module L02.List where

import Prelude hiding (sum, length, map, filter, maximum, reverse)

-- BEGIN Helper functions and data types

-- The custom list type
data List t = Nil | t :| List t deriving Eq

-- Right-associative
infixr 5 :|

instance (Show t) => Show (List t) where
  show = show . foldRight (:) []

-- functions over List that you may consider using
foldRight :: (a -> b -> b) -> b -> List a -> b
foldRight _ b Nil      = b
foldRight f b (h :| t) = f h (foldRight f b t)

foldLeft :: (b -> a -> b) -> b -> List a -> b
foldLeft _ b Nil      = b
foldLeft f b (h :| t) = let b' = f b h in b' `seq` foldLeft f b' t

reduceRight :: (a -> a -> a) -> List a -> a
reduceRight _ Nil      = error "bzzt. reduceRight on empty list"
reduceRight f (h :| t) = foldRight f h t

reduceLeft :: (a -> a -> a) -> List a -> a
reduceLeft _ Nil      = error "bzzt. reduceLeft on empty list"
reduceLeft f (h :| t) = foldLeft f h t

-- END Helper functions and data types

-- BEGIN Exercises

-- Exercise 1
-- Relative Difficulty: 1
headOr :: List a -> a -> a
headOr Nil a    = a
headOr (h:|_) _ = h

-- Exercise 2
-- Relative Difficulty: 2
sum :: List Int -> Int
sum = foldLeft (+) 0

-- Exercise 3
-- Relative Difficulty: 2
length :: List a -> Int
length = foldLeft (const . succ) 0

-- Exercise 4
-- Relative Difficulty: 5
map :: (a -> b) -> List a -> List b
map f = foldRight (\a b -> f a :| b) Nil

-- Exercise 5
-- Relative Difficulty: 5
filter :: (a -> Bool) -> List a -> List a
filter f = foldRight (\a -> if f a then (a:|) else id) Nil

-- Exercise 6
-- Relative Difficulty: 5
append :: List a -> List a -> List a
append = flip (foldRight (:|))

-- Exercise 7
-- Relative Difficulty: 5
flatten :: List (List a) -> List a
flatten = foldRight append Nil

-- Exercise 8
-- Relative Difficulty: 7
flatMap :: (a -> List b) -> List a -> List b
flatMap f = flatten . map f

-- Exercise 9
-- Relative Difficulty: 8
maximum :: List Int -> Int
maximum = reduceLeft max

-- Exercise 10
-- Relative Difficulty: 10
reverse :: List a -> List a
reverse = foldLeft (flip (:|)) Nil

-- END Exercises

