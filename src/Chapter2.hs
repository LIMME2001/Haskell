module Chapter2
    ( c2e4,
    c2e5
    ) where

{- 
Exercise 1: Work through the examples from this chapter using GHCi

write:
    ghci 
in the terminal

then write whatever code you want to test. 

:q      -- exits the terminal

-}

{- 
Exercise 2: Parenthesise the following numeric expressions

2^3*4
=   (2^3)*4

2*3+4*5
=   (2*3)+(4*5)

2+3*4^5
=   2+(3*(4^5))

-}

{- 
Exercise 3: The script below contains three syntactic errors. Correct these errors and then check that your script works properly using GHCi

N =  a 'div' length xs
     where
         a = 10
        xs = [1,2,3,4,5]

correct:
N = a `div` length xs
    where
        a = 10
        xs = [1,2,3,4,5]
-}

{- 
Exercise 4: The library function last selects the last element of a non-empty list; for example 
    last [1,2,3,4,5] = 5
Show that the function last could be defined in terms of the other library functions introduced in this chapter. 
Can you think of another possible definition?

last xs = head (reverse xs)         -- takes the head of a reversed list
last xs = xs !! (length xs - 1)     -- selects the element in the last position (length xs - 1) gives the last index

-}

c2e4 :: [a] -> a
c2e4 xs = head (reverse xs)

{- 
Exercise 5: The library function init removes the last element from a non-empty list; for example;
    init [1,2,3,4,5] = [1,2,3,4]
Show how init could similarly be defined in two different ways

-- Using take:
init :: [a] -> [a]
init xs = take (length xs - 1) xs

-- Using take:
init :: [a] -> [a]
init xs = reverse (tail (reverse xs))


----- OVERKILL -----

-- Using recursion
init :: [a] -> [a]
init [_] = []               -- Base case: a list with one element strips it
init (x:xs) = x : init xs   -- Recursive case: prepend the head to the result of init on the tail

-- Using list comprehension
myInit2 :: [a] -> [a]
myInit2 xs = [x | (x, i) <- zip xs [0..], i < length xs - 1]
-}

c2e5 :: [a] -> [a]
c2e5 xs = take (length xs - 1) xs