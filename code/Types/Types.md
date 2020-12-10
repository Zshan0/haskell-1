# Types

- Haskell has static types. Which are defined during compilation time, unlike python where the types can change (dynamic).
- But, unlike C it can identify the type for variables on its own, there is no need to declare them as `int` or `char`.
- Explicit types start with an uppercase always.

## Function types
- Based on the types of parameters and the return value, the function types are described.
```Haskell
doubleMe list = [ 2 * x | x <- list ]
``` 
doubleMe is of the type `Num a => [a] -> [a]` which means that input and output both are list of Num.
 
### More than 1 parameter
Suppose we have a function:
```Haskell
addUs x y = x + y
```
The type will be `Num a => Int -> Int -> Int` There is no difference between return type and parameter type.

## Basic Types.

- Int: Bounded integers, can be of 32 bit only.
- Integer: Unbounded but less efficient.
- Float: floating with single precision.
- Double: Double precision of float.
- Bool: True or False.
- Char: ASCII characters
Tuples of each size and description(Based on element types) are also types. `()` is also a type which can only have 1 value i.e `()`.

## Type variables

As seen before, `a` used in types, such as head:
```Haskell
[a] -> a
```
This means that `a` is a type variable(not a type since lowercase) and can take any type(as value).

## Typeclasses

When representing types, things represented before `=>` are class constraints.
```Haskell
:t (==)
-- returns
(==) :: (Eq a) => a -> a -> Bool
```
- Which means that a belongs to `Eq` class. Eq typeclass means that a must be comparable.

- Similarly there is an `Ord` class which means the objects can be compared.
- `Show` is a typeclass whose member types can be displayed as strings, and read is the typeclass whose values can be read from strings.

- `Read` return value ambiguity: We specify the return value of the read. For example by doing read "2.1" + 1.2 we make sure that the return value will be a Num.

- Proper way to define it will be read `"2.1" :: Float` (:: means "is of type")
- `Enum` is a typeclass of sequentially ordered types. They also have succ and pred.
- `Bounded` is a class which has bounds, such as Int(32 bit bound).
- `Num` typeclass whose members can act as numbers.
- `Integral` Subclass of Num, which contains only integer taking types.
- `Floating` Similar to Num, contains only float taking types.

