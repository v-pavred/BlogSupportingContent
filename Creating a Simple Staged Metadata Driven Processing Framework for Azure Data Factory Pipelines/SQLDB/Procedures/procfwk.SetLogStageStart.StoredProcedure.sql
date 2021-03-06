CREATE OR ALTER PROCEDURE [procfwk].[SetLogStageStart]
	(
	@ExecutionId UNIQUEIDENTIFIER,
	@StageId INT
	)
AS

BEGIN
	
	DECLARE @StageStart DATETIME = GETDATE()

	UPDATE
		[procfwk].[CurrentExecution]
	SET
		[StartDateTime] = @StageStart,
		[PipelineStatus] = 'Started'
	WHERE
		[LocalExecutionId] = @ExecutionId
		AND [StageId] = @StageId

END
GO
