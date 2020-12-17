-- numbers between 1 and 100 that have collatz chain length more than 15

collatz_func :: Integral a => a -> a
collatz_func x
    | even x = x `div` 2
    | otherwise = 3*x + 1


collatz_chain :: Integral a => a -> [a]
collatz_chain 1 = [1]
collatz_chain start = start:collatz_chain (collatz_func start)


-- Chains with less than 15 length: 
chains = map head (filter length_checker (map collatz_chain [1..100]))
    where length_checker xs = length xs <= 15 
