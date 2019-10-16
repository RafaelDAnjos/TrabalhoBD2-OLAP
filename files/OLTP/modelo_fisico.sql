CREATE TABLE Delegacia (
    id_delegacia serial PRIMARY KEY,
    nome_delegacia varchar(255),
    fk_Departamento_id_departamento varchar(255)
);

CREATE TABLE Departamento (
    nome_departamento varchar(255),
    id_departamento varchar(255) PRIMARY KEY,
    fk_Seccao_id_seccao serial
);

CREATE TABLE Seccao (
    nome_seccao varchar(255),
    id_seccao serial PRIMARY KEY
);

CREATE TABLE Cidade (
    nome varchar(255),
    id_cidade serial PRIMARY KEY,
    fk_Local_id_local serial
);

CREATE TABLE Logradouro_SubLocal (
    nome varchar(255),
    numero integer,
    id_logradouro serial,
    descricao_sublocal varchar(255),
    id_subtipolocal serial,
    fk_Local_id_local serial,
    PRIMARY KEY (id_logradouro, id_subtipolocal)
);

CREATE TABLE Departamento_Circ (
    nome_separtamento_circ varchar(255),
    id_departamento serial PRIMARY KEY,
    fk_Seccao_Circ_id_seccao serial
);

CREATE TABLE Seccao_Circ (
    nome_seccao_circ varchar(255),
    id_seccao serial PRIMARY KEY
);

CREATE TABLE municipio_circ (
    nome_municipio_circ varchar(255),
    id_municipio serial PRIMARY KEY,
    fk_Cidade_id_cidade serial
);

CREATE TABLE Status_BO_Flag_vitima_fatal (
    flag BOOLEAN,
    id_status serial,
    hora_ocorrencia_bo varchar(255),
    data_ocorrencia_bo varchar(255),
    num_bo serial,
    descricao varchar(255),
    id_descricao serial,
    fk_Delegacia_Circ_id_delegacia serial,
    PRIMARY KEY (id_status, num_bo, id_descricao)
);

CREATE TABLE Rubrica (
    descricao_rubrica varchar(255),
    id_rubrica serial PRIMARY KEY
);

CREATE TABLE Conduta (
    descricao_conduta varchar(255),
    id_conduta serial PRIMARY KEY
);

CREATE TABLE Desdobramento (
    descricao_desdobramento varchar(255),
    id_desdobramento serial PRIMARY KEY
);

CREATE TABLE Local (
    descricao_local varchar(255),
    Latitude varchar(255),
    Longitude varchar(255),
    id_local serial PRIMARY KEY
);

CREATE TABLE Pessoa (
    idade integer,
    sexo varchar(255),
    cor varchar(255),
    descr_tipo_pessoa varchar(255),
    id_pessoa serial PRIMARY KEY
);

CREATE TABLE Delegacia_Circ (
    nome_delegacia_circ varchar(255),
    id_delegacia serial PRIMARY KEY,
    fk_Delegacia_id_delegacia serial,
    fk_Departamento_Circ_id_departamento serial
);

CREATE TABLE Relacionamento_8 (
    fk_Delegacia_Circ_id_delegacia serial,
    fk_municipio_circ_id_municipio serial
);

CREATE TABLE desdobra (
    fk_Desdobramento_id_desdobramento serial,
    fk_Status_BO_Flag_vitima_fatal_id_status serial,
    fk_Status_BO_Flag_vitima_fatal_num_bo serial,
    fk_Status_BO_Flag_vitima_fatal_id_descricao serial
);

CREATE TABLE rubrica (
    fk_Rubrica_id_rubrica serial,
    fk_Status_BO_Flag_vitima_fatal_id_status serial,
    fk_Status_BO_Flag_vitima_fatal_num_bo serial,
    fk_Status_BO_Flag_vitima_fatal_id_descricao serial
);

CREATE TABLE Regulariza (
    fk_Conduta_id_conduta serial,
    fk_Status_BO_Flag_vitima_fatal_id_status serial,
    fk_Status_BO_Flag_vitima_fatal_num_bo serial,
    fk_Status_BO_Flag_vitima_fatal_id_descricao serial
);

CREATE TABLE Registra (
    fk_Pessoa_id_pessoa serial,
    fk_Status_BO_Flag_vitima_fatal_id_status serial,
    fk_Status_BO_Flag_vitima_fatal_num_bo serial,
    fk_Status_BO_Flag_vitima_fatal_id_descricao serial
);
 
ALTER TABLE Delegacia ADD CONSTRAINT FK_Delegacia_2
    FOREIGN KEY (fk_Departamento_id_departamento)
    REFERENCES Departamento (id_departamento)
    ON DELETE RESTRICT;
 
ALTER TABLE Departamento ADD CONSTRAINT FK_Departamento_2
    FOREIGN KEY (fk_Seccao_id_seccao)
    REFERENCES Seccao (id_seccao)
    ON DELETE RESTRICT;
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_2
    FOREIGN KEY (fk_Local_id_local)
    REFERENCES Local (id_local)
    ON DELETE RESTRICT;
 
ALTER TABLE Logradouro_SubLocal ADD CONSTRAINT FK_Logradouro_SubLocal_2
    FOREIGN KEY (fk_Local_id_local)
    REFERENCES Local (id_local)
    ON DELETE RESTRICT;
 
ALTER TABLE Departamento_Circ ADD CONSTRAINT FK_Departamento_Circ_2
    FOREIGN KEY (fk_Seccao_Circ_id_seccao)
    REFERENCES Seccao_Circ (id_seccao)
    ON DELETE RESTRICT;
 
ALTER TABLE municipio_circ ADD CONSTRAINT FK_municipio_circ_2
    FOREIGN KEY (fk_Cidade_id_cidade)
    REFERENCES Cidade (id_cidade)
    ON DELETE RESTRICT;
 
ALTER TABLE Status_BO_Flag_vitima_fatal ADD CONSTRAINT FK_Status_BO_Flag_vitima_fatal_2
    FOREIGN KEY (fk_Delegacia_Circ_id_delegacia)
    REFERENCES Delegacia_Circ (id_delegacia)
    ON DELETE CASCADE;
 
ALTER TABLE Delegacia_Circ ADD CONSTRAINT FK_Delegacia_Circ_2
    FOREIGN KEY (fk_Delegacia_id_delegacia)
    REFERENCES Delegacia (id_delegacia)
    ON DELETE RESTRICT;
 
ALTER TABLE Delegacia_Circ ADD CONSTRAINT FK_Delegacia_Circ_3
    FOREIGN KEY (fk_Departamento_Circ_id_departamento)
    REFERENCES Departamento_Circ (id_departamento)
    ON DELETE RESTRICT;
 
ALTER TABLE Relacionamento_8 ADD CONSTRAINT FK_Relacionamento_8_1
    FOREIGN KEY (fk_Delegacia_Circ_id_delegacia)
    REFERENCES Delegacia_Circ (id_delegacia)
    ON DELETE RESTRICT;
 
ALTER TABLE Relacionamento_8 ADD CONSTRAINT FK_Relacionamento_8_2
    FOREIGN KEY (fk_municipio_circ_id_municipio)
    REFERENCES municipio_circ (id_municipio)
    ON DELETE RESTRICT;
 
ALTER TABLE desdobra ADD CONSTRAINT FK_desdobra_1
    FOREIGN KEY (fk_Desdobramento_id_desdobramento)
    REFERENCES Desdobramento (id_desdobramento)
    ON DELETE SET NULL;
 
ALTER TABLE desdobra ADD CONSTRAINT FK_desdobra_2
    FOREIGN KEY (fk_Status_BO_Flag_vitima_fatal_id_status, fk_Status_BO_Flag_vitima_fatal_num_bo, fk_Status_BO_Flag_vitima_fatal_id_descricao)
    REFERENCES Status_BO_Flag_vitima_fatal (id_status, num_bo, id_descricao)
    ON DELETE SET NULL;
 
ALTER TABLE rubrica ADD CONSTRAINT FK_rubrica_1
    FOREIGN KEY (fk_Rubrica_id_rubrica)
    REFERENCES Rubrica (id_rubrica)
    ON DELETE SET NULL;
 
ALTER TABLE rubrica ADD CONSTRAINT FK_rubrica_2
    FOREIGN KEY (fk_Status_BO_Flag_vitima_fatal_id_status, fk_Status_BO_Flag_vitima_fatal_num_bo, fk_Status_BO_Flag_vitima_fatal_id_descricao)
    REFERENCES Status_BO_Flag_vitima_fatal (id_status, num_bo, id_descricao)
    ON DELETE SET NULL;
 
ALTER TABLE Regulariza ADD CONSTRAINT FK_Regulariza_1
    FOREIGN KEY (fk_Conduta_id_conduta)
    REFERENCES Conduta (id_conduta)
    ON DELETE SET NULL;
 
ALTER TABLE Regulariza ADD CONSTRAINT FK_Regulariza_2
    FOREIGN KEY (fk_Status_BO_Flag_vitima_fatal_id_status, fk_Status_BO_Flag_vitima_fatal_num_bo, fk_Status_BO_Flag_vitima_fatal_id_descricao)
    REFERENCES Status_BO_Flag_vitima_fatal (id_status, num_bo, id_descricao)
    ON DELETE SET NULL;
 
ALTER TABLE Registra ADD CONSTRAINT FK_Registra_1
    FOREIGN KEY (fk_Pessoa_id_pessoa)
    REFERENCES Pessoa (id_pessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE Registra ADD CONSTRAINT FK_Registra_2
    FOREIGN KEY (fk_Status_BO_Flag_vitima_fatal_id_status, fk_Status_BO_Flag_vitima_fatal_num_bo, fk_Status_BO_Flag_vitima_fatal_id_descricao)
    REFERENCES Status_BO_Flag_vitima_fatal (id_status, num_bo, id_descricao)
    ON DELETE RESTRICT;