CREATE TABLE [dbo].[Attachment] (
    [LastModified]        DATETIME2 (7)  NULL,
    [ModifiedBy]          INT            NULL,
    [Deleted]             BIT            NOT NULL,
    [AttachmentId]        INT            IDENTITY (1, 1) NOT NULL,
    [RequestDataId]       INT            NULL,
    [RequestOffsetDataId] INT            NULL,
    [FileName]            NVARCHAR (MAX) NULL,
    [FileContent]         NVARCHAR (MAX) NULL,
    [FileType]            NVARCHAR (MAX) NULL,
    [Size]                INT            NOT NULL,
    CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED ([AttachmentId] ASC),
    CONSTRAINT [FK_Attachment_RequestData] FOREIGN KEY ([RequestDataId]) REFERENCES [dbo].[RequestData] ([RequestDataId]),
    CONSTRAINT [FK_Attachment_RequestOffsetData_RequestOffsetDataId] FOREIGN KEY ([RequestOffsetDataId]) REFERENCES [dbo].[RequestOffsetData] ([RequestOffsetDataId])
);


GO
CREATE NONCLUSTERED INDEX [IX_Attachment_RequestDataId]
    ON [dbo].[Attachment]([RequestDataId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Attachment_RequestOffsetDataId]
    ON [dbo].[Attachment]([RequestOffsetDataId] ASC);

