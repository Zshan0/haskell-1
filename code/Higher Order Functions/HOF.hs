-- Multiply 2 numbers
multiply a b = a * b
multiplyWith4 = multiply 4

-- Passing function as argument

applyTwice :: (a -> a) -> a -> a
applyTwice f a = f (f a)

-- Applying a function 2 a list of 2 arguments and then zipping them into another list:
zipWith_self :: (a -> b -> c) -> [a] -> [b] -> [c]

zipWith_self _ [] _ = []
zipWith_self _ _ [] = []
zipWith_self f (x:xs) (y:ys) = (f x y):(zipWith_self f xs ys)

-- Map function: Applying a function to all the elements of a list
map_self :: (a -> b) -> [a] -> [b]
map_self _ [] = []
map_self f (x:xs) = (f x):(map_self f xs)

-- Filter function
filter_self :: (a -> Bool) -> [a] -> [a]

filter_self _ [] = []
filter_self p (x:xs)
    | p x = x:remains
    | otherwise = remains
    where remains = filter_self p xs


-- Sum using folds

sum_self list = foldl (\acc x -> acc + x) 0 list

-- Sum of square root of numbers not exceeding 1000

root_sum = length (takeWhile (<=1000) (scanl (+) 0 (map sqrt [1..])))


