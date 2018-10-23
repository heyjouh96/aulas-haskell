module Aula2 where
    
-- Algebraic Data Types

-- Dia eh um data constructor ou apenas construtor (Tipo)

-- Domingo, Segunda, ..., Sabado sao chamados de value constructor (valores)
-- Ex: data Int = ... | -1 | 0 | 1 | 2 | ...

-- tipo de enumeração
-- o deriving Show indica comportamento de print para o tipo Dia.
-- o deribing Eq permite fazer comparações entre os valores.
data Dia = Domingo | Segunda | Terca | Quarta | Quinta | Sexta | Sabado deriving (Show, Eq, Enum)

agenda :: Dia -> String
agenda Segunda = "Trabalho..."
agenda Quarta = "Futebol!"
agenda Quinta = "Haskell"
agenda Sexta = "Maldade"
agenda Sabado = "Maumau"
agenda _ = "Estudar Haskell"

{- EX 1: Faça a função toDia que receba um inteiro e retorno um Dia. (1 p/ Domingo, 2 p/ Segunda ... etc)
   EX 2: Crie um tipo Day contendo os dias em inglês como valor. Faça as funções traduzirING que traduz
         um dia para Day e trduzirPT que traduz um Day para Dia. -}

{- A função toDia é chamada de função parcial 
   A função não tem o _ no pattern match (não esta esgotada todas as possibilidades)
   Isso é corrigido usando o Maybe, fazendo com que a função se torne total -}
toDia :: Int -> Maybe Dia
toDia 1 = Just Domingo 
toDia 2 = Just Segunda
toDia 3 = Just Terca 
toDia 4 = Just Quarta 
toDia 5 = Just Quinta 
toDia 6 = Just Sexta 
toDia 7 = Just Sabado
toDia _ = Nothing 

-- outra solução:

toDia2 :: Int -> Either String Dia
toDia2 1 = Right Domingo 
toDia2 2 = Right Segunda
toDia2 3 = Right Terca 
toDia2 4 = Right Quarta 
toDia2 5 = Right Quinta 
toDia2 6 = Right Sexta 
toDia2 7 = Right Sabado
toDia2 _ = Left "Erro" 

data Day = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday deriving (Show, Eq, Enum)

traduzirING :: Dia -> Day
traduzirING Domingo = Sunday
traduzirING Segunda = Monday
traduzirING Terca = Tuesday
traduzirING Quarta = Wednesday
traduzirING Quinta = Thursday
traduzirING Sexta = Friday
traduzirING Sabado = Saturday

traduzirPT :: Day -> Dia
traduzirPT Sunday = Domingo
traduzirPT Monday = Segunda
traduzirPT Tuesday = Terca
traduzirPT Wednesday = Quarta
traduzirPT Thursday = Quinta
traduzirPT Friday = Sexta
traduzirPT Saturday = Sabado


safeHead :: String -> Maybe Char
safeHead "" = Nothing
safeHead ss = Just (head ss)