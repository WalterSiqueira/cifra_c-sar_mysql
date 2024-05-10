CREATE DATABASE if NOT EXISTS veterinario;

USE veterinario;

/* Criação das Tabelas */

CREATE DATABASE IF NOT EXISTS bdClinVeterProc;
USE bdClinVeterProc;

/* TABELA LOGIN */
CREATE TABLE IF NOT EXISTS tblogin(
    usuario VARCHAR(50) PRIMARY KEY,
    senha VARCHAR(10),
    tipo INT
);

/* TABELA CLIENTE */
CREATE TABLE IF NOT EXISTS tbCliente(
    codCli INT PRIMARY KEY AUTO_INCREMENT,
    nomeCli VARCHAR(50),
    telCli VARCHAR(13),
    EmailCli VARCHAR(50)
);

/* TABELA ENDEREÇO */
CREATE TABLE IF NOT EXISTS tbEndereco(
    codEnd INT PRIMARY KEY AUTO_INCREMENT,
    codCli INT,
    Endereco VARCHAR(50),
    Numero VARCHAR(13),
    complemeto VARCHAR(50)
);

/* TABELA TIPO */
CREATE TABLE IF NOT EXISTS tbTipo(
    codTipo INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50)
);

/* TABELA RAÇA */
CREATE TABLE IF NOT EXISTS tbRaca(
    codRaca INT PRIMARY KEY AUTO_INCREMENT,
    racaAni VARCHAR(50),
    codTipo INT
);

/* TABELA ANIMAL */
CREATE TABLE IF NOT EXISTS tbAnimal(
    codAni INT PRIMARY KEY AUTO_INCREMENT,
    nomeAni VARCHAR(50),
    codRaca INT,
    codCli INT
);

/* TABELA VETERINARIO */
CREATE TABLE IF NOT EXISTS tbVeterinario(
    codVeter INT PRIMARY KEY AUTO_INCREMENT,
    NomeVeter VARCHAR(50),
    TelVeter VARCHAR(20),
    EmailVeter VARCHAR(50)
);

/* TABELA ATENDIMENTO */
CREATE TABLE IF NOT EXISTS tbAtendimento(
    codAtendimento INT PRIMARY KEY AUTO_INCREMENT,
    dataAtend VARCHAR(50),
    horaAtend VARCHAR(8),
    statusAtend VARCHAR(50),
    codVeter INT,
    codAni INT
);

/* Definição de Foreign Keys */

ALTER TABLE tbEndereco
ADD CONSTRAINT fk_cliente_endereco
FOREIGN KEY (codCli) REFERENCES tbCliente(codCli);

ALTER TABLE tbRaca
ADD CONSTRAINT fk_tipo_raca
FOREIGN KEY (codTipo) REFERENCES tbTipo(codTipo);

ALTER TABLE tbAnimal
ADD CONSTRAINT fk_raca_animal
FOREIGN KEY (codRaca) REFERENCES tbRaca(codRaca),
ADD CONSTRAINT fk_cliente_animal
FOREIGN KEY (codCli) REFERENCES tbCliente(codCli);

ALTER TABLE tbAtendimento
ADD CONSTRAINT fk_veterinario_atendimento
FOREIGN KEY (codVeter) REFERENCES tbVeterinario(codVeter),
ADD CONSTRAINT fk_animal_atendimento
FOREIGN KEY (codAni) REFERENCES tbAnimal(codAni);

/* Definição das Procedures */

DELIMITER $$

CREATE PROCEDURE pcd_insertCliente(
    _nomeCli VARCHAR(50),
    _telCli VARCHAR(13),
    _EmailCli VARCHAR(50)
)
BEGIN
    START TRANSACTION;
    INSERT INTO tbCliente(nomeCli, telCli, EmailCli) VALUES(_nomeCli, _telCli, _EmailCli);
    COMMIT;
    ROLLBACK;
END $$

CREATE PROCEDURE pcd_selectCliente()
BEGIN
    SELECT * FROM tbCliente;
END $$

CREATE PROCEDURE pcd_selectClientePorId(_codCli INT)
BEGIN
    SELECT * FROM tbCliente WHERE codCli = _codCli;
END $$

CREATE PROCEDURE pcd_updateCliente(
    _codCli INT,
    _nomeCli VARCHAR(50),
    _telCli VARCHAR(13),
    _EmailCli VARCHAR(50)
)
BEGIN
    START TRANSACTION;
    UPDATE tbCliente SET nomeCli = _nomeCli, telCli = _telCli, EmailCli = _EmailCli WHERE codCli = _codCli;
    COMMIT;
    ROLLBACK;
END $$

CREATE PROCEDURE pcd_deleteCliente(_codCli INT)
BEGIN
    START TRANSACTION;
    DELETE FROM tbCliente WHERE codCli = _codCli;
    COMMIT;
    ROLLBACK;
END $$

/* Defina outras procedures para as tabelas restantes da mesma maneira */

DELIMITER ;


