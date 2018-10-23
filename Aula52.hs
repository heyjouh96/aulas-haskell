module Aula52 where

import Data.Monoid

data Or = Or Bool deriving Show 

instance Monoid Or where 
    mempty = Or False
    mappend (Or x) (Or y) = Or (x || y)

-- mconcat :: Monoid a => [a] -> a
-- mconcat lista = foldl (<>) mempty lista

data Bolsa a = Bolsa a a deriving Show

-- Bolsa :: * -> *
-- Monoid :: * -> COnstraint
-- Bolsa a :: *
instance Monoid a => Monoid (Bolsa a) where 
    mempty = Bolsa mempty mempty
    mappend (Bolsa a b) (Bolsa c d) 
        = Bolsa (a <> c) (b <> d)

