CREATE TABLE [dbo].[TaskNotificationSchedule] (
    [LastModified]               DATETIME2 (7)  NULL,
    [ModifiedBy]                 INT            NULL,
    [Deleted]                    BIT            NOT NULL,
    [TaskNotificationScheduleId] INT            IDENTITY (1, 1) NOT NULL,
    [DaysToWaitBeforeSending]    INT            NOT NULL,
    [NotificationLayoutId]       INT            NOT NULL,
    [NotificationTemplateId]     INT            NOT NULL,
    [TaskTemplateId]             INT            NOT NULL,
    [RecipientsEmails]           NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_TaskNotificationSchedule] PRIMARY KEY CLUSTERED ([TaskNotificationScheduleId] ASC),
    CONSTRAINT [FK_TaskNotificationSchedule_NotificationLayout_NotificationLayoutId] FOREIGN KEY ([NotificationLayoutId]) REFERENCES [dbo].[NotificationLayout] ([NotificationLayoutId]) ON DELETE CASCADE,
    CONSTRAINT [FK_TaskNotificationSchedule_NotificationTemplate_NotificationTemplateId] FOREIGN KEY ([NotificationTemplateId]) REFERENCES [dbo].[NotificationTemplate] ([NotificationTemplateId]) ON DELETE CASCADE,
    CONSTRAINT [FK_TaskNotificationSchedule_TaskTemplate_TaskTemplateId] FOREIGN KEY ([TaskTemplateId]) REFERENCES [dbo].[TaskTemplate] ([TaskTemplateId]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_TaskNotificationSchedule_NotificationLayoutId]
    ON [dbo].[TaskNotificationSchedule]([NotificationLayoutId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TaskNotificationSchedule_NotificationTemplateId]
    ON [dbo].[TaskNotificationSchedule]([NotificationTemplateId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TaskNotificationSchedule_TaskTemplateId]
    ON [dbo].[TaskNotificationSchedule]([TaskTemplateId] ASC);

