CREATE TABLE [dbo].[TaskDelegation] (
    [LastModified]     DATETIME2 (7) NULL,
    [ModifiedBy]       INT           NULL,
    [Deleted]          BIT           NOT NULL,
    [TaskDelegationId] INT           IDENTITY (1, 1) NOT NULL,
    [TaskInstanceId]   INT           NOT NULL,
    [UserId]           INT           NULL,
    [UserDelegateId]   INT           NULL,
    CONSTRAINT [PK_TaskDelegation] PRIMARY KEY CLUSTERED ([TaskDelegationId] ASC),
    CONSTRAINT [FK_TaskDelegation_TaskInstance] FOREIGN KEY ([TaskInstanceId]) REFERENCES [dbo].[TaskInstance] ([TaskInstanceId])
);

