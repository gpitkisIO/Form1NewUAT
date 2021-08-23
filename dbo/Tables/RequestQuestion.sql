CREATE TABLE [dbo].[RequestQuestion] (
    [RequestQuestionId]   INT            IDENTITY (1, 1) NOT NULL,
    [RequestDataId]       INT            NULL,
    [RequestOffsetDataId] INT            NULL,
    [Question]            NVARCHAR (MAX) NULL,
    [AccessKey]           NVARCHAR (50)  NULL,
    [Answer]              INT            NOT NULL,
    [Comment]             NVARCHAR (MAX) NULL,
    [showLogic]           NVARCHAR (MAX) NULL,
    [show]                BIT            CONSTRAINT [DF_RequestQuestion_show] DEFAULT ((1)) NOT NULL,
    [Required]            BIT            CONSTRAINT [DF_RequestQuestion_Required] DEFAULT ((0)) NOT NULL,
    [ReadOnly]            BIT            CONSTRAINT [DF_RequestQuestion_ReadOnly] DEFAULT ((0)) NOT NULL,
    [DefaultAnswer]       INT            CONSTRAINT [DF_RequestQuestion_DefaultAnswer] DEFAULT ((3)) NOT NULL,
    [DefaultComment]      NVARCHAR (MAX) NULL,
    [Section]             INT            CONSTRAINT [DF_RequestQuestion_Section] DEFAULT ((3)) NOT NULL,
    [ListOrder]           INT            NOT NULL,
    [LastModified]        DATETIME2 (7)  NULL,
    [ModifiedBy]          INT            NULL,
    [Deleted]             BIT            NOT NULL,
    [ShowFormLogic]       NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_RequestQuestion] PRIMARY KEY CLUSTERED ([RequestQuestionId] ASC),
    CONSTRAINT [FK_RequestQuestion_RequestData] FOREIGN KEY ([RequestDataId]) REFERENCES [dbo].[RequestData] ([RequestDataId])
);


GO
CREATE NONCLUSTERED INDEX [IX_RequestQuestion_RequestDataId]
    ON [dbo].[RequestQuestion]([RequestDataId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestQuestion_RequestOffsetDataId]
    ON [dbo].[RequestQuestion]([RequestOffsetDataId] ASC);

