# Functions and their syntax

## Pattern matching
A common feature among pure functional languages, its similar to defining functions piecewise. Consider the example:
```Haskell
isZero :: (Integral a) => a -> String
isZero 0 = "A zero"
isZero x = "not a zero" 
```
First it checks if the input matches 0, else it will go to the next definition. If the 2nd statement is not defined, it will still compile but when ran on something other than 0 will give an exception "Non-exhaustive function".

### Recursion in Haskell

Simple example being Factorial:
```Haskell
factorial :: (Integral n) => n -> n
factorial 0 = 1
factorial n = n * factorial (n - 1)
```

### Writing cleaner functions in Haskell using Pattern matching

Consider an example:
```Haskell
pairSwap :: (a, b) -> (b, a)
pairSwap pair = (snd pair, fst pair)
```
But there is a cleaner way to write this:
```Haskell
swapPair :: (a, b) -> (b, a)
swapPair (a, b) = (b, a)
```

### Patterns
To break something into pieces but still keep the original piece as a copy, we use `patterns`.
```Haskell
list@(top:rest)
```
Here the whole list is maintained as list, but the top and the rest is also separated and stored.

## If else conditions
Referred to as gaurds, It checks for a boolean expression to be true, if it is then it executes it and moves, else it will look for the next statement.

```Haskell
divisblity_check :: (Integral a) => a -> String
divisblity_check num
    | num `mod` 2 == 0 = "Even number"
    | num `mod` 3 == 0 = "Multiple of 3"
    | otherwise = "Too lazy to calculate sorry"
```
(I was also very lazy to come up with another example different from the one in .hs file)
If there is no `otherwise` and no other bounds, then there is an exception for the function being non-exhaustive.
`otherwise` is nothing but something that always evaluates to True.(You can also just write True or any statement which will evaluate to True).


### Gaurds with Where
Suppose there are statements with repetetative statements, to avoid repetation we can just replace it using `where`:
```Haskell
height_measure :: RealFloat a => a -> String
height_measure height
    | height >= tall = "You are so tall"
    | height >= decent = "You're average, its alright"
    | otherwise = "Smol human"
    where           
        tall = 1.8
        decent = 1.6   
```
The names have to be aligned or else they won't be recognized

`where` keyword need not be just used along with gaurds but with any other statement too


## Let keyword
Similar to where keyword, but they are localized rather than the whole function or even the gaurds.
They can be used anywhere, such as:
```Haskell
cube_area :: (RealFloat a) => a -> a
cube_area a = 
    let oneSide = a * a
    in 6 * a
``` 
The keywords defined in `let` can only be accessed in `in` statements. You can put let statement anywhere just like putting if else statements.

To assign more than 1 statements in `let` statements we use `;`

```Haskell
(let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)  
```

## Case expressions

In reality, the function piecewise definations are nothing but syntactic sugar. For example:
```Haskell
listSize :: Num a => [a] -> String

listSize xs = "The list has " ++ case xs of [] -> "No elements"
                                            [x] -> "One element"
                                            xs -> "More than one element"
```
Alternate(Probably cleaner way) of writing case statements:
```Haskell
describeList :: [a] -> String  
describeList xs = "The list is " ++ what xs  
    where what [] = "empty."  
          what [x] = "a singleton list."  
          what xs = "a longer list."  
``` 
