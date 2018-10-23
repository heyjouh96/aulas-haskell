module L3 where

-- 3.16
data Numero = Ok Double | Error String deriving (Eq, Show)

dividir :: Numero -> Numero -> Numero
dividir (Ok x) (Ok 0.0) = Error "Não divida por zero"
dividir (Ok x) (Ok y) = Ok (x/y)

{-
	3.17 - Faça	o	tipo		Cripto		que	possua	dois	values	constructors
	Mensagem		 e	 	Cifrado	,	 ambos	 com	 um	 campo	 	String		 e	 um
    value	 constructor	 	 Erro	 .	 Faça	 as	 funções	 	 encriptar	 	 e
	decriptar	,	seguindo	cada	exemplo	a	seguir.
-}
data Cripto = Mensagem String | Cifrado String | Erro deriving (Show)

encriptar :: Cripto -> Cripto
encriptar (Mensagem x) = Cifrado [ succ xs | xs <- x ] 
encriptar (Cifrado x) = Erro

decriptar :: Cripto -> Cripto
decriptar (Cifrado x) = Cifrado [ pred xs | xs <- x ] 
decriptar (Mensagem x) = Erro

-- 3.18 
encriptarTodos :: [Cripto] -> [Cripto]
encriptarTodos x = [ encriptar xs | xs <- x]

-- 3.19 Conversão de moedas
data Cambio = Euro | Real | Dollar deriving (Eq, Show)
data Moeda = Moeda {
    val :: Double,
    cur :: Cambio
} deriving (Eq, Show)

converte :: Moeda -> Cambio -> Moeda
converte (Moeda x Euro) c
    | c == Euro = (Moeda x Euro)
    | c == Real = (Moeda (x*4.76) Real)
    | c == Dollar = (Moeda (x*2) Dollar)
converte (Moeda x Real) c
    | c == Euro = (Moeda (x/4.76) Euro)
    | c == Real = (Moeda x Real)
    | c == Dollar = (Moeda (x/4.08) Dollar)
converte (Moeda x Dollar) c
    | c == Euro = (Moeda (x*0.86) Euro)
    | c == Real = (Moeda (x*4.08) Real)
    | c == Dollar = (Moeda x Dollar)
    
