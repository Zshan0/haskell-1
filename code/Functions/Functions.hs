isZero :: (Integral a) => a -> String 
isZero 0 = "A zero"
isZero x = "not a zero"

factorial :: (Integral n) => n -> n
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Checking if the input is repeated.
yes :: Char -> String
yes 'y' = "yes"
-- yes 'y' = "no" Gives a warning about redundant statement.

pairSwap :: (a, b) -> (b, a)
pairSwap pair = (snd pair, fst pair)

-- Cleaner way to write:
swapPair :: (a, b) -> (b, a)
swapPair (a, b) = (b, a)

-- appendList :: Enum a => a -> b -> a
appendList a b = b:a
