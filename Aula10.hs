module Aula10 where 

import Data.Monoid
-- :kind Monad      ->  Monad :: (* -> *) -> Constraint

-- Uma Monada em uma categoria C (Hask), eh
-- um funtor m acompanhado de duas "funções"

{-
    class Monoid m where
        mempty :: () -> m
        mappend :: m -> m -> m

    class Functor m => Monad m
        return :: a -> m a
        (>>=) :: m a -> (a -> m b) -> m b
        

    def "arrogante": Uma monada em uma categoria C é APENAS
    um monoide na categoria dos endofunctores de C -}

-- Just 4 >>= \x -> Just (x+1)      -> Just 5
-- o "bind" aloca o 4 (temporariamente) para fora do Just e assim consegue fazer a conta (x+1) e retorna Just 5

-- Just 4 >>= \x -> Just (x+1) >>= \y -> Just (x+y)     -> Just 9

func :: Int -> Maybe Int
func z = Just z >>= \x -> Just (x+1) >>= \y -> Just (x+y)

-- OU

func2 :: Int -> Maybe Int
func2 z = do
    x <- Just z
    y <- Just (x+1)
    return (x+y)

-- LADO DIREITO -> IMPURO (maioria das vezes usar return)
-- LADO ESQ -> PURO   


{-  instance Monad Maybe where
        return x = Just x
        Nothing >>= f = Nothing
        (Just x) >>= f = f x -}
        
data Jokenpo = Pedra | Papel | Tesoura | Nada deriving Show

instance Monoid Jokenpo where
    mempty = Nada
    mappend Pedra Papel = Papel
    mappend Papel Tesoura = Tesoura
    mappend Tesoura Pedra = Pedra