module Aula51 where

-- Classes precisam ter no minimo
-- um tipo parametrico.
class SimNao a where 
    simnao :: a -> Bool

instance SimNao Int where 
    simnao x = even x

instance SimNao Char where 
    simnao ' ' = False
    simnao _ = True

instance SimNao Bool where
    simnao = id

instance Num Bool where 
    (+) = (||)
    (*) = (&&)
    True - True = False
    False - False = False
    _ - _ = True 
    signum True = 1
    signum False = 0
    abs = id
    fromInteger 1 = True
    fromInteger _ = False

{-
    MONÓIDE
    Def: Um tipo de m :: * junto com uma operação binária
    mappend -> (<>) :: m -> m -> m e um elemento e :: m
    é dito uma monóide se satisfizer:
    e = mempty
    
    a) (Elemento Neutro) Vx :: m
        x <> e = x
        e <> x = x
    
    b) (Associatividade) Va,b,c :: m
        (a <> b) <> c = a <> (b <> c)
-}