IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SP_CadastrarAgendamento]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SP_CadastrarAgendamento]
GO
CREATE PROCEDURE [dbo].[SP_CadastrarAgendamento] 
	@Assunto VARCHAR (50),
	@Descricao VARCHAR (200),
	@DataAgendamento DATETIME,
	@IdUsuario INT,
	@EmailNotificacao BIT,
	@UrlRedirecionamento VARCHAR(200) 
 
 AS
	/* 
	Documentação
	Módulo............: Agendamento
	Objetivo..........: Procedure para cadastrar um novo agendamento
	EX................: EXEC [dbo].[SP_CadastrarAgendamento] 'Atualizar os dados do Sacado', 'Atualizar o dados do 000817 - DROGA LESTE LTDA EPP','2021-15-01 12:00', 147, 1, null;
	*/
	BEGIN

		INSERT INTO [dbo].[Agendamento] (Assunto, Descricao, DataAgendamento, IdStatus, IdUsuario, DataCadastro, EmailNotificacao, UrlRedirecionamento) 
			VALUES (@Assunto, @Descricao, @DataAgendamento, 1, @IdUsuario, GETDATE(), @EmailNotificacao, @UrlRedirecionamento)

	END