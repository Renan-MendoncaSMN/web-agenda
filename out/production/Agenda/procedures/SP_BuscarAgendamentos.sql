IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SP_BuscarAgendamentos]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SP_BuscarAgendamentos]
GO
CREATE PROCEDURE [dbo].[SP_BuscarAgendamentos]
	@IdUsuario INT,
	@Pagina TINYINT = NULL
AS
	/* 
	Documentação
	Módulo............: Agendamento
	Objetivo..........: Procedure para buscar os agendamentos 
	EX................: EXEC [dbo].[SP_BuscarAgendamentos]
	*/
	BEGIN

		SELECT  ag.IdAgendamento,
				ag.Assunto,
				ag.Descricao,
				ag.DataAgendamento,
				ag.DataCadastro,
				ag.DataAlteracao,
				ag.EmailNotificacao,
				ag.UrlRedirecionamento,
				ag.IdUsuario,
				ag.IdStatus
			FROM [dbo].[Agendamento] ag WITH(NOLOCK)
			WHERE ag.IdUsuario = @IdUsuario
			ORDER BY ag.DataAgendamento  DESC
				OFFSET IIF(@pagina IS NOT NULL, @pagina*10-10, 0) 
				ROWS FETCH NEXT 10 ROWS ONLY;
	END