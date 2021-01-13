IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SP_AtualizarStatusAgendamento]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SP_AtualizarStatusAgendamento]
GO

CREATE PROCEDURE [dbo].[SP_AtualizarStatusAgendamento] 
	@IdAgendamento INT,
	@IdStatus TINYINT
 
AS

	/* 
	Documentação
	Módulo............: Agendamento
	Objetivo..........: Procedure para atualizar status de um agentamento.
	EX................: EXEC [dbo].[SP_AtualizarStatusAgendamento]
	*/

	BEGIN

		UPDATE [dbo].[Agendamento] 
			SET IdStatus = @IdStatus, 
				DataAlteracao = GETDATE()
			WHERE IdAgendamento = @IdAgendamento
	END