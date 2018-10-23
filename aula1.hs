module Aula1 where

dobro :: Int -> Int
dobro x = 2*x

somarTres :: Int -> Int -> Int -> Int
somarTres a b c = a + b + c

u:: Int
u = 7

foo :: String -> String
foo ls = ls ++ reverse ls

maiorQueZero :: Int -> Bool
maiorQueZero x = x > 0

-- [ x | x<-[0..100], even x, x > 6 ] onde: [ expressão |  , filtro, filtro, ... ] (filtro é sempre uma expressão boleana)
-- [x | x<-[1..40], mod x 4 /= 0] jogo do 'buzz'
-- product [1..7] fatorial 7
-- sum [1..100] soma todos de 1 a 100

fatorial :: Int -> Int
fatorial n = product[1..n]

-- [fatorial x | x<-[1..5]] = [fatorial 1, fatorial 2, fatorial 3, fatorial 4, fatorial 5]
-- [x+y | x <- [1..5], y <-[1..2]] = [1+1, 1+2, 2+1, 2+2, 3+1, 3+2, 4+1, 4+2, 5+1, 5+2]
-- [(True, '2'),(False, '3')] :: [(Bool, Char)]

-- [(x,y) | x<-[1..6], y<-[1..6]] = 2 dados (1 a 6)

-- criando baralho
-- [(numero, naipe) | numero <- "A234567890JQK", naipe <- ["PAUS","COPA","ESPADILHA","PIKAFUMO"]]

-- [(x,y) | x <- ["JOJO", "JAJA", "JIJI"], y <- ["JOJO", "JAJA", "JIJI"], x /= y]
-- ou
-- let coleguinhas = ["JOJO", "JAJA", "JIJI"]
-- [(x,y) | x <- coleguinhas, y <- coleguinhas, x /= y]

rodaDanca :: [String] -> [(String, String)]
rodaDanca coleguinhas = [(x,y) | x <- coleguinhas, y <- coleguinhas, x /= y]
