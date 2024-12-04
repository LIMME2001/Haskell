module Chapter3
    ( 
    ) where

{- 
Exercise 1: What are the types of the following values?

['a', 'b', 'c']                 -- [Char]
('a', 'b', 'c')                 -- (Char, Char, Char)
[(False, '0'), (True, '1')]     -- [(Bool, Char)]
([False, True], ['0', '1'])     -- ([Bool], [Char])
[tail, init, reverse]           -- [[a] -> [a]]

using the 
:type
command in GHCi gives us the same answers
-}

{- 
Exercise 2: Write down definitions that have the following types;
It doesn't matter what the definition actually do as long as they are type correct.

bools :: [Bool]
bools = [True, False, True]

nums :: [[Int]]
nums = [[1, 2], [3, 4, 5], []]


add :: Int -> Int -> Int -> Int
add x y z = x + y + z

copy :: a -> (a, a)
copy x = (x, x)

apply :: (a -> b) -> a -> b
apply f x = f x
-}

{- 
Exercise 3: What are the types of the following functions?

second xs = head (tail xs)
-- second :: [a] -> a

swap (x,s) = (y,x)
-- swap :: (a, b) -> (b, a)

double x = 2*x
-- double :: Num a => a -> a        (Num needed as it have to be a numeric type)

palindrome xs = reverse xs == xs
-- palindrome :: Eq a => [a] -> Bool        (Eq needed as they have to be comparable)

twice f x = f (f x)
-- twice :: (a -> a) -> a -> a
-}

{- 
Exercise 4: Check your answers to the preceding three questions using GHCi
use the
:type
command on every single one to check them. 

sadly :type can't be run in a compiled Haskell program so everything have to be done using GHCi commands
-}

{- 
Exercise 5: Why is it not feasible in general for function types to be instances of the Eq class? 
When is it feasible? Hint: two functions of the same type are equal if they always return equal results for equal arguments.

Answer:
The Eq type class is used for types whose values can be compared for equality using (==) and /=. 
For function types (a -> b), it is not feasible in general to implement these operations for the following reasons:

A function can have an infinite number of possible inputs (e.g., all integers or all real numbers).
To determine if two functions are equal, you would need to check if they return the same output for every possible input. This is impossible for most cases due to the infinite input space.

Even for finite input domains, checking equality of functions would require applying the functions to every input in the domain and comparing their outputs. This can be computationally expensive or infeasible.

For certain functions, especially those involving recursion or higher-order functions, it is undecidable whether two functions are equal. This is related to the Halting Problem, which states that it is impossible to determine whether an arbitrary program will terminate.


It is feasible for function types to be instances of Eq only in cases where the domain of the function is finite and small, and equality can be explicitly checked for all inputs.

For functions with a finite input domain like Bool (True and False), equality can be determined by explicitly checking the outputs for both possible inputs:
    f1 :: Bool -> Bool
    f1 True  = True
    f1 False = False

    f2 :: Bool -> Bool
    f2 True  = True
    f2 False = False

    -- Check equality for all inputs
    equalBoolFuncs = f1 True == f2 True && f1 False == f2 False  -- True

For functions over enumeration types (finite types like data Day = Monday | Tuesday | ...), equality can also be checked by comparing outputs for all possible inputs.
-}