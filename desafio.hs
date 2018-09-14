module Desafio where

-- 1)

une :: Char -> Char -> String
une x y = [x] ++ [y]

map2 :: (a -> b -> c) -> [a] -> [b] -> [c]
map2 f x y = [ f xs ys | xs<-x, ys<-y ]

-- map2 une ['A','B'] ['C','D']

-- 2) REFAZER OS EXERCICIO DO CAP1 USANDO FILTER, MAP E FOLDL

e21a :: [Int]
e21a = map (11^) [0..6]

e21b :: [Int]
e21b = filter (\x -> mod x 4 /= 0) [1..40]

e21c :: [String]
e21c = map (\x -> "A"++[x]++"BB") ['a'..'g']

e21d :: [Int]
e21d = filter (\x -> not (elem x [14,23,35])) [5,8..41]

e21e :: [Double]
e21e = map (\x -> x/2) [2.0,1.0,0.5,0.25,0.125,0.0625]

e21f :: [Int]
e21f = map (\x -> x) [1,10..64]

e21g :: [Int]
e21g = filter (\x -> not (elem x [6, 14, 20, 26])) [2,4..30]

e21h = filter (\x -> not (elem x "BFHIK")) . map (\x -> x) $ ['@'..'L']

e22 :: String -> Bool
e22 x = even . length $ x

e23 :: [String] -> [String]
e23 x = map (\y -> reverse y) x

e24 :: [String] -> [Int]
e24 x = filter (\y -> mod y 2 /= 0) . map (\y -> length y) $ x

