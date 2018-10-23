module Aula3 where
    
-- tipos de enumeração (aditivos)
data UnidadeTempo = Hora | Minuto | Segundo deriving (Show, Eq)

-- tipos composto (multiplicativo)
-- os nomes dados aos campos são chamados de "funções de projeção" ou "getters"
data ValorTemporal = ValorTemporal {
    valor :: Int, 
    unidade :: UnidadeTempo 
    } deriving (Show, Eq)
-- valor (ValorTemporal 5 Hora) -> 5
-- unidade (ValorTemporal 5 Hora) -> Hora

-- pattern matching: desconstroi o tipo expondo seus tipos
converterSegundo :: ValorTemporal -> ValorTemporal
converterSegundo (ValorTemporal x Hora) = 
    ValorTemporal (3600*x) Segundo
converterSegundo (ValorTemporal x Minuto) = 
    ValorTemporal (60*x) Segundo
converterSegundo x = x

-- record syntax: "guardas" servem para testar casos boleanos, como se fosse um "if"
converterSegundo2 :: ValorTemporal -> ValorTemporal
converterSegundo2 x
    | unidade x == Hora = ValorTemporal (3600* valor x) Segundo
    | unidade x == Minuto = ValorTemporal (6* valor x) Segundo
    | otherwise = x

modulo :: Double -> Double
modulo x 
    | x >= 0    = x
    | x < 0     = -x
    
-- Exercicio: Faça um tipo chamado Peso e retorno o IMC
-- Abaixo de 18 -> Magro
-- Entre 18 e 25 -> Saudavel
-- Acima de 25 -> Gordo

data Peso = Magro | Saudavel | Gordo deriving (Show, Eq)

imc :: Double -> Double -> Peso
imc peso altura 
    | conta < 18.0 = Magro
    | conta <= 25.0 = Saudavel
    | otherwise = Gordo
    where
        conta = peso/altura**2

 
{- 
    x:xs => um ou mais elementos
    
    x : y : ys => dois ou mais elementos
    
    [1] se encaixa ? NÃO
    1 : []
    
    [1,2,3] se encaixa ? SIM
    1 : 2 : [3]
    x = 1
    y = 2
    ys = [3]
    
    x : y : [] => apenas dois elementos
    
    x : y : z : zs => tres elementos ou mais
    
    x : y : z : [] => apenas tres elementos
    
    a : _ : b => 3 ou mais elementos, ignorando o 2
-}

safeHead :: String -> Maybe Char
safeHead [] = Nothing
safeHead (x:xs) = Just x


--------RECURSIVIDADE--------

fat :: Int -> Int
fat n
    | n <= 1 = 1
    | otherwise = n * fat (n-1)
    
{-
1º passo: passa pelo otherwise pelos primeiros 4 numeros e para em 1
    fat 5 = 5 * fat 4
    fat 4 = 4 * fat 3
    fat 3 = 3 * fat 3
    fat 2 = 2 * fat 3
    fat 1 = 1
2º passo: enquanto fazia o passo 1, empilha os fatoriais que passaram
    fat 1
    fat 2
    fat 3
    fat 4
    fat 5
3º passo: retorna ao primeiro passo e resolve as funções (ao contrario)
    2 * 1 = 2
    3 * 2 = 6
    4 * 6 = 24
    5 * 24 = 120
-}

elimVogal :: String -> String
elimVogal [] = []
elimVogal (x:xs) -- <- um ou mais
    | elem x "AEIOUaeiou" = elimVogal xs 
    | otherwise = x : elimVogal xs
    
{-
    x = 'F' xs = 'ATEC'
    x = 'A' xs = 'TEC'
    x = 'T' xs = 'EC'
    x = 'E' xs = 'C'
    x = 'C' xs = []
    
    elimVogal "FATEC"   = 'F' : elimVogal "ATEC"
    elimVogal "ATEC"    = elimVolgal "TEC"
    elimVogal "TEC"     = 'T' : elimVogal "EC"
    elimVogal "EC"      = elimVogal "C"
    elimVogal "C"       = 'C' : elimVogal []
    elimVogal []        = []
    
    'C' : [] = "C"
    ..
    'T' : "C" = "TC"
    ..
    'F' : "TC" = "FTC"
-}