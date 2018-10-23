module Poker where

-- import System.Random

data Naipe = Ouros | Espadas | Paus | Copas deriving (Eq, Enum, Show)

data Carta = Carta {
    valor :: Char,
    naipe :: Naipe
} deriving (Eq, Show)

baralho :: [Carta]
baralho = [ Carta valor naipe | valor <- "A1234567890JQK", naipe <- [Ouros .. Copas] ]

player1 :: [Carta]
player1 = take 5 baralho

player2 :: [Carta]
player2 = filter (\x -> not (elem x player1)) . take 5 $ baralho
