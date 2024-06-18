BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Todos] (
    [id] INT NOT NULL IDENTITY(1,1),
    [title] NVARCHAR(1000) NOT NULL,
    [done] BIT NOT NULL CONSTRAINT [Todos_done_df] DEFAULT 0,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [Todos_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [deletedAt] DATETIME2,
    CONSTRAINT [Todos_pkey] PRIMARY KEY CLUSTERED ([id])
);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
