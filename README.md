# Crime em São Paulo
Este trabalho foi desenvolvido durante a disciplina de BD2.
 
# Sumário

### 1	COMPONENTES
- Rafael Afonso dos Anjos
- Marcos Antonio Carneiro de Paula

### 2	INTRODUÇÃO E MOTIVAÇAO

 Este projeto visa fazer um estudo de análise dos dados criminais da cidade de São Paulo no Brasil, a base de dados escolhida foi retirada do site: https://www.kaggle.com/inquisitivecrow/crime-data-in-brazil, foi escolhida essa base devido à vontade de trabalhar com algo mais próximo do meio em que os componentes do trabalho vivem<br>


### 3 Fast Imersion Canvas <br>

![Fast Imersion Canvas](/Canvas/Imagens/Fast%20Imersion%20Canvas.jpg)

### 4 Fast Modelling Canvas<br>

![Fast Modelling Canvas](/Canvas/Imagens/IMAGEMFMCV.png)

### 5 Mapa de ETL

![Carga do csv para o banco de dados](/ETL/Screenshot_2.png)

- [Transformação tabela dimensões](/ETL/dimensions_crime_sp.ktr)
 ![Transformação tabela dimensões](/ETL/dim_transform.png)

- [Transformação tabela fato](/ETL/fato_transform.ktr)
 ![Transformação tabela fato](/ETL/fato_transform.png)

### 6 Análise Exploratória dos dados (Incluindo gráficos)

[Análise](/Jupyter/AnaliseDescritivaDados.ipynb)
      
### 7	MODELO CONCEITUAL, LOGICO E FISICO - OLTP<br>
- Modelo Conceitual
 ![Alt Text](/ETL/Conceitual_1.png)

- Modelo Lógico
 ![Alt Text](/ETL/L%C3%B3gico_1.png)

- [Modelo Físico](/files/OLTP/modelo_fisico.sql)


### 8	MODELO CONCEITUAL, LOGICO E FISICO - OLAP<br>

- [Modelo Conceitual](/files/OLAP/modelo_conceitual.brM3)
 ![Modelo Conceitual](/files/imagens/OLAP_modelo_conceitual.png)

- [Modelo Lógico](/files/OLAP/modelo_logico.brM3)
 ![Modelo Lógico](/files/imagens/OLAP_modelo_logico.png)

- [Modelo Físico](/files/OLAP/modelo_fisico.sql)
 
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



