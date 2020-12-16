# Recursion

Haskell has no loops, to work our way around it, we use recursion.

### Sum of a list
Using recursion, we add the elements of a list.

```Haskell
sum_all :: Num a => [a] -> a
sum_all [] = 0
sum_all (x:a) = x + sum_all a
```
Other examples are present in `Recursion.hs`.

