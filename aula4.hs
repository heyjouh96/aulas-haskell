module Aula4 where
    
{- 
    LAMBDAS: funções anonimas. São vistas como fossem literais
    Ex: (\x -> 3*x) 5   = 1
    Ex: (\x y z -> x + y + z) 2 3 5     = 10
    
    CURRYING:  é o ato de podermos chamar uma função com menos argumentos
    que o esperado. Ex: Se uma função possui 3 parametros podemos usar-la
    com apenas 1, posteriormente, você poderia passar outros 2.
    
    Ex: 
        let a = somar 4 5
        a 1                 
        = 10
    
    EX:
        let g = (\x z y -> x*y*z) 2 3
        g 2
        = 12
-}

somar :: Int -> Int -> Int -> Int
somar x y z = x + y + z

data Curso = SI | GE | GP | LOG | ADS deriving Show
data Aluno = Aluno String Int Curso deriving Show

{- 
    :t (Aluno "Jojo" 24)    = Curso -> Aluno
    :t (Aluno "Jojo")       = Int -> Curso -> Aluno
-}


{-  HIGH ORDER FUNCTION (CALLBACK):  
    é uma função que pode receber uma função como parametro
    ou retorna funções (ou os dois)
-}

foo :: (Int -> Int) -> Int
foo f = 1 + f 5

dobro :: Int -> Int
dobro x = 2*x

triplo :: Int -> Int
triplo x = 3*x 

-- foo dobro    = 11
-- foo triplo   = 16

bar :: (Int -> Int -> Int) -> Int
bar f = 1 + f 2 4

-- bar (+)      = 7
-- bar (-)      = -1
-- bar (\x y -> 3*x+2*y)    = 15

mult :: Int -> (Int -> Int)
mult x = \y -> x*y

-- let a = mult 2 (guarda o 2)
-- a 7  = 14

{- FUNÇÃO POLIMORFICA: função que ira funcionar para 
   quaquer tipo, sem saber qual é.
   
    ($) :: (a -> b) -> a -> b
    ($) f x = f x

    EX: 
        dobro 7 + 6             = 20
        dobro $ 7 + 6           = 26    -> dobro (7 + 6)
        dobro $ dobro $ 7 + 6   = 52    -> dobro(dobro(7+6))
        
        
    (.) :: (b -> c) -> (a -> b) -> a -> c
-}

tamanho :: String -> Int
tamanho x = length x

ehPar :: Int -> Bool
ehPar x = even x

-- (ehPar . tamanho) "FATEC"    = false
-- ehPar . tamanho $ "ETEC"     = true
-- ehPar(tamanho("ETEC"))       = true

-- MAP
-- map tamanho ["FATEC","ETEC"]     = [5,4]
-- map (\x -> 2*x) [1,2,3]          = [2,4,6]
-- map (2*) [2,4,5]                 = [4,8,10]
-- map ehPar [1,2,3]                = [False, True, False]

-- FILTER
-- filter ehPar [1,2,3,4,5,6]       = [0,2,4,6]
-- filter (\x -> x > 4) [1,4,5,6]   = [5,6]
-- filter (<2) [-3..4]              = [-3,-2,-1,0,1]

-- FOLDL: sempre retorna um elemento
-- foldl (+) 0 [1,2,3,4]            = 10
--      foldl (+) 1 [2,3,4]
--      foldl (+) 3 [3,4]
--      foldl (+) 6 [4]
--      foldl (+) 10 []             = 10

contaPar :: Int -> Int -> Int
contaPar cont nLista
    | even nLista = cont+1
    | otherwise = cont

-- foldl contaPar 0 [1,2,3,4]       = 2
-- é o mesmo de:
-- length $ filter even [1,2,4,5]   = 2