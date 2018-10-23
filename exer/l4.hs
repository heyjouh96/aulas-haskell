module L4 where
import Data.Char

{- 4.1 -Faça uma função	que	retorne a média de um [Double]	,
usando foldl. -}

e41 :: [Double] -> Double
e41 x = foldl (+) 0 x / aux
    where aux = fromIntegral $ length x

{- OBS: utilizei um "where" nesta função porque não estava conseguindo
        fazer a conta toda em uma linha só, da ruim no ghc.
        "fromIntegral" converte Int para Double
-}
  
{- 4.5 Implemente	uma	função	que	receba	uma	lista	de	inteiros	e
retorne	o	dobro	de	todos,	eliminando	os	múltiplos de 4 -}

e45 :: [Int] -> [Int]
e45 x = filter (\x -> mod x 4 /= 0) . map (2*) $ x
    
{- 4.6 Faça	uma	função func	que	receba uma função f	de tipo (String	-> String),
e uma String s que retorna o reverso de s concatenado com aplicação
da função f	em s -}	

upp :: String -> String
upp x = [ toUpper xs | xs<-x ]

func :: (String -> String) -> String -> String
func f s = f "oi" ++ reverse s