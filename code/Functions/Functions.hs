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

-- Head (sort of)
head_custom :: [a] -> a
head_custom [] = error "Can't call head on an empty list"
head_custom (x : list) = x

-- Using recursion to construct a length function
length_custom :: (Num a) => [a] -> a
length_custom [] = 0
length_custom (_ : xs) = length_custom xs + 1

-- Displaying the head and the original list
head_display :: String -> String
head_display []  = "No head for an empty string"
head_display xs@(x : rest) = "Head is " ++ [x] ++ " of " ++ xs


-- If else conditions
divisblity_check :: (Integral a) => a -> String
divisblity_check num
    | num `mod` 2 == 0 = "Even number"
    | num `mod` 3 == 0 = "Multiple of 3"
    | otherwise = "Too lazy to calculate sorry"


height_measure :: RealFloat a => a -> String
height_measure height
    | height >= tall = "You are so tall"
    | height >= decent = "You're average, its alright"
    | otherwise = "Smol human"
    where           
        tall = 1.8
        decent = 1.6

cuboid_area :: (RealFloat a) => a -> a -> a -> a
cuboid_area l b h =
    let side1 = l * b
        side2 = b * h
        side3 = l * h
    in 2 * (side1 + side2 + side3) 

listSize :: Num a => [a] -> String

listSize xs = "The list has " ++ case xs of [] -> "No elements"
                                            [x] -> "One element"
                                            xs -> "More than one element"


