module L5 where
    
import Data.Monoid
{-
5.1 - Crie o tipo TipoProduto que possui os values
constructors Escritorio, Informatica, Livro, Filme 
e Total. 

O tipo Produto possui um value constructor
- de mesmo nome - e os campos valor (Double), 
tp (TipoProduto) e um	value constructor Nada,
que	representa a ausência de um Produto.

Deseja-se calcular o valor total de	uma	compra,	
de modo	a não ter nenhuma conversão para inteiro
e de forma combinável. 

Crie uma instância de monoide
para Produto, de modo que o retorno sempre tenha Total 
no campo tp e a soma dos dois produtos em valor.

Explique como seria	o exercício	sem o uso de monoides.

Qual(is) seria(m) a(s) diferença(s)? 
-}
data TipoProduto =  Escritorio | Informatica | Livro | Filme | Total deriving Show

data Produto = Produto {valor::Double, tp::TipoProduto} | Nada deriving Show

instance Monoid Produto where
    mempty = Nada
    mappend (Produto valorA tpA) (Produto valorB tpB) = Produto (valorA + valorB) Total
    mappend x Nada = x
    mappend Nada x = x
    
{- 
(Produto 10.0 Livro) <> (Produto 10.0 Filme) 
(Produto 10.0 Livro) <> Nada
Nada <> (Produto 10.0 Livro)

foldl (+) 0 [valor (Produto 10.0 Livro), valor (Produto 20.0 Livro)]

5.3 - A	função	min no Haskell retorna o menor entre dois
números, por exemplo, min 4	5 =	4.
Crie um	tipo Min com um	campo inteiro, que seja
instância de Ord, Eq e Show	(deriving).
Crie uma instância de Monoid para Min 
(maxBound representa o maior inteiro existente no Haskell).
Quanto	vale a expressão Min (-32) <> Min (-34) <> Min (-33)?
Explique sua escolha para o	mempty.
-}
data Min = Min Int deriving (Ord, Eq, Show)
instance Monoid Min where
    mempty = Min maxBound
    mappend (Min x) (Min y) = Min (min x y)
{-
5.4 - Crie uma função minAll que recebe	 um	 [Min] e
retorna	um	Min	contendo o menor valor.

teste = minAll [Min 1, Min 2]
-}
minAll:: [Min] -> Min
minAll xs = mconcat xs

{-
5.6 - A função max no Haskell retorna o	maior entre	 dois
números, por exemplo: max 4	5 =	5.
> Crie um tipo Max com um campo inteiro que seja instância de Ord,
Eq e Show (deriving).
> Crie uma instância de	Monoid para Max (minBound representa o menor
inteiro	existente no Haskell).
> Quanto vale a	expressão Max 10 <>	Max	13 <> Max 5	?
> Explique sua escolha para	o mempty.
> Crie uma função maxAll que recebe um [Max] e retorna um
Max contendo o maior valor.
-}
data Max = Max Int deriving (Ord, Eq, Show)
instance Monoid Max where
    mempty = Max minBound
    mappend (Max x) (Max y) = Max (max x y)
    
maxAll:: [Max] -> Max
maxAll xs = mconcat xs

-- maxAll [Max 3, Max 5]
-- Sum 1 <> Sum 2   =   mconcat [Sum 1, Sum 2]
                    

