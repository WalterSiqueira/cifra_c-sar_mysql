create database if not exists testes;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255)
);

INSERT INTO usuarios(nome) VALUES
('alice'),
('bob'),
('carol');

DELIMITER $$
CREATE PROCEDURE cifra_de_cesar()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE nome_original VARCHAR(255);
    DECLARE novo_nome VARCHAR(255);
    DECLARE cur CURSOR FOR SELECT nome FROM usuarios;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO nome_original;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        SET novo_nome = '';
        SET @len = LENGTH(nome_original);
        SET @i = 1;
        
        WHILE @i <= @len DO
            SET novo_nome = CONCAT(novo_nome, CHAR(ASCII(SUBSTRING(nome_original, @i, 1)) + 3));
            SET @i = @i + 1;
        END WHILE;
        
        UPDATE usuarios SET nome = novo_nome WHERE nome = nome_original;
    END LOOP read_loop;
    
    CLOSE cur;
END$$
DELIMITER ;


CALL cifra_de_cesar();

select * from usuarios;