module Chapter4
    ( c4e1,
    c4e2,
    c4e3,
    c4e8
    ) where

{- 
Exercise 1: Using the library functions, define a function
    halve :: [a] -> ([a], [a])
that splits an even-lengthed list into two halves. For example

> halve [1,2,3,4,5,6]
([1,2,3], [4,5,6])
-}

halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs -- split it in the middle defined by half the length

c4e1 :: [a] -> ([a], [a])
c4e1 = halve 

{- 
Exercise 2: Define a function 
    third :: [a] -> a 
that returns the third element in a list that contains at least this many elements using:
a. head and tail;
    third :: [a] -> a
    third xs = head (tail (tail xs))

b. list indexing !!
    third :: [a] -> a
    third xs = xs !! 2

c. pattern matching
    third :: [a] -> a
    third (_:_:x:_) = x
-}

third :: [a] -> a
third xs = head (tail (tail xs))

c4e2 :: [a] -> a
c4e2 = third

{- 
Exercise 3: Consider a function
    safetail :: [a] - > [a]
that behaves in the same way as tail except that it maps the empty list to itself rather than producing an error.
Using tail and the function 
    null :: [a] -> Bool 
that decides if a list is empty or not, define safetail using:

a. a conditional expression
    safetail :: [a] -> [a]
    safetail xs = if null xs then [] else tail xs

b. guarded equations
    safetail :: [a] -> [a]
    safetail xs
        | null xs   = []
        | otherwise = tail xs

c. pattern matching
    safetail :: [a] -> [a]
    safetail []     = []
    safetail (_:xs) = xs
-}

safetail :: [a] -> [a]
safetail xs = if null xs then [] else tail xs

c4e3 :: [a] -> [a]
c4e3 = safetail


{- 
Exercise 4: in a similar way to && in section 4.4, show how the disjunction operator || can be defined in four different ways using pattern matching

First:
    (||) :: Bool -> Bool -> Bool
    True  || _     = True
    False || b     = b

Second:
    (||) :: Bool -> Bool -> Bool
    True  || True  = True
    True  || False = True
    False || True  = True
    False || False = False

Third:
    (||) :: Bool -> Bool -> Bool
    False || False = False
    _     || _     = True

Forth:
    (||) :: Bool -> Bool -> Bool
    b || c
        | b == True = True
        | c == True = True
        | otherwise = False
-}


{- 
Exercise 5: Without using any other library functions or operators, show how the meaning of the following pattern matching definitions for logical conjugation && can be formalized using conditional expressions:

    True && True = True
    _    && _    = False

Hint: use two nested expressions

Answer:
    (&&) :: Bool -> Bool -> Bool
    a && b = if a then (if b then True else False) else False
-}

{- 
Exercise 6: Do the same for the following alternative definition, and note the difference in the number of conditional expressions that are required:
    True  && b = b
    False && _ = False

Answer:
    (&&) :: Bool -> Bool -> Bool
    a && b = if a then b else False

Requires only one conditional because b is directly returned when a is True.
-}

{- 
Exercise 7: Show how the meaning of the following curried function definition can be formalized in terms of lambda expressions:
    mult :: Int -> Int -> Int -> Int
    mult x y z = x*y*z

Answer:
mult = \x -> \y -> \z -> x * y * z

in GHCi:
    let mult = \x -> \y -> \z -> x * y * z
    mult 2 3 4
-}

{- 
Exercise 8: The Luhn algorithm is used to check bank card numbers for simple errors such as mistyping a digit, and proceeds as follow:

- consider each digit as a seperate number;
- moving left, double every other number from the second last;
- subtract 9 from each number that is now greater than 9;
- add all the resulting numbers together;
- if the total is devisible by 10, the card number is valid.

Define a function 
    luhmDouble :: Int -> Int
that doubles a digit and subtracts 9 if the result is greater than 9. For example:

> luhnDouble 3
6

> luhnDouble 6
3

Using luhnDouble and the integer remainder function mod, define a function
    luhn :: Int -> Int -> Int -> Int -> Bool
that decides if a four-digit bank card is valid. For example:

> luhn 1 7 8 4
True

> luhn 4 7 8 3
False

In the exercises for chapter 7 we will consider a more general version of this function that accepts card numbers of any length.

-}

luhnDouble :: Int -> Int
luhnDouble x = if doubled > 9 then doubled - 9 else doubled
    where
        doubled = x * 2

luhn :: Int -> Int -> Int -> Int -> Bool
luhn d1 d2 d3 d4 = total `mod` 10 == 0
    where
        total = luhnDouble d1 + d2 + luhnDouble d3 + d4

c4e8 :: Int -> Int -> Int -> Int -> Bool
c4e8 = luhn