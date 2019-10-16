CREATE TABLE dim_local (
    id_dim_LOCAL INTEGER PRIMARY KEY UNIQUE,
    logradouro VARCHAR,
    cidade VARCHAR,
    municipio VARCHAR,
    latitude DOUBLE,
    longitude DOUBLE,
    descr_tipolocal VARCHAR,
    descr_subtipolocal VARCHAR
);

CREATE TABLE dim_pessoa (
    id_dim_pessoa INTEGER PRIMARY KEY UNIQUE,
    flag_vitima_fatal VARCHAR,
    descr_tipo_pessoa VARCHAR,
    cor_cutis VARCHAR,
    sexo CHARACTER,
);

CREATE TABLE dim_rubrica (
    id_dim_rubrica INTEGER PRIMARY KEY UNIQUE,
    rubrica VARCHAR,
    desdobramento VARCHAR
);

CREATE TABLE dim_delegacia (
    id_dim_delegacia INTEGER PRIMARY KEY UNIQUE,
    departamento VARCHAR,
    delegacia VARCHAR,
    seccional VARCHAR
);

CREATE TABLE dim_hora (
    id_dim_ INTEGER PRIMARY KEY UNIQUE,
    hora TIME,
    minito TIME
);

CREATE TABLE dim_delegacia_circ (
    id_dim_ INTEGER PRIMARY KEY UNIQUE,
    departamento_circ VARCHAR,
    delegacia_circ VARCHAR,
    seccional_circ VARCHAR
);

CREATE TABLE dim_data (
    id_dim_ INTEGER PRIMARY KEY UNIQUE,
    dia INTEGER,
    mes INTEGER,
    ano INTEGER
);

CREATE TABLE fato_crime (
    num_bo INTEGER,
    idade_pessoa INTEGER,
    hora INTEGER,
    rubrica INTEGER,
    delegacia_circ INTEGER,
    delegacia INTEGER,
    data INTEGER,
    local INTEGER,
    pessoa INTEGER
);

ALTER TABLE fato_crime ADD CONSTRAINT FK_fato_crime_1
    FOREIGN KEY(hora???)
    REFERENCES dim_hora(???);

ALTER TABLE fato_crime ADD CONSTRAINT FK_fato_crime_2
    FOREIGN KEY(rubrica???)
    REFERENCES dim_rubrica(???);

ALTER TABLE fato_crime ADD CONSTRAINT FK_fato_crime_3
    FOREIGN KEY(delegacia_circ???)
    REFERENCES dim_delegacia_circ(???);

ALTER TABLE fato_crime ADD CONSTRAINT FK_fato_crime_4
    FOREIGN KEY(delegacia???)
    REFERENCES dim_delegacia(???);

ALTER TABLE fato_crime ADD CONSTRAINT FK_fato_crime_5
    FOREIGN KEY(data???)
    REFERENCES dim_data(???);

ALTER TABLE fato_crime ADD CONSTRAINT FK_fato_crime_6
    FOREIGN KEY(local???)
    REFERENCES dim_local(???);

ALTER TABLE fato_crime ADD CONSTRAINT FK_fato_crime_7
    FOREIGN KEY(pessoa???)
    REFERENCES dim_pessoa(???);
