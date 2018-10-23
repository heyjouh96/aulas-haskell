module Ex5 where
    
data Naipe = Ouros | Espadas | Copas | Paus deriving (Show, Enum)

data Valor = Dois | Tres | Quatro | Cinco | Seis |
             Sete | Oito | Nove | Dez | J | Q | K | A
             deriving (Show, Enum)
             
data Carta = Carta {valor :: Valor, naipe :: Naipe} deriving Show

