CREATE DATABASE if NOT EXISTS escola_tecnica;

use escola_tecnica;

-- Tabela Aluno
CREATE TABLE Aluno (
    AlunoID INT PRIMARY KEY IDENTITY,
    Nome NVARCHAR(100),
    Idade INT,
    Email NVARCHAR(100)
)

-- Tabela Disciplina
CREATE TABLE Disciplina (
    DisciplinaID INT PRIMARY KEY IDENTITY,
    NomeDisciplina NVARCHAR(100),
    Descricao NVARCHAR(MAX)
)

-- Tabela Formacao
CREATE TABLE Formacao (
    FormacaoID INT PRIMARY KEY IDENTITY,
    NomeFormacao NVARCHAR(100),
    Descricao NVARCHAR(MAX)
)

-- Tabela Professor
CREATE TABLE Professor (
    ProfessorID INT PRIMARY KEY IDENTITY,
    Nome NVARCHAR(100),
    Email NVARCHAR(100)
)

-- Tabela FormacaoProf (Relacionamento entre Professor e Formacao)
CREATE TABLE FormacaoProf (
    ProfessorID INT,
    FormacaoID INT,
    FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID),
    FOREIGN KEY (FormacaoID) REFERENCES Formacao(FormacaoID),
    PRIMARY KEY (ProfessorID, FormacaoID)
)

-- Tabela Curso
CREATE TABLE Curso (
    CursoID INT PRIMARY KEY IDENTITY,
    NomeCurso NVARCHAR(100),
    Descricao NVARCHAR(MAX)
)

-- Tabela MatriculaCurso (Relacionamento entre Aluno e Curso)
CREATE TABLE MatriculaCurso (
    AlunoID INT,
    CursoID INT,
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID),
    PRIMARY KEY (AlunoID, CursoID)
)


CREATE PROCEDURE InserirTbLogin (
    @Username NVARCHAR(50),
    @Password NVARCHAR(50)
)
AS
BEGIN
    INSERT INTO TbLogin (Username, Password)
    VALUES (@Username, @Password)
END

CREATE PROCEDURE SelecionarTbLogin
AS
BEGIN
    SELECT * FROM TbLogin
END

CREATE PROCEDURE AtualizarTbLogin (
    @Username NVARCHAR(50),
    @NewPassword NVARCHAR(50)
)
AS
BEGIN
    UPDATE TbLogin
    SET Password = @NewPassword
    WHERE Username = @Username
END

CREATE PROCEDURE DeletarTbLogin (
    @Username NVARCHAR(50)
)
AS
BEGIN
    DELETE FROM TbLogin
    WHERE Username = @Username
END

-- Tabela Aluno
CREATE PROCEDURE InserirAluno (
    @Nome NVARCHAR(100),
    @Idade INT,
    @Email NVARCHAR(100)
)
AS
BEGIN
    INSERT INTO Aluno (Nome, Idade, Email)
    VALUES (@Nome, @Idade, @Email)
END

CREATE PROCEDURE SelecionarAluno
AS
BEGIN
    SELECT * FROM Aluno
END

CREATE PROCEDURE AtualizarAluno (
    @AlunoID INT,
    @Nome NVARCHAR(100),
    @Idade INT,
    @Email NVARCHAR(100)
)
AS
BEGIN
    UPDATE Aluno
    SET Nome = @Nome, Idade = @Idade, Email = @Email
    WHERE AlunoID = @AlunoID
END

CREATE PROCEDURE DeletarAluno (
    @AlunoID INT
)
AS
BEGIN
    DELETE FROM Aluno
    WHERE AlunoID = @AlunoID
END

-- Tabela Disciplina
CREATE PROCEDURE InserirDisciplina (
    @NomeDisciplina NVARCHAR(100),
    @Descricao NVARCHAR(MAX)
)
AS
BEGIN
    INSERT INTO Disciplina (NomeDisciplina, Descricao)
    VALUES (@NomeDisciplina, @Descricao)
END

CREATE PROCEDURE SelecionarDisciplina
AS
BEGIN
    SELECT * FROM Disciplina
END

CREATE PROCEDURE AtualizarDisciplina (
    @DisciplinaID INT,
    @NomeDisciplina NVARCHAR(100),
    @Descricao NVARCHAR(MAX)
)
AS
BEGIN
    UPDATE Disciplina
    SET NomeDisciplina = @NomeDisciplina, Descricao = @Descricao
    WHERE DisciplinaID = @DisciplinaID
END

CREATE PROCEDURE DeletarDisciplina (
    @DisciplinaID INT
)
AS
BEGIN
    DELETE FROM Disciplina
    WHERE DisciplinaID = @DisciplinaID
END

-- Tabela Formacao
CREATE PROCEDURE InserirFormacao (
    @NomeFormacao NVARCHAR(100),
    @Descricao NVARCHAR(MAX)
)
AS
BEGIN
    INSERT INTO Formacao (NomeFormacao, Descricao)
    VALUES (@NomeFormacao, @Descricao)
END

CREATE PROCEDURE SelecionarFormacao
AS
BEGIN
    SELECT * FROM Formacao
END

CREATE PROCEDURE AtualizarFormacao (
    @FormacaoID INT,
    @NomeFormacao NVARCHAR(100),
    @Descricao NVARCHAR(MAX)
)
AS
BEGIN
    UPDATE Formacao
    SET NomeFormacao = @NomeFormacao, Descricao = @Descricao
    WHERE FormacaoID = @FormacaoID
END

CREATE PROCEDURE DeletarFormacao (
    @FormacaoID INT
)
AS
BEGIN
    DELETE FROM Formacao
    WHERE FormacaoID = @FormacaoID
END

-- Tabela Professor
CREATE PROCEDURE InserirProfessor (
    @Nome NVARCHAR(100),
    @Email NVARCHAR(100)
)
AS
BEGIN
    INSERT INTO Professor (Nome, Email)
    VALUES (@Nome, @Email)
END

CREATE PROCEDURE SelecionarProfessor
AS
BEGIN
    SELECT * FROM Professor
END

CREATE PROCEDURE AtualizarProfessor (
    @ProfessorID INT,
    @Nome NVARCHAR(100),
    @Email NVARCHAR(100)
)
AS
BEGIN
    UPDATE Professor
    SET Nome = @Nome, Email = @Email
    WHERE ProfessorID = @ProfessorID
END

CREATE PROCEDURE DeletarProfessor (
    @ProfessorID INT
)
AS
BEGIN
    DELETE FROM Professor
    WHERE ProfessorID = @ProfessorID
END

-- Tabela FormacaoProf
CREATE PROCEDURE InserirFormacaoProf (
    @ProfessorID INT,
    @FormacaoID INT
)
AS
BEGIN
    INSERT INTO FormacaoProf (ProfessorID, FormacaoID)
    VALUES (@ProfessorID, @FormacaoID)
END

CREATE PROCEDURE SelecionarFormacaoProf
AS
BEGIN
    SELECT * FROM FormacaoProf
END

CREATE PROCEDURE DeletarFormacaoProf (
    @ProfessorID INT,
    @FormacaoID INT
)
AS
BEGIN
    DELETE FROM FormacaoProf
    WHERE ProfessorID = @ProfessorID AND FormacaoID = @FormacaoID
END

-- Tabela Curso
CREATE PROCEDURE InserirCurso (
    @NomeCurso NVARCHAR(100),
    @Descricao NVARCHAR(MAX)
)
AS
BEGIN
    INSERT INTO Curso (NomeCurso, Descricao)
    VALUES (@NomeCurso, @Descricao)
END

CREATE PROCEDURE SelecionarCurso
AS
BEGIN
    SELECT * FROM Curso
END

CREATE PROCEDURE AtualizarCurso (
    @CursoID INT,
    @NomeCurso NVARCHAR(100),
    @Descricao NVARCHAR(MAX)
)
AS
BEGIN
    UPDATE Curso
    SET NomeCurso = @NomeCurso, Descricao = @Descricao
    WHERE CursoID = @CursoID
END

CREATE PROCEDURE DeletarCurso (
    @CursoID INT
)
AS
BEGIN
    DELETE FROM Curso
    WHERE CursoID = @CursoID
END

-- Tabela MatriculaCurso
CREATE PROCEDURE InserirMatriculaCurso (
    @AlunoID INT,
    @CursoID INT
)
AS
BEGIN
    INSERT INTO MatriculaCurso (AlunoID, CursoID)
    VALUES (@AlunoID, @CursoID)
END

CREATE PROCEDURE SelecionarMatriculaCurso
AS
BEGIN
    SELECT * FROM MatriculaCurso
END

CREATE PROCEDURE DeletarMatriculaCurso (
    @AlunoID INT,
    @CursoID INT
)
AS
BEGIN
    DELETE FROM MatriculaCurso
    WHERE AlunoID = @AlunoID AND CursoID = @CursoID
END

