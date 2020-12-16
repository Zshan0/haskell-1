
sum_all :: Num a => [a] -> a
sum_all [] = 0
sum_all (x:a) = x + sum_all a


-- Maximum of a list

maximum_list :: Ord a => [a] -> a
maximum_list [] = error "No elements found"
maximum_list [x] = x

maximum_list (x:rest)
    | x > remains = x
    | otherwise = remains
    where remains = maximum_list rest

-- Replicating an element x number of times

replicate_self :: Integral a => a -> a -> [a]

-- replicate element times
replicate_self element times 
    | times <= 0 = []
    | otherwise = (element:(replicate_self element (times - 1))) 
    

-- Taking size elements from the start of the 
take_self _ [] = []
take_self size (top:rest)
    | size <= 0 = []
    | otherwise = (top:(take_self (size - 1) rest))

-- Repeating an element endlessly
repeat_self :: a -> [a]
repeat_self a = a : repeat_self a
