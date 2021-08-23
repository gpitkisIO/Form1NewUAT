CREATE TABLE [dbo].[RequestRejectionReason] (
    [LastModified]             DATETIME2 (7)  NULL,
    [ModifiedBy]               INT            NULL,
    [Deleted]                  BIT            NOT NULL,
    [RequestRejectionReasonId] INT            IDENTITY (1, 1) NOT NULL,
    [RejectionReason]          NVARCHAR (MAX) NULL,
    [TaskInstanceId]           INT            NOT NULL,
    CONSTRAINT [PK_RequestRejectionReason] PRIMARY KEY CLUSTERED ([RequestRejectionReasonId] ASC),
    CONSTRAINT [FK_RequestRejectionReason_TaskInstance_TaskInstanceId] FOREIGN KEY ([TaskInstanceId]) REFERENCES [dbo].[TaskInstance] ([TaskInstanceId]) ON DELETE CASCADE
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RequestRejectionReason_TaskInstanceId]
    ON [dbo].[RequestRejectionReason]([TaskInstanceId] ASC);

