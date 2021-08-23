CREATE TABLE [dbo].[NotificationTemplate] (
    [LastModified]           DATETIME2 (7)  NULL,
    [ModifiedBy]             INT            NULL,
    [Deleted]                BIT            NOT NULL,
    [NotificationTemplateId] INT            IDENTITY (1, 1) NOT NULL,
    [NotificationKey]        NVARCHAR (MAX) NULL,
    [Subject]                NVARCHAR (MAX) NULL,
    [Body]                   NVARCHAR (MAX) NULL,
    [Description]            NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_NotificationTemplate] PRIMARY KEY CLUSTERED ([NotificationTemplateId] ASC)
);

