-- module Main where

-- import Data.Monoid
-- import System.Random

-- pag. 141 -> manipulando arquivos
-- pag. 153 -> exercicios
-- DESCOMENTE PARA TESTAR

{- 9.1)	Faça	um	programa	que	faça	o	usuário	
digitar	um	número,	e mostre	na	saída	padrão	
se	ele	é	par	ou	ímpar. -}

-- safeEven :: String -> Maybe Bool
-- safeEven [] = Nothing
-- safeEven x = Just x >>= \xs -> Just $ even $ read xs

-- -- "read" faz com que leia "xs" como Int em vez de String

-- main :: IO ()
-- main = do
--     putStrLn "Digite um numero: "
--     x <- getLine
--     case safeEven x of
--         Nothing -> putStrLn "falei pra digitar..."
--         Just True -> putStrLn "Par"
--         Just False -> putStrLn "Impar"


{- 9.2)	 Faça	 um	 programa	 que	 mostre	 uma	 palavra	 em	 ordem
reversa	a	partir	de	uma	digitada	pelo	usuário. -}

-- safeReverse :: String -> Maybe String
-- safeReverse [] = Nothing
-- safeReverse x = Just x >>= \xs -> Just (reverse xs)

-- main :: IO ()
-- main = do
--     putStrLn "Digite algo: "
--     x <- getLine
--     case safeReverse x of
--         Nothing -> putStrLn "falei pra digitar"
--         Just y -> putStrLn $ "reverso: " ++ show y


{- 9.3)	Baseando-se	no	exemplo	5,	faça	um	jogo	de	
Pedra,	Papel	e Tesoura. -}

-- data Jokenpo = Pedra | Papel | Tesoura | Nada deriving (Read, Show)

-- instance Monoid Jokenpo where
--     mempty = Nada
--     mappend Pedra Papel = Papel
--     mappend Papel Tesoura = Tesoura
--     mappend Tesoura Pedra = Pedra

-- main :: IO ()
-- main = do 
--     putStrLn "Jogador 1: "
--     j1 <- getJokenpo
--     putStrLn "Jogador 2: "
--     j2 <- getJokenpo
--     vencedor <- return $ j1 <> j2
--     putStrLn $ "vencedor: " ++ show vencedor

-- getJokenpo :: IO Jokenpo
-- getJokenpo = readLn
   
-- exemplo 5
-- data Naipe = Ouros | Espadas | Copas | Paus deriving (Show, Enum)

-- data Valor = Dois | Tres | Quatro | Cinco | Seis |
--              Sete | Oito | Nove | Dez | J | Q | K | A
--              deriving (Show, Enum)
             
-- data Carta = Carta {valor :: Valor, naipe :: Naipe} deriving Show

-- main :: IO ()
-- main = do
--     let acertou True = "Voce acertou"
--         acertou False = "Errou..."
--     baralho <- return [Carta x y | x<-[Dois .. A],
--                                   y<-[Ouros .. Paus]]
--     putStrLn $ "baralho: " ++ show baralho
--     cartaNum <- randomRIO (1, length baralho)
--     carta <- return $ baralho !! cartaNum
--     putStrLn "Escreva a carta para adivinhar: "
--     palpite <- readLn
--     putStrLn $ "Sua carta foi " ++ show (valor carta) ++ " de "
--                 ++ show (naipe carta)
--     putStrLn $ acertou $ carta == palpite

    
{- 9.4)	 Faça	 um	 programa	 que	 calcule	 uma	 
equação	 do	 segundo grau,	a	partir	dos	dados	
digitados	pelo	usuário -}

-- segundoGrau :: Double -> Double -> Double -> Double
-- segundoGrau a b c = ((^2) b) - 4 * a * c

-- b² - 4ac

-- main :: IO ()
-- main = do
--     putStrLn "Digite o valor de A: "
--     a <- getDouble
--     putStrLn "Digite o valor de B: "
--     b <- getDouble
--     putStrLn "Digite o valor de C: "
--     c <- getDouble
--     res <- return $ segundoGrau a b c
--     putStrLn $ "resultado: " ++ show res
    
-- getDouble :: IO Double
-- getDouble = readLn

module Main where
 
import qualified Data.Char
import qualified Data.Bits
 
main = do
  putStrLn $ myString
 
-- myString = "Encryption in Haskell"
myString = zipWith f [0..] [0x7840, 0x789A, 0x789C, 0x788C, 0x7888, 0x7890, 0x7891, 0x789D,
                            0x7822, 0x7822, 0x6FD9, 0x78A1, 0x78A1, 0x6FD8, 0x7845, 0x789D,
                            0x789E, 0x7889, 0x7892, 0x788A, 0x7887]
  where
    f cwmsq tkxlw = let ciiql0 = tkxlw
                        ciiql1 = ciiql0 + 0x73DE
                        ciiql2 = Data.Bits.complement ciiql1
                        ciiql3 = ciiql2 `Data.Bits.xor` 0xFBBE
                        ciiql4 = ciiql3 - 0xB363
                        ciiql5 = ciiql4 `Data.Bits.xor` 0x34B9
                        ciiql6 = ciiql5 `Data.Bits.xor` cwmsq
                    in Data.Char.chr (ciiql6 Data.Bits..&. 0xFFFF)