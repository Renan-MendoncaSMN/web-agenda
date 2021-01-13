IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SP_BuscarQuantidadeAgendamentosPendentes]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SP_BuscarQuantidadeAgendamentosPendentes]
GO
CREATE PROCEDURE [dbo].[SP_BuscarQuantidadeAgendamentosPendentes] 
	@IdUsuario INT

 AS
	/* 
	Documentação
	Módulo............: Agendamento
	Objetivo..........: Procedure para retornar o numero de agendamentos em um determinado status, para um determinado usuário em uma determinada data 
	EX................: EXEC [dbo].[SP_BuscarQuantidadeAgendamentosPendentes]
	*/
	BEGIN

		SELECT COUNT(IdAgendamento) AS QuantidadeAgendamentos
			FROM [dbo].[Agendamento] WITH(NOLOCK)
			WHERE IdUsuario = @IdUsuario
				AND IdStatus = 1 -- Agendado
				AND DataAgendamento <= GETDATE()
	END
