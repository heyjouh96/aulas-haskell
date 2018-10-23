module Exer where

import Data.Char

--a) [1,11,121,1331,14641, 161051,1771561]

execA :: [Int]
execA = map (11^) [1..6]
-- execA = [ 11^xs | xs <- = [1..6] ]

execB :: [Int]
execB = filter (\ x -> mod x 4 /= 0) [1..40]

execC :: [String]
execC = map (\ x -> "A" ++[x] ++"BB") ['a'..'g']

--
execD :: [Int]
execD = filter (\x -> not (elem x [14,23,35]) ) [5,8..41]

--4.1 	Faça uma função que retorne a média de um [Double],usando foldl	
exec41 :: [Double] -> Double
exec41 x =  foldl (+) 0 x / aux 
    where aux = fromIntegral $ length x
    
-- 4.5 Implemente	uma	função	que	receba	uma	lista	de	inteiros	e
-- retorne	o	dobro	de	todos,	eliminando	os	múltiplos	de	4

exec45 :: [Int] -> [Int]
exec45 x = filter (\y -> mod y 4 /= 0) . map (2*) $ x

-- exec45 :: [Int] -> [Int]
-- exec45 x = map (2*) . filter (\y -> mod y 4 /= 0) $ x

-- 4.6	Faça uma função	func que receba	uma	função f de	tipo
-- 	(String	->	String), e uma String s que	retorna	o reverso de
-- 	s concatenado com	aplicação da função f em s.

upp :: String -> String 
upp x = [ toUpper xs | xs <- x ]

exec46 :: (String -> String) -> String -> String
exec46 f s = f "oix" ++ reverse s



-- map () [] []      = []

-- (a -> b -> c) -> [a] -> [b] -> [c]
-- ((+) x y) [1,2] [3,4]   = [4,6]

-- [x+y | x <- [1..5], y <-[1..2]]

-- [ (+) xs ys | xs<-[1,2], ys<-[2,3] ]

une :: Char -> Char -> String
une x y = [x] ++ [y]

map2 :: (a -> b -> c) -> [a] -> [b] -> [c]
map2 f x y = [ f xs ys | xs<-x, ys<-y ]


-- map2 f x y = map (\x -> asdas) x 

