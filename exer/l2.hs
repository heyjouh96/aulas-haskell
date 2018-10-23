module L2 where
-- 3.1, 3.8, 3.10

-- 3.1
data Pergunta = Sim | Nao

pergNum :: Pergunta -> Int
pergNum Sim = 0
pergNum Nao = 1

listPergs :: [Pergunta] -> [Int]
listPergs x = [ pergNum xs | xs <- x ]

{- tabela verdade: 
    - AND: só 0 quando 0 0
    - OR: só 1 quando 1 1 -}
    
lAnd :: Pergunta -> Pergunta -> Int
lAnd Sim Sim = 0
lAnd _ _ = 1

lOr :: Pergunta -> Pergunta -> Int
lOr Nao Nao = 1
lOr _ _ = 0

lNot :: Pergunta -> Int
lNot Sim = 1
lNot Nao = 0

-- 3.2
data Temperatura = Celsius | Farenheit | Kelvin

converterCelsius :: Double -> Temperatura -> String
converterCelsius x Farenheit = show ((x - 32) / 1.8) ++ " C"
converterCelsius x Kelvin = show (x - 273.15) ++ " C"
converterCelsius x Celsius = "use outro conversor"

converterKelvin :: Double -> Temperatura -> String
converterKelvin x Farenheit = show ((x + 459.67)*5/9) ++ " K"
converterKelvin x Celsius = show (x + 273.15) ++ " K"
converterKelvin x Kelvin = "use outro conversor"

converterFarenheit :: Double -> Temperatura -> String
converterFarenheit x Kelvin = show (x * 9/5 - 459.67) ++ " F"
converterFarenheit x Celsius = show (x * 9/5 + 32) ++ " F"
converterFarenheit x Farenheit = "use outro conversor"

-- 3.3
data Jokenpo = Pedra | Papel | Tesoura deriving (Show)

e33 :: Jokenpo -> Jokenpo -> Maybe Jokenpo
e33 Pedra Papel = Just Papel
e33 Pedra Tesoura = Just Pedra
e33 Papel Pedra = Just Papel
e33 Papel Tesoura = Just Tesoura
e33 Tesoura Pedra = Just Pedra
e33 Tesoura Papel = Just Tesoura
e33 _ _ = Nothing

-- 3.4
-- e34 :: String -> String
-- e34 x = [ xs | xs <- x, not (x 'elem' ['A'..'Z']++['a' .. 'z']) ]

-- 3.5
data Unidades = Inch | Yard | Foot 

converterMetros :: Unidades -> Double -> String
converterMetros Inch x = show (x*0.0254) ++ "m"
converterMetros Yard x = show (x*0.9144) ++ "m"
converterMetros Foot x = show (x*0.3048) ++ "m"

-- 3.6
data Mes = Jan | Fev | Mar | Abr | Mai | Jun 
         | Jul | Ago | Set | Out | Nov | Dez deriving (Enum, Show, Eq)

prox :: Mes -> Mes -- não ta 100%
prox m = succ m

-- 3.8
e38 :: [Int] -> [Int]
e38 x = reverse [ xs | xs <- x, mod xs 2 /= 0, 
                                mod xs 7 /= 0,
                                xs > 0 ]

-- 3.9
e39 :: String -> String -> String -> (String, String, String)
e39 x y z = (reverse x, reverse y, reverse z)

-- 3.10
-- e310 :: String -> Int -> String
-- e310 s n = s !! 1
-- e310 s n = do
--         let aux = reverse [ sx | sx <- s ]

-- 3.11
data Binario = Zero | Um
data Funcao = Soma2 | Maior | Menor | Mult2

-- revNum :: Int -> [Char] -> [Char]
-- revNum n xs = reverse(take n xs) ++ drop(length n xs)