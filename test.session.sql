CREATE DATABASE IF NOT EXISTS testes;

USE testes;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO usuarios(nome, email) VALUES
('zambira', 'alice@example.com'),
('yuno', 'bob@example.com'),
('xania', 'carol@example.com');

DELIMITER $$

CREATE PROCEDURE cifra_cesar_encode()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id_val INT;
    DECLARE nome_val VARCHAR(255);
    DECLARE email_val VARCHAR(255);
    DECLARE novo_nome VARCHAR(255);
    DECLARE novo_email VARCHAR(255);
    DECLARE char_val INT(50);
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
            SET char_val = ASCII(SUBSTRING(nome_val, @i, 1));
            IF char_val >= 120 THEN
                SET char_val = char_val - 23;
            ELSE
                SET char_val = char_val + 3;
            END IF;
            SET novo_nome = CONCAT(novo_nome, CHAR(char_val));
            SET @i = @i + 1;
        END WHILE;

        SET @i = 1;
        WHILE @i <= @len_email DO
            SET char_val = ASCII(SUBSTRING(email_val, @i, 1));
            IF char_val >= 120 THEN
                SET char_val = char_val - 23;
            ELSE
                SET char_val = char_val + 3;
            END IF;
            SET novo_email = CONCAT(novo_email, CHAR(char_val));
            SET @i = @i + 1;
        END WHILE;

        UPDATE usuarios SET nome = novo_nome, email = novo_email WHERE id = id_val;
    END LOOP read_loop;

    CLOSE cur;
END$$

DELIMITER ;

CALL cifra_cesar_encode();

SELECT * FROM usuarios;
