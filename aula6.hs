module Aula6 where

a = 7

-- id . head $ "SANTOS"         -> 'S'
-- head . id $ "SANTOS"         -> 'S'

data Sozinho = Sozinho deriving Show

data Void

f :: Void -> Sozinho
f _ = Sozinho

g :: Sozinho -> Void
g _ = undefined

-- map (even . length) ["COBOL", "PHP", "CASA"]     -> [False, False, True]
-- map even . map length $ ["COBOL", "PHP", "CASA"] -> [False, False, True]
-- map id ["COBOL", "PHP", "CASA"]                  -> ["COBOL", "PHP", "CASA"]
-- head (Just "SANTOS")                             -> erro
-- fmap head (Just "Santos")                        -> Just 'S'

{-
    let a = getLine
    a
    COBOL
    :t a :: IO String
-}

{-
    data Maybe a = Nothing | Just a
    instance Functor Maybe where
        fmap f Nothing = Nothing
        fmap f (Just x) = Just (f x)
-}

data Bolsa a = Bolsa a a deriving Show

instance Functor Bolsa where
    fmap f (Bolsa x y) = Bolsa (f x) (f y)
    
-- fmap (2*) (Bolsa 17 13)              -> Bolsa 34 26


data Tree a = Null | Leaf a | Branch a (Tree a) (Tree a) deriving Show

instance Functor Tree where
    fmap f Null = Null
    fmap f (Leaf x) = Leaf (f x)
    fmap f (Branch x l r) = Branch (f x) (fmap f l) (fmap f r)
    
-- let arv = Branch "FATEC" (Branch "Ciro" (Leaf "SPC") Null) (Branch "Joao" Null (Leaf "B17"))

-- fmap head arv        -> Branch 'F' (Branch 'C' (Leaf 'S') Null) (Branch 'J' Null (Leaf 'B'))
-- fmap tail arv        -> Branch "ATEC" (Branch "iro" (Leaf "PC") Null) (Branch "oao" Null (Leaf "17"))