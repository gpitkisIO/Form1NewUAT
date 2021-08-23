CREATE TABLE [dbo].[ChecklistQuestion] (
    [LastModified]        DATETIME2 (7)  NULL,
    [ModifiedBy]          INT            NULL,
    [Deleted]             BIT            NOT NULL,
    [ChecklistQuestionId] INT            IDENTITY (1, 1) NOT NULL,
    [Question]            NVARCHAR (MAX) NULL,
    [AccessKey]           NVARCHAR (MAX) NULL,
    [CanDelete]           BIT            CONSTRAINT [DF_ChecklistQuestion_CanDelete] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ChecklistQuestion] PRIMARY KEY CLUSTERED ([ChecklistQuestionId] ASC)
);

