module Aula21 where
    
data Curso = SI | ADS | LOG | GE | GP deriving Show -- tipo aditivo

data Disciplina = Disciplina String Int Curso deriving Show -- tipo multiplicativo

data Aluno = Aluno String [Disciplina] deriving Show

-- o : chama-se CONS. Ex: 1 : [2,3] -> [1,2,3]

matricular :: Disciplina -> Aluno -> Aluno
matricular nova (Aluno nome disciplinas) = Aluno nome (nova : disciplinas)

-- let ds = [Disciplina "PHP" 80 SI, Disciplina "JAVA" 80 SI]
-- let aluno1 = Aluno "Marco" ds
-- matricular (Disciplina "Estatistica" 80 ADS) aluno1

-- CURRYING
data Pessoa = Fisica String Int | Juridica String

teste :: Pessoa -> (String, String)
teste (Fisica x y) = ("Nome: " ++ x, "Idade: " ++ show y)
teste (Juridica x) = ("Nome: " ++ x, "Não há idade")