CREATE TABLE [dbo].[NotificationLayout] (
    [LastModified]         DATETIME2 (7)  NULL,
    [ModifiedBy]           INT            NULL,
    [Deleted]              BIT            NOT NULL,
    [NotificationLayoutId] INT            IDENTITY (1, 1) NOT NULL,
    [LayoutKey]            NVARCHAR (MAX) NULL,
    [Layout]               NVARCHAR (MAX) NULL,
    [LayoutName]           NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_NotificationLayout] PRIMARY KEY CLUSTERED ([NotificationLayoutId] ASC)
);

