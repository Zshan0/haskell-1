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


