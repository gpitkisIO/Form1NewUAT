CREATE TABLE [dbo].[PdfFormat] (
    [LastModified]       DATETIME2 (7)  NULL,
    [ModifiedBy]         INT            NULL,
    [Deleted]            BIT            NOT NULL,
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [WorkflowInstanceId] INT            NULL,
    [FileName]           NVARCHAR (MAX) NULL,
    [FileContent]        NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_PdfFormat] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PdfFormat_WorkflowInstance_WorkflowInstanceId] FOREIGN KEY ([WorkflowInstanceId]) REFERENCES [dbo].[WorkflowInstance] ([WorkflowInstanceId])
);


GO
CREATE NONCLUSTERED INDEX [IX_PdfFormat_WorkflowInstanceId]
    ON [dbo].[PdfFormat]([WorkflowInstanceId] ASC);

