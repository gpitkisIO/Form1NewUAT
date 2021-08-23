CREATE TABLE [dbo].[TaskTemplate] (
    [LastModified]    DATETIME2 (7)  NULL,
    [ModifiedBy]      INT            NULL,
    [Deleted]         BIT            NOT NULL,
    [TaskTemplateId]  INT            IDENTITY (1, 1) NOT NULL,
    [DeadlineInDays]  INT            NULL,
    [TaskKey]         INT            NOT NULL,
    [TaskName]        NVARCHAR (MAX) NULL,
    [TaskUrlTemplate] NVARCHAR (MAX) NULL,
    [Form1FormId]     INT            NULL,
    [ActionRole]      NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_TaskTemplate] PRIMARY KEY CLUSTERED ([TaskTemplateId] ASC)
);

