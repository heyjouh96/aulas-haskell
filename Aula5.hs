module Aula5 where

-- data Bolsa = Bolsa Int Int deriving Show
data Bolsa a = Bolsa a a 

-- Show :: * -> Constraint
-- Bolsa :: * -> *
-- Bolsa a :: *
instance Show a => Show (Bolsa a) where
    show (Bolsa x y) = "Primeira Coisa: " 
                    ++ show x
                    ++ " Segunda Coisa: "
                    ++ show y
                    
-- Bolsa 5 9

instance Eq a => Eq (Bolsa a) where 
    (Bolsa a b) == (Bolsa c d) = (a == c && b == d)
                              || (a == d && b == c)
-- Bolsa 5 9 == Bolsa 9 5   -> True

-- Bolsa é um tipo polimorfico, ou seja, podemos ter Bolsa Int, Bolsa String, etc...
-- O a eh chamando de Type Parameter.
-- Bolsa, na realidade, virou uma função entre tipos.
-- :t Bolsa 'w' 'q' -> Bolsa Char
-- :t Bolsa 1 2 -> Bolsa Int

-- :t --> pega um valor e mostra seu tipo
-- :kind --> pega um tipo e mostra seu tipo
-- :kind Bool       --> Bool :: * (tipo)
-- :kind Int        --> Int :: *
-- :kind Bolsa      --> Bolsa :: * -> * (Bolsa é uma função entre tipos, recebe um tipo e devolve outro)
-- :kind Bolsa Int  --> Bolsa Int :: *

-- :kind []         --> [] :: * -> *
-- :kind [Int]      --> [Int] :: *
-- :kind (,)        --> (,) :: * -> * -> *          (,) a b = (a,b)
-- :kind Either     --> Either :: * -> * -> *       Either a b = Left a | Right b

data Livro = Comedia | Autoajuda | Direito | Romance 

{- o Show é um typeclass. Todo typeclass possui funcções a serem implementadas de acordo
    com o tipo. Ou seja, teriamos que ter Show Int, Show Double, Show Livro, etc...
    Cada uma das instancias proveram implementações distintas para a função show.
    Logo, os typeclasses são um mecanismo para se obter SOBRECARGA (Polimorfismo AD-HOC)
    de funções. 
    
    :t show     --> show :: Show a => a -> String
    
    A função Show ACEITA QUALQUER TIPO QUE TENHA INSTANCIA (DERIVING) DE Show.
    Show a, NESSE CASO, eh uma restrição.
--}
    

instance Show Livro where 
    show Comedia = "Livro de Comédia"
    show Autoajuda = "Livro de coach"
    show Direito = "Mais um livro de direito..."
    show Romance = "Livro do lucas..."
    
instance Eq Livro where
    Comedia == Direito = True
    _ == _ = False



-- :kind Show   --> Show :: * -> Constraint (Show é um tipo)