--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      DoglasInc
-- Project :      survey.DM1
-- Author :       Doglas
--
-- Date Created : Thursday, April 30, 2020 15:52:25
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: disp_x_persona 
--

CREATE TABLE disp_x_persona(
    id          INT            NOT NULL,
    cod_disp    VARCHAR(10)    NOT NULL,
    PRIMARY KEY (id, cod_disp)
)ENGINE=INNODB
;



-- 
-- TABLE: dispositivos 
--

CREATE TABLE dispositivos(
    cod_disp    VARCHAR(10)     NOT NULL,
    descrip     VARCHAR(100),
    PRIMARY KEY (cod_disp)
)ENGINE=INNODB
;



-- 
-- TABLE: encuestas 
--

CREATE TABLE encuestas(
    id                 INT             AUTO_INCREMENT,
    nombre             VARCHAR(200)    NOT NULL,
    doc                VARCHAR(30),
    fecha_nac          DATE,
    cod_estudio        VARCHAR(10)     NOT NULL,
    acceso_internet    VARCHAR(10),
    fecha              DATE            NOT NULL,
    geoloc             VARCHAR(100),
    PRIMARY KEY (id)
)ENGINE=INNODB
;



-- 
-- TABLE: niveles_estudios 
--

CREATE TABLE niveles_estudios(
    cod_estudio    VARCHAR(10)     NOT NULL,
    descripcion    VARCHAR(100),
    PRIMARY KEY (cod_estudio)
)ENGINE=INNODB
;



-- 
-- INDEX: Ref14 
--

CREATE INDEX Ref14 ON disp_x_persona(id)
;
-- 
-- INDEX: Ref25 
--

CREATE INDEX Ref25 ON disp_x_persona(cod_disp)
;
-- 
-- INDEX: Ref32 
--

CREATE INDEX Ref32 ON encuestas(cod_estudio)
;
-- 
-- TABLE: disp_x_persona 
--

ALTER TABLE disp_x_persona ADD CONSTRAINT Refencuestas41 
    FOREIGN KEY (id)
    REFERENCES encuestas(id)
;

ALTER TABLE disp_x_persona ADD CONSTRAINT Refdispositivos51 
    FOREIGN KEY (cod_disp)
    REFERENCES dispositivos(cod_disp)
;


-- 
-- TABLE: encuestas 
--

ALTER TABLE encuestas ADD CONSTRAINT Refniveles_estudios21 
    FOREIGN KEY (cod_estudio)
    REFERENCES niveles_estudios(cod_estudio)
;


