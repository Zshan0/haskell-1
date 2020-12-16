-- Using Recursion to write quicksort
-- The main idea is the list will be of the following pattern:
-- (elements smaller than a) : a : (elements bigger than a)
-- We perform recursive calls on the left and the right side of the pattern to sort the list fully.
-- Take the first element of the list as the pivot always

quickSort :: Ord a => [a] -> [a]

-- quickSort list
quickSort [] = []
quickSort [a] = [a]

quickSort (pivot:list) =
        let smaller = [x | x <- list, x <= pivot]
            larger = [x | x <- list, x > pivot]
        in smaller ++ [pivot] ++ larger

    
