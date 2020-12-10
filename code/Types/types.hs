x = [1]

y = [1.0, 2.0, 3.0]

doubleMe list = [ 2 * x | x <- list ]

addUs x y = x + y

toFloat string = read string :: Float
