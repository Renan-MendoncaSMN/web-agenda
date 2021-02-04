IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SP_Login]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SP_Login]
GO
CREATE PROCEDURE [dbo].[SP_Login] 
	@email VARCHAR(50),
	@senha VARCHAR(50),
	@resposta INT = '0'
 
 AS
	/* 
	Documenta??o
	M?dulo............: Login
	Objetivo..........: Procedure para logar no sistema
	EX................: EXEC [dbo].[SP_Login]'renan.mendonca@smn.com.br', 'renan123';
	*/
	BEGIN

		SET NOCOUNT ON;

		IF EXISTS(SELECT  FROM [dbo].[Usuario] usuario
			WHERE usuario.email = @email
			AND usuario.senha=@senha)
			SET @resposta = 1
			ELSE
			SET @email = 0
			PRINT @resposta

	END