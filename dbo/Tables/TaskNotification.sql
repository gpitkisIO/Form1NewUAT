CREATE TABLE [dbo].[TaskNotification] (
    [LastModified]       DATETIME2 (7)  NULL,
    [ModifiedBy]         INT            NULL,
    [Deleted]            BIT            NOT NULL,
    [TaskNotificationId] INT            IDENTITY (1, 1) NOT NULL,
    [TaskInstanceId]     INT            NULL,
    [Subject]            NVARCHAR (MAX) NULL,
    [Body]               NVARCHAR (MAX) NULL,
    [ToAddresses]        NVARCHAR (MAX) NULL,
    [CcAddresses]        NVARCHAR (MAX) NULL,
    [BccAddresses]       NVARCHAR (MAX) NULL,
    [PriorityId]         INT            NOT NULL,
    [DateTimeSent]       DATETIME2 (7)  NULL,
    [DateToBeSent]       DATETIME2 (7)  NOT NULL,
    [DateCreated]        DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_TaskNotification] PRIMARY KEY CLUSTERED ([TaskNotificationId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TaskNotification_TaskInstanceId]
    ON [dbo].[TaskNotification]([TaskInstanceId] ASC);

