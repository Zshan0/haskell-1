# Learning Haskell

## List of random things I learnt in Haskell

### Referential Integrety

A language is said to have referential integrity if the function call can be replaced by the value it returns. Hence the function always returns the same value for a given set of parameters and has no side-effects.

### Displaying errors

You can display error by doing the following:
```Haskell
function input = error "Invalid input"
```
This calls an exception and points the location in the code where the exception was caught.

### Show function

Any input on ghci is put into `show` function which then prints out the result into a readable manner. This does not happen for functions, since there is no neat string to Show a function.

- `:` is much cheaper computationally compared to `++`. (Need to know why)

## Intro

Basic intro of syntax

### Intro.hs

Syntax for lists, functions, conditional statements, list comprehensions and tuple.

### self\_implement.hs

- Implementing list operations using list comprehensions. Needs slicing to implement more complicated operations.
- Another idea would be to implement slicing using the basic commands.
