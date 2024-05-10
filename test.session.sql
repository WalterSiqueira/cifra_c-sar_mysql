CREATE DATABASE IF NOT EXISTS testes;

USE testes;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO usuarios(nome, email) VALUES
('alice', 'alice@example.com'),
('bob', 'bob@example.com'),
('carol', 'carol@example.com');

DELIMITER $$
CREATE PROCEDURE cifra_cesar_encode()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id_val INT;
    DECLARE nome_val VARCHAR(255);
    DECLARE email_val VARCHAR(255);
    DECLARE novo_nome VARCHAR(255);
    DECLARE novo_email VARCHAR(255);
    DECLARE cur CURSOR FOR SELECT id, nome, email FROM usuarios;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO id_val, nome_val, email_val;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        SET novo_nome = '';
        SET novo_email = '';
        SET @len_nome = LENGTH(nome_val);
        SET @len_email = LENGTH(email_val);
        SET @i = 1;
        
        WHILE @i <= @len_nome DO
            SET novo_nome = CONCAT(novo_nome, CHAR(((ASCII(SUBSTRING(nome_val, @i, 1)) + 3 - 32) % 95 + 32)));
            SET @i = @i + 1;
        END WHILE;
        
        SET @i = 1;
        WHILE @i <= @len_email DO
            SET novo_email = CONCAT(novo_email, CHAR(((ASCII(SUBSTRING(email_val, @i, 1)) + 3 - 32) % 95 + 32)));
            SET @i = @i + 1;
        END WHILE;
        
        UPDATE usuarios SET nome = novo_nome, email = novo_email WHERE id = id_val;
    END LOOP read_loop;
    
    CLOSE cur;
END$$

DELIMITER ;

CALL cifra_cesar_encode();

SELECT * FROM usuarios;