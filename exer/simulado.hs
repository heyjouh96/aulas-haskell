module Simulado where

import Data.Monoid
import Data.Char

{-
1. Considere o tipo Login contendo os campos email, senha e permissao. Os campos email e senha são Strings, ao
passo que permissao é um tipo Permissao que possui os valores Admin, Regular e Convidado. Crie os dois tipos
com instâncias necessárias para a solução deste exercício e implemente funções, que recebem um [Login], e que
retornem
• a maior senha de um Admin;
• todas as senhas que n~ao possuem caract´eres n´umericos de um login Regular;
• a soma dos tamanhos de todas as senhas;
• todos os logins que possuem @ no campo email;
• todos os Regulares e Admins;
• a quantidade de Admins da lista.
-}
data Permissao = Admin | Regular | Convidado deriving (Eq, Show)
data Login = Login { email :: String, senha :: String, permissao :: Permissao } deriving (Eq, Show)

-- [Login "jnh@email.com" "123" Admin, Login "jose@email.com" "1233" Admin, Login "maria@email.com" "123" Regular] , Login "roberto@email.com" "123" Convidado

maiorAdmin :: [Login] -> String
maiorAdmin xs = foldl (\a b -> if length (senha b) > length a then senha b else a) [] 
    . filter (\x -> permissao x == Admin) $ xs

{-
    [Login "jnh@email.com" "123" Admin, Login "jose@email.com" "1233" Admin, Login "joseemail.com" "1" Admin]
    1.  b -> Login "jnh@email.com" "123" Admin
        a -> []
        length (senha b) > length a ? true 
        return senha b
    
    2.  b -> Login "jose@email.com" "1233" Admin
        a -> "123"
        length (senha b) > length a ? true 
        return senha b
        
    3.  b -> Login "jose@email.com" "1" Admin
        a -> "1233"
        length (senha b) > length a ? false
        return a
-}

-- naoNumerico :: [Login] -> [Login]
-- naoNumerico x = filter (\x -> senha x) 
--                 . filter (\x -> permissao x == Regular) $ x
                
-- filter (\y -> y `notElem` ['0' .. '9']) ["a1","aa"]

somaSenha :: [Login] -> Sum Int
-- somaSenha x = foldl (+) 0 . map (\x -> length (senha x)) $ x     <- esse ta certo, só fazendo um teste...
somaSenha x = mconcat . map (\x -> Sum $ length (senha x)) $ x

comArroba :: [Login] -> [Login]
comArroba x = filter (\x -> '@' `elem` email x) x

regAdmin :: [Login] -> [Login]
regAdmin x = filter (\x -> permissao x == Admin || permissao x == Regular) x

qtdAdmin :: [Login] -> Int
qtdAdmin x = length . filter (\x -> permissao x == Admin) $ x


{-
2.
• Crie o tipo Nand que contenha o tipo Bool. Sabe-se que a opera¸c~ao nand ´e caracterizada por ’Nega¸c~ao da
tabela and". Crie uma inst^ancia de Monoid para este tipo.
• Crie um Mon´oide. N~ao pode ser um exemplo dado em aula ou que esteja no livro. Explique brevemente a
validade dos axiomas
-}

data Nand = Nand Bool deriving Show

instance Monoid Nand where
    mempty = Nand False
    mappend (Nand True) (Nand True) = Nand True
    mappend (Nand _) (Nand _) = Nand False

data Multi = Multi Int deriving (Show, Eq)

instance Monoid Multi where
    mempty =  Multi 1
    mappend (Multi a) (Multi b) = Multi (a * b)

{-
3. Considere o tipo data Tripla a = Tripla Int a a a
• Qual o kind de Tripla String?     -> Tripla String :: *
• Crie uma inst^ancia de Functor para Tripla.
• Qual o tipo da express~ao Tripla 5 ’’False’’ ’’False’’ ’’True’’?  -> :: Tripla [Char]
• Qual o tipo da express~ao Tripla 7?   -> :: a -> a -> a -> Tripla a
• Crie uma inst^ancia de Show que mostre na tela sua tripla em formato de tuplas. Por exemplo, Tripla 1 2 3 4
dever´a ser mostrado (2,3,4).
• Qual o kind de Tripla?    -> Tripla :: * -> *
-}

data Tripla a = Tripla Int a a a 

-- instance Functor Tripla where
--     fmap f (Tripla a b c d) = Tripla (f a) (f b) (f c) (f d)

instance Show a => Show (Tripla a) where
    show (Tripla a b c d) = "(" 
                            ++ show b ++","
                            ++ show c ++","
                            ++ show d ++")"
                            
-- instance Show a => Show (Bolsa a) where
--     show (Bolsa x y) = "Primeira Coisa: " 
--                     ++ show x
--                     ++ " Segunda Coisa: "
--                     ++ show y

{-
4. Considere as fun¸c~oes
g1 :: Double -> Double -> Double
g1 x y = x - y
g2 x = mconcat [x,mempty,x]
g3 :: ([a],[a]) -> [a]
g3 = id . tail . fst . id
e responda
• Quais fun¸c~oes s~ao parciais? Explique o motivo e, se houver, deixe-a total.
• Quais fun¸c~oes s~ao polim´orficas? Explique.
• Qual o tipo da fun¸c~ao g2?
• E poss´ıvel reescrever ´ g1 como fun¸c~ao polim´orfica com restri¸c~ao Monoid? Se sim, reescreva-a.
• O que faz a fun¸c~ao g3?
-}