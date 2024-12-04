module Chapter1
    ( c1e3,
    c1e4,
    c1e5
    ) where

{- 
Exercise 1: Another possible explenation of the calculation of double ( double 2 )

double ( double 2 )
=   {applying inner double}
double ( 2 + 2 )
=   {applying double}
(2 + 2) + (2 + 2)
= {applying the first +}
4 + (2 + 2)
= {applying the second +}
4 + 4
= {applying +}
8

-}

{- 
Exercise 2: Show that sum [x] = x for any x

sum [x]
=   {applying sum (works by going to the next element in the array, if empty do it for an empty array)}
x + sum []
=   {applying sum, sum[] = 0}
x + 0
= {applying +}
x

-}

{- 
Exercise 3: Define a function product that produces the product of a list of numbers and show using your definition that product [2,3,4] = 24

product [] = 1
product (n:ns) = n * product ns

product [2,3,4]
=   {applying product}
2 * product [3,4]
=   {applying product}
2 * (3 * product[4])
=   {applying product}
2 * (3 * (4 * product []))
=   {applying product}
2 * (3 * (4 * 1))
=   {applying *}
24
-}

c1e3 :: Num a => [a] -> a
c1e3 [] = 1
c1e3 (n:ns) = n * c1e3 ns

{- 
Exercise 4: How should the definition of the function qsort be modified so that it produces a reverse sorted version of a list?

c1e4 (aka rqsort)
-}
c1e4 :: Ord a => [a] -> [a]
c1e4 [] = []
c1e4 (x:xs) = c1e4 larger ++ [x] ++ c1e4 smaller
    where
        larger  = [b | b <- xs, b >= x]
        smaller = [a | a <- xs, a < x]

{- 
Exercise 5: What would the effect of replacing <= by < in the original definition of qsort? Hint: consider the example qsort [2,2,3,1,1]

original:
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
    where
        smaller = [a | a <- xs, a <= x]
        larger  = [b | b <- xs, b > x]

modified:
-}
c1e5 :: Ord a => [a] -> [a]
c1e5 [] = []
c1e5 (x:xs) = c1e5 smaller ++ [x] ++ c1e5 larger
    where
        smaller = [a | a <- xs, a < x]
        larger  = [b | b <- xs, b > x]

{- 
c1e5 [2,2,3,1,1]
= {applying c1e5}
c1e5 [1,1] ++ [2] ++ c1e5 [3] -- since [1,1] is smaller and [3] is larger (no equal)
= {applying c1e5}
c1e5 [] ++ [1] ++ c1e5 [] ++ [2] ++ c1e5 [3]
= {applying c1e5}
[] ++ [1] ++ [] ++ [2] ++ c1e5 [] ++ [3] ++ c1e5 []
= {applying c1e5}
[] ++ [1] ++ [] ++ [2] ++ [] ++ [3] ++ []
= {applying ++}
[1,2,3]

In conclusion it stips the duplicates and sorts the rest
-}