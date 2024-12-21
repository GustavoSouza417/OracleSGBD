-- deleta as tabelas
DROP TABLE aluno;
DROP TABLE cursos;
DROP TABLE professor;
DROP TABLE disciplina;
DROP TABLE nota;



CREATE TABLE professor
(
    pro_codigo INTEGER NOT NULL,
    pro_nome VARCHAR(60) NOT NULL,
    pro_celular VARCHAR(20) NOT NULL,
    pro_email VARCHAR(60) NOT NULL,
    pro_datanasc VARCHAR(10) NOT NULL, 
    pro_codigo_coord INTEGER NOT NULL,

    -- chave primária
    PRIMARY KEY(pro_codigo),
    
    -- chave estrangeira
    CONSTRAINT fk_codigo_coord FOREIGN KEY (pro_codigo) REFERENCES professor (pro_codigo)
);

CREATE TABLE cursos
(
    cur_codigo INTEGER NOT NULL,
    cur_nome VARCHAR(60) NOT NULL,
    cur_duracao VARCHAR(20) NOT NULL,
    cur_sigla VARCHAR(7) NOT NULL,
    pro_coord_codigo INTEGER NOT NULL,

    -- chave primária
    PRIMARY KEY(cur_codigo),
    
    -- chave estrangeira
    CONSTRAINT fk_pro_coord FOREIGN KEY (pro_coord_codigo) REFERENCES professor (pro_codigo)
);

CREATE TABLE aluno
(
    alu_ra VARCHAR(15) NOT NULL,
    alu_nome VARCHAR(60) NOT NULL,
    alu_celular VARCHAR(20) NOT NULL,
    alu_email VARCHAR(60) NOT NULL, 
    alu_idade INTEGER NOT NULL,
    alu_mensalidade DECIMAL(8,2) NOT NULL,
    cur_codigo INTEGER NOT NULL,
    
    -- chave primária
    PRIMARY KEY(alu_ra),
    
    -- chave estrangeira
    CONSTRAINT fk_cur_codigo FOREIGN KEY (cur_codigo) REFERENCES cursos (cur_codigo)
);

CREATE TABLE disciplina
(
    dis_codigo INTEGER NOT NULL,
    dis_nome VARCHAR(60) NOT NULL,
    dis_horas INTEGER NOT NULL,
    pro_codigo INTEGER NOT NULL,
    
    -- chave primária
    PRIMARY KEY(dis_codigo),
    
    -- chave estrangeira
    CONSTRAINT fk_pro_codigo2 FOREIGN KEY (pro_codigo) REFERENCES professor (pro_codigo)
);

CREATE TABLE nota
(
    not_numero INTEGER NOT NULL,
    not_p1 DECIMAL (5,2) NOT NULL,
    not_p2 DECIMAL (5,2) NOT NULL,
    dis_codigo INTEGER NOT NULL,
    alu_ra VARCHAR(15) NOT NULL,
    
    -- chave primária
    PRIMARY KEY(not_numero),
    
    -- chave estrangeira  
    CONSTRAINT fk_dis_codigo FOREIGN KEY (dis_codigo) REFERENCES disciplina (dis_codigo),
    CONSTRAINT fk_alu_ra33 FOREIGN KEY (alu_ra) REFERENCES aluno (alu_ra)
);