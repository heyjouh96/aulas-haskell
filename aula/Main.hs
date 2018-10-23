module Main where

main''' :: IO ()
main''' = putStrLn "Hello World!"

-- compilar: ghc Main.hs -o Main
-- rodar: ./Main

main' :: IO ()
main' = do
    putStrLn "Digite um n: "
    x <- readLn
    putStrLn "Digite outro n: "
    y <- readLn
    soma <- return $ x + y
    putStrLn $ "O resultado eh: " ++ show soma
    
    
    
safeHead :: [a] -> Maybe a 
safeHead [] = Nothing 
safeHead (x:xs) = Just x

main :: IO ()
main = do 
    putStrLn "Digite uma palavra "
    pal <- getLine
    case safeHead pal of 
        Nothing -> putStrLn "Errou..."
        Just letra -> putStrLn $ "A letra eh " ++ show letra
        
-- Exercicios do 9.1 ao 9.4