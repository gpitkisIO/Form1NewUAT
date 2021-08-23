CREATE TABLE [dbo].[TaskInstance] (
    [LastModified]      DATETIME2 (7)  NULL,
    [ModifiedBy]        INT            NULL,
    [Deleted]           BIT            NOT NULL,
    [TaskInstanceId]    INT            IDENTITY (1, 1) NOT NULL,
    [TaskName]          NVARCHAR (MAX) NULL,
    [TaskUrl]           NVARCHAR (MAX) NULL,
    [Deadline]          DATETIME2 (7)  NULL,
    [DateCreated]       DATETIME2 (7)  NOT NULL,
    [DateCompleted]     DATETIME2 (7)  NULL,
    [WorkflowStage]     INT            NOT NULL,
    [TaskStatus]        INT            CONSTRAINT [DF_TaskInstance_TaskStatus] DEFAULT ((1)) NOT NULL,
    [TaskTemplateId]    INT            NOT NULL,
    [UserId]            INT            NOT NULL,
    [WorkflowInstaceId] INT            NOT NULL,
    [ActionTaken]       INT            CONSTRAINT [DF_TaskInstance_ActionTaken] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_TaskInstance] PRIMARY KEY CLUSTERED ([TaskInstanceId] ASC),
    CONSTRAINT [FK_TaskInstance_TaskTemplate_TaskTemplateId] FOREIGN KEY ([TaskTemplateId]) REFERENCES [dbo].[TaskTemplate] ([TaskTemplateId]) ON DELETE CASCADE,
    CONSTRAINT [FK_TaskInstance_WorkflowInstance_WorkflowInstaceId] FOREIGN KEY ([WorkflowInstaceId]) REFERENCES [dbo].[WorkflowInstance] ([WorkflowInstanceId]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_TaskInstance_TaskTemplateId]
    ON [dbo].[TaskInstance]([TaskTemplateId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TaskInstance_UserId]
    ON [dbo].[TaskInstance]([UserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TaskInstance_WorkflowInstaceId]
    ON [dbo].[TaskInstance]([WorkflowInstaceId] ASC);

