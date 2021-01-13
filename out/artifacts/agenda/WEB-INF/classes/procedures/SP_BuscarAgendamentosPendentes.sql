IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SP_BuscarAgendamentosPendentes]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SP_BuscarAgendamentosPendentes]
GO
CREATE PROCEDURE [dbo].[SP_BuscarAgendamentosPendentes]
	@IdUsuario INT = NULL

AS
	/* 
	Documentação
	Módulo............: Agendamento
	Objetivo..........: Procedure para buscar os agendamentos de acordo com os filtros informados
	EX................: EXEC [SP_BuscarAgendamentosPendentes] 
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
			WHERE IdUsuario = @IdUsuario
				AND IdStatus = 1 -- Agendado
				AND DataAgendamento <= GETDATE()
	END