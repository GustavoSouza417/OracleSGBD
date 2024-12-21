-- LISTA DE EXERCÍCIOS

-- 1. Exibir o nome, celular e e-mail de todos os alunos cadastrados.
SELECT
    alu_nome AS "Nome do Aluno", 
    alu_celular AS "Celular do Aluno", 
    alu_email AS "E-mail do Aluno"
FROM aluno;


-- 2. Exibir o código, nome e sigla de todos os cursos, em ordem de nome.
SELECT 
    cur_codigo AS "Código do Curso",
    cur_nome AS "Nome do Curso", 
    cur_sigla  AS "Sigla do Curso"
FROM cursos
ORDER BY cur_nome ASC;


-- 3. Exibir a quantidade de cursos da Instituição.
SELECT 
    COUNT(cur_codigo) AS "Quantidade de Cursos"
FROM cursos;


-- 4. Exibir o RA, nome e e-mail de todos os alunos do curso “Ciência de Dados”, mostrar em ordem crescente de RA.
SELECT 
    aluno.alu_ra AS "RA", 
    aluno.alu_nome AS "Nome", 
    aluno.alu_email AS "E-mail"
FROM aluno 
INNER JOIN cursos 
ON (aluno.cur_codigo = cursos.cur_codigo)
WHERE cursos.cur_nome = 'Ciência de Dados'
ORDER BY aluno.alu_ra;


-- 5. Exibir o nome e a série das disciplinas do curso de ‘Pedagogia’, que possuem carga horária de 40 h, ordenados por nome e série.
SELECT 
    disciplina.dis_nome AS "Disciplina", 
    disciplina.dis_serie AS "Série"
FROM disciplina 
INNER JOIN professor 
ON (disciplina.pro_codigo = professor.pro_codigo)
INNER JOIN cursos    
ON (professor.pro_codigo = cursos.cur_codigo)
WHERE cursos.cur_nome = 'Pedagogia'
AND disciplina.dis_horas = 40
ORDER BY 
    disciplina.dis_nome ASC,
    disciplina.dis_serie ASC;


-- 6. Exibir a quantidade de disciplinas por curso, ordenados por nome de disciplina.
SELECT 
    cursos.cur_nome AS "Curso",
    COUNT(disciplina.dis_nome) AS "Quantidade de Disciplinas"
FROM disciplina
JOIN professor
ON (professor.pro_codigo = disciplina.pro_codigo)
JOIN cursos
ON (cursos.pro_coord_codigo = professor.pro_codigo_coord)
GROUP BY cursos.cur_nome
ORDER BY cursos.cur_nome;


-- 7. Quais cursos não possuem alunos.
SELECT 
    cursos.cur_nome AS "Cursos"
FROM cursos 
LEFT JOIN aluno
ON (cursos.cur_codigo = aluno.cur_codigo)
WHERE aluno.alu_ra IS NULL;

SELECT 
    cursos.cur_nome AS "Cursos"
FROM aluno
RIGHT JOIN cursos
ON (cursos.cur_codigo = aluno.cur_codigo)
WHERE aluno.alu_ra IS NULL;


-- 8. Exibir o nome, série e carga horária de todas as disciplinas de 40h da 1ª série, em nome descendente de nome.
SELECT
    disciplina.dis_nome  AS "Nome",
    disciplina.dis_serie AS "Série",
    disciplina.dis_horas AS "Carga horária"
FROM disciplina
WHERE disciplina.dis_horas = 40
AND disciplina.dis_serie = 1
ORDER BY disciplina.dis_nome DESC;


-- 9. Exibir a quantidade de alunos por curso.
SELECT
    cursos.cur_nome AS "Curso",
    COUNT(aluno.alu_ra) AS "Quantidade de Alunos"
FROM cursos
INNER JOIN aluno
ON (cursos.cur_codigo = aluno.cur_codigo)
GROUP BY cursos.cur_nome;


-- 10. Quais são as disciplinas do curso de "Ciência da Computação", exibir a série e o nome da disciplina, ordenados por serie e disciplina.
SELECT
    disciplina.dis_nome  AS "Disciplina",
    disciplina.dis_serie AS "Série"
FROM disciplina
INNER JOIN professor
ON (disciplina.pro_codigo = professor.pro_codigo)
INNER JOIN cursos
ON (professor.pro_codigo_coord = cursos.pro_coord_codigo)
WHERE cursos.cur_nome = 'Ciência da Computação' 
ORDER BY
    disciplina.dis_serie ASC,
    disciplina.dis_nome ASC


-- 11. Exibir o nome de todos os alunos da disciplina "Estatística I".
SELECT
    aluno.alu_nome AS "Nome"
FROM aluno
INNER JOIN cursos
ON (aluno.cur_codigo = cursos.cur_codigo)
INNER JOIN professor
ON (cursos.pro_coord_codigo = professor.pro_codigo_coord)
INNER JOIN disciplina
ON (professor.pro_codigo = disciplina.pro_codigo)
WHERE disciplina.dis_nome = 'Estatística I';


-- 12. Qual foi a maior média final na disciplina "Programação para Dispositivos Móveis".
SELECT
    MAX(not_media) AS "Maior Nota"
FROM nota
INNER JOIN disciplina 
ON (disciplina.dis_codigo = nota.dis_codigo)
WHERE disciplina.dis_nome = 'Programação para Dispositivos Móveis';


-- 13. Quais disciplinas o aluno CPF 111.222.333-44 está cursando? Exibir o nome da disciplina, a notas (P1, P2 e Nota Final); ordenados por disciplina.
SELECT 
    disciplina.dis_nome AS "Disciplina",
    nota.not_p1 AS "P1",
    nota.not_p2 AS "P2",
    nota.not_media AS "Média"
FROM disciplina
INNER JOIN nota 
ON(disciplina.dis_codigo = nota.dis_codigo)
INNER JOIN aluno 
ON(nota.alu_ra = aluno.alu_ra)
WHERE aluno.alu_celular = '11999998877'
ORDER BY disciplina.dis_nome;


-- 14. Mostrar o nome do professor e o nome do seu coordenador.
SELECT
    professor1.pro_nome AS "Professor",
    professor2.pro_nome AS "Coordenador"
FROM professor professor1
INNER JOIN professor professor2
ON (professor2.pro_codigo = professor1.pro_codigo_coord);


-- 15. Exibir o nome de todos os alunos que estão cursando a disciplina "Estatística I" e "Matemática Computacional".
SELECT
    aluno.alu_nome AS "Nome"
FROM aluno
INNER JOIN cursos
ON (aluno.cur_codigo = cursos.cur_codigo)
INNER JOIN professor
ON (cursos.pro_coord_codigo = professor.pro_codigo_coord)
INNER JOIN disciplina
ON (professor.pro_codigo = disciplina.pro_codigo)
WHERE disciplina.dis_nome = 'Estatística I'
AND disciplina.dis_nome = 'Matemática Computacional';