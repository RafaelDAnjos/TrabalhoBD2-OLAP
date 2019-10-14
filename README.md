# Crime em São Paulo
Este trabalho foi desenvolvido durante a disciplina de BD2.
 
# Sumário

### 1	COMPONENTES<br>
Rafael Afonso dos Anjos<br>


### 2	INTRODUÇÃO E MOTIVAÇAO<br>

 Este projeto visa fazer um estudo de análise dos dados criminais da cidade de São Paulo no Brasil, a base de dados escolhida foi retirada do site: https://www.kaggle.com/inquisitivecrow/crime-data-in-brazil, foi escolhida essa base devido à vontade de trabalhar com algo mais próximo do meio em que os componentes do trabalho vivem<br>


### 3 Fast Imersion Canvas <br>

![Alt Text](https://github.com/RafaelDAnjos/TrabalhoBD2-OLAP/raw/master/Canvas/Imagens/Fast%20Imersion%20Canvas.jpg)

<br>



### 4 Fast Modelling Canvas<br>


![Alt Text](https://github.com/RafaelDAnjos/TrabalhoBD2-OLAP/raw/master/Canvas/Imagens/IMAGEMFMCV.jpg)

<br>

<br>

### 5 Mapa de ETL
<br>


![Alt Text](https://github.com/RafaelDAnjos/TrabalhoBD2-OLAP/blob/master/ETL/Screenshot_2.png)
<br>
<br>

### 6 Análise Exploratória dos dados (Incluindo gráficos)
<br>
https://github.com/RafaelDAnjos/TrabalhoBD2-OLAP/blob/master/Jupyter/AnaliseDescritivaDados.ipynb
<br>
<br>
      
### 7	MODELO CONCEITUAL, LOGICO E FISICO - OLTP<br>
Modelo Conceitual
 ![Alt Text](https://github.com/RafaelDAnjos/TrabalhoBD2-OLAP/blob/master/ETL/Conceitual_1.png)
Modelo Lógico
 ![Alt Text](https://github.com/RafaelDAnjos/TrabalhoBD2-OLAP/blob/master/ETL/L%C3%B3gico_1.png)
Modelo Físico

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
 
 
<br>
 
<br>
<br>


### 8	MODELO CONCEITUAL, LOGICO E FISICO - OLAP<br>

<br>
Inclusão dos Modelos OLAP
TABELAS DIMENSÃO, FATO, MEDIDAS E MÉTRICAS
<br>
<br>
 
### 9 ANÁLISE DE METADADOS, LOGS, ESTATISTICAS, SIZING E INDEXAÇÃO
<br>
Inclusão de análise
<br>
<br>

#### 9.1	APLICAÇAO DE ÍNDICES E TESTES DE PERFORMANCE<br>
    a) Lista de índices, tipos de índices com explicação de porque foram implementados nas consultas 
    b) Performance esperada VS Resultados obtidos
    c) Tabela de resultados comparando velocidades antes e depois da aplicação dos índices (constando velocidade esperada com planejamento, sem indice e com índice Vs velocidade de execucao real com índice e sem índice).
    d) Escolher as consultas mais complexas para serem analisadas (consultas com menos de 2 joins não serão aceitas)
    e) As imagens do Explain devem ser inclusas no trabalho, bem como explicações sobre os resultados obtidos.
    f) Inclusão de tabela mostrando as 10 execuções, excluindo-se o maior e menor tempos para cada consulta e 
    obtendo-se a media dos outros valores como resultado médio final.
<br>


### 10 MINERAÇÃO DE DADOS

#### 10.1 Incluir no trabalho os seguintes tópicos: 
* Explicação/Fundamentação teórica sobre o método, objetivos e restrições! (formato doc/odt ou PDF)
* Onde/quando aplicar 
> ##### Estudar e explicar artigo que aplique o método de mineração de dados/machine learning escolhido
* exemplo de uso/aplicação 
> ##### a) Implementar algoritmo de básico de exemplo obtido na literatura (enviar código executável junto do trabalho com detalhamento de explicação para uso passo a passo)

Referência: http://scikit-learn.org/stable/index.html
<br>
Referências adicionais:
Scikit learning Map : http://scikit-learn.org/stable/tutorial/machine_learning_map/index.html
Machine learning in Python with scikit-learn: https://www.youtube.com/playlist?list=PL5-da3qGB5ICeMbQuqbbCOQWcS6OYBr5A

### 11 ARTIGO

### 12 CUBOS E DASHBOARDS

### 13 APRESENTAÇÃO FINAL
#### 13.1	Backup do Banco de Dados<br>
        Detalhamento do backup.
        a) Tempo
        b) Tamanho
        c) Teste de restauração (backup)
        d) Tempo para restauração
        e) Teste de restauração (script sql)
        f) Tempo para restauração (script sql)
<br>



### 14  FORMATACAO NO GIT: https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. Caso existam arquivos com conteúdos sigilosos, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário deste GIT, para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://sis4.com/brModelo/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")



