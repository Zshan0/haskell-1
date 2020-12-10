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
