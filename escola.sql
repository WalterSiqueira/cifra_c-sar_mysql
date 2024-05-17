CREATE DATABASE IF NOT EXISTS escola_tecnica;

USE escola_tecnica;

-- Tabela Aluno
CREATE TABLE Aluno (
    AlunoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Idade INT,
    Email VARCHAR(100)
);

-- Tabela Disciplina
CREATE TABLE Disciplina (
    DisciplinaID INT AUTO_INCREMENT PRIMARY KEY,
    NomeDisciplina VARCHAR(100),
    Descricao TEXT
);

-- Tabela Formacao
CREATE TABLE Formacao (
    FormacaoID INT AUTO_INCREMENT PRIMARY KEY,
    NomeFormacao VARCHAR(100),
    Descricao TEXT
);

-- Tabela Professor
CREATE TABLE Professor (
    ProfessorID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100)
);

-- Tabela FormacaoProf (Relacionamento entre Professor e Formacao)
CREATE TABLE FormacaoProf (
    ProfessorID INT,
    FormacaoID INT,
    FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID),
    FOREIGN KEY (FormacaoID) REFERENCES Formacao(FormacaoID),
    PRIMARY KEY (ProfessorID, FormacaoID)
);

-- Tabela Curso
CREATE TABLE Curso (
    CursoID INT AUTO_INCREMENT PRIMARY KEY,
    NomeCurso VARCHAR(100),
    Descricao TEXT
);

-- Tabela MatriculaCurso (Relacionamento entre Aluno e Curso)
CREATE TABLE MatriculaCurso (
    AlunoID INT,
    CursoID INT,
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID),
    PRIMARY KEY (AlunoID, CursoID)
);

-- Procedimentos Armazenados

-- TbLogin
DELIMITER //

CREATE PROCEDURE InserirTbLogin (
    IN p_Username VARCHAR(50),
    IN p_Password VARCHAR(50)
)
BEGIN
    INSERT INTO TbLogin (Username, Password) VALUES (p_Username, p_Password);
END //

CREATE PROCEDURE SelecionarTbLogin()
BEGIN
    SELECT * FROM TbLogin;
END //

CREATE PROCEDURE AtualizarTbLogin (
    IN p_Username VARCHAR(50),
    IN p_NewPassword VARCHAR(50)
)
BEGIN
    UPDATE TbLogin SET Password = p_NewPassword WHERE Username = p_Username;
END //

CREATE PROCEDURE DeletarTbLogin (
    IN p_Username VARCHAR(50)
)
BEGIN
    DELETE FROM TbLogin WHERE Username = p_Username;
END //

-- Aluno
CREATE PROCEDURE InserirAluno (
    IN p_Nome VARCHAR(100),
    IN p_Idade INT,
    IN p_Email VARCHAR(100)
)
BEGIN
    INSERT INTO Aluno (Nome, Idade, Email) VALUES (p_Nome, p_Idade, p_Email);
END //

CREATE PROCEDURE SelecionarAluno()
BEGIN
    SELECT * FROM Aluno;
END //

CREATE PROCEDURE AtualizarAluno (
    IN p_AlunoID INT,
    IN p_Nome VARCHAR(100),
    IN p_Idade INT,
    IN p_Email VARCHAR(100)
)
BEGIN
    UPDATE Aluno SET Nome = p_Nome, Idade = p_Idade, Email = p_Email WHERE AlunoID = p_AlunoID;
END //

CREATE PROCEDURE DeletarAluno (
    IN p_AlunoID INT
)
BEGIN
    DELETE FROM Aluno WHERE AlunoID = p_AlunoID;
END //

-- Disciplina
CREATE PROCEDURE InserirDisciplina (
    IN p_NomeDisciplina VARCHAR(100),
    IN p_Descricao TEXT
)
BEGIN
    INSERT INTO Disciplina (NomeDisciplina, Descricao) VALUES (p_NomeDisciplina, p_Descricao);
END //

CREATE PROCEDURE SelecionarDisciplina()
BEGIN
    SELECT * FROM Disciplina;
END //

CREATE PROCEDURE AtualizarDisciplina (
    IN p_DisciplinaID INT,
    IN p_NomeDisciplina VARCHAR(100),
    IN p_Descricao TEXT
)
BEGIN
    UPDATE Disciplina SET NomeDisciplina = p_NomeDisciplina, Descricao = p_Descricao WHERE DisciplinaID = p_DisciplinaID;
END //

CREATE PROCEDURE DeletarDisciplina (
    IN p_DisciplinaID INT
)
BEGIN
    DELETE FROM Disciplina WHERE DisciplinaID = p_DisciplinaID;
END //

-- Formacao
CREATE PROCEDURE InserirFormacao (
    IN p_NomeFormacao VARCHAR(100),
    IN p_Descricao TEXT
)
BEGIN
    INSERT INTO Formacao (NomeFormacao, Descricao) VALUES (p_NomeFormacao, p_Descricao);
END //

CREATE PROCEDURE SelecionarFormacao()
BEGIN
    SELECT * FROM Formacao;
END //

CREATE PROCEDURE AtualizarFormacao (
    IN p_FormacaoID INT,
    IN p_NomeFormacao VARCHAR(100),
    IN p_Descricao TEXT
)
BEGIN
    UPDATE Formacao SET NomeFormacao = p_NomeFormacao, Descricao = p_Descricao WHERE FormacaoID = p_FormacaoID;
END //

CREATE PROCEDURE DeletarFormacao (
    IN p_FormacaoID INT
)
BEGIN
    DELETE FROM Formacao WHERE FormacaoID = p_FormacaoID;
END //

-- Professor
CREATE PROCEDURE InserirProfessor (
    IN p_Nome VARCHAR(100),
    IN p_Email VARCHAR(100)
)
BEGIN
    INSERT INTO Professor (Nome, Email) VALUES (p_Nome, p_Email);
END //

CREATE PROCEDURE SelecionarProfessor()
BEGIN
    SELECT * FROM Professor;
END //

CREATE PROCEDURE AtualizarProfessor (
    IN p_ProfessorID INT,
    IN p_Nome VARCHAR(100),
    IN p_Email VARCHAR(100)
)
BEGIN
    UPDATE Professor SET Nome = p_Nome, Email = p_Email WHERE ProfessorID = p_ProfessorID;
END //

CREATE PROCEDURE DeletarProfessor (
    IN p_ProfessorID INT
)
BEGIN
    DELETE FROM Professor WHERE ProfessorID = p_ProfessorID;
END //

-- FormacaoProf
CREATE PROCEDURE InserirFormacaoProf (
    IN p_ProfessorID INT,
    IN p_FormacaoID INT
)
BEGIN
    INSERT INTO FormacaoProf (ProfessorID, FormacaoID) VALUES (p_ProfessorID, p_FormacaoID);
END //

CREATE PROCEDURE SelecionarFormacaoProf()
BEGIN
    SELECT * FROM FormacaoProf;
END //

CREATE PROCEDURE DeletarFormacaoProf (
    IN p_ProfessorID INT,
    IN p_FormacaoID INT
)
BEGIN
    DELETE FROM FormacaoProf WHERE ProfessorID = p_ProfessorID AND FormacaoID = p_FormacaoID;
END //

-- Curso
CREATE PROCEDURE InserirCurso (
    IN p_NomeCurso VARCHAR(100),
    IN p_Descricao TEXT
)
BEGIN
    INSERT INTO Curso (NomeCurso, Descricao) VALUES (p_NomeCurso, p_Descricao);
END //

CREATE PROCEDURE SelecionarCurso()
BEGIN
    SELECT * FROM Curso;
END //

CREATE PROCEDURE AtualizarCurso (
    IN p_CursoID INT,
    IN p_NomeCurso VARCHAR(100),
    IN p_Descricao TEXT
)
BEGIN
    UPDATE Curso SET NomeCurso = p_NomeCurso, Descricao = p_Descricao WHERE CursoID = p_CursoID;
END //

CREATE PROCEDURE DeletarCurso (
    IN p_CursoID INT
)
BEGIN
    DELETE FROM Curso WHERE CursoID = p_CursoID;
END //

-- MatriculaCurso
CREATE PROCEDURE InserirMatriculaCurso (
    IN p_AlunoID INT,
    IN p_CursoID INT
)
BEGIN
    INSERT INTO MatriculaCurso (AlunoID, CursoID) VALUES (p_AlunoID, p_CursoID);
END //

CREATE PROCEDURE SelecionarMatriculaCurso()
BEGIN
    SELECT * FROM MatriculaCurso;
END //

CREATE PROCEDURE DeletarMatriculaCurso (
    IN p_AlunoID INT,
    IN p_CursoID INT
)
BEGIN
    DELETE FROM MatriculaCurso WHERE AlunoID = p_AlunoID AND CursoID = p_CursoID;
END //

DELIMITER ;
