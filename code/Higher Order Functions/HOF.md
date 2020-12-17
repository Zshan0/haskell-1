# Higher order functions
In functional programming, you can treate functions as rest of the objects. So that means you can pass and return functions from another function.
A function that does this is called **Higher Order Function**

## Curried Functions

Officially, Haskell functions can only take one parameter. But we use the concept of Curried functions to pass more than 1 parameter.

So when we pass 2 parameters, Using the 1st parameter it creates another "dummy" function, which then later takes in the 2nd parameter as its input and computes the required output.

Example:
```Haskell
max 4 5
-- Creates a new function:
(max 4) 5
```
Here, `max 4` is a function which returns the larger among `4` and the parameter.

### Different way to look at function definitions
A function definition does not differ between the arguments and the return value, also remember that officially functions only take 1 parameter. So another way to look at function definition is to put `()`:
```Haskell
max :: (Ord a) => a -> a -> a
-- Can be written as:
max :: (Ord a) => a -> (a -> a)
```
This means that max takes an argument `a` and then returns a function of the type `a -> a`. Hence max is a higher order function here which returns a function.

### Partially applied Functions

Suppose there is a function which takes 5 arguments. But we only pass it 3 arguments and we return this function.
Now this function can be then used by passing 2 more arguments elsewhere, The function returned by the higher order function is a **Partially applied** function.

Creating Partially applied functions using infix operator:
```Haskell
multiplyWith3 :: (Floating a) => a -> a
multiplyWith3 = (*2)
```


## Maps
Creating a function that will take a function and a list and apply the function to all the members of the list.
```Haskell
-- Map function: Applying a function to all the elements of a list
map_self :: (a -> b) -> [a] -> [b]
map_self _ [] = []
map_self f (x:xs) = (f x):(map_self f xs)
```
This in reality can be written using list comprehension, but map sometimes make it more readable and clean.

One example use:
```Haskell
map (map (^2)) [[1,2],[3,4,5,6],[7,8]]
```
To square all the elements of the lists present in a list.

### Filters
A function that will take a predicate(Function mapping to T/F) and a list. If the element of the list evaluates the predicate to True, it is retained in the list.

```Haskell
filter_self _ [] = []
filter_self p (x:xs)
    | p x = x:remains
    | otherwise = remains
    where remains = filter_self p xs
```

### takeWhile
A function which takes in a predicate and a list, returns elements as long as one element doesn't fail the predicate. Once the predicate fails it stops returning elements.

```Haskell
takeWhile divBy4 [1..]
-- Returns [1, 2, 3]
```

## Lambdas

Functions which are written for one time use. This means you don't have to give them names, usually used for passing it to another higher order function.

```Haskell
greaterThan2 = (\x -> x > 2)
```
Unlike other functions, you can not have multiple cases of pattern matching, so if a pattern match fails for a lambda function, a runtime error occurs.

## Folds

Applying a function to a whole list to reduce it down to a single value.
A fold take 3 parameters, A **binary function**, an accumulator and a list.
The function is called with the accumulator and the 1st element of the list, the return value is now the new accumulator and the remains of the lsit is the now used again.
At the end, the only thing remaining is the accumulator whose value is returned.

Recreating sum using fold:
```Haskell
sum_self list = foldl (\acc x -> acc + x) 0 list
```
Using partial functions, we can simplify it down to:
```Haskell
sum_self = foldl (+) 0
```
Here `+` is the binary operator, `0` is the accumulator, and whatever will be passed to `sum_self` will be the list argument.

**Difference between foldl and foldr:**
In the binary operator used, in `foldl`: `\acc x ->` but the order is reversed, in `foldr` : `\x acc ->` is the order (makes sense if you imagine the folding)

### foldl1 and foldr1

Instead of passing an accumulator, it assumes that the 1st(or the last) element of the list is the accumulator's initial value.

### Getting the intermediate accumulators
`scanl` and `scanr` function the same was as `fold` but they also display all the values of the intermediate accumulators in the form of a list

```Haskell
cumulativeSum = scanl (+) 0  
```
This can be then used by passing another argument to generate the cumulative sum.

## Function application ($)

A function with lowest precedence. Can be used to change the order of functions without using explicit `()`. 

```Haskell
sum(map sqrt [1..])
-- Can be rewritten as:
sum $ map sqrt [1..]
```
It can be thought of as writing a `(` at its position and `)` at the end of the expression.

### Using $ to pass an argument over a list of functions
```Haskell
map ($ 3) [(4+), (10*), (^2), sqrt]
```
Here `3` serves as the 2nd parameter for all the functions in the list.

### Function compositions
To combine functions we use `.`
To write `f(g(x))` we can write:
```Haskell
f . g x
```
This is helpful to write partial functions with composite functions, that is:
```Haskell
g x = a(b(c(a x)))
-- Can be written as:
g = a . b . c a
```


