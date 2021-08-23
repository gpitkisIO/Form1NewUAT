CREATE TABLE [dbo].[Form1Form] (
    [Form1FormId]   INT         IDENTITY (1, 1) NOT NULL,
    [Form1FormName] NCHAR (250) NOT NULL,
    [LastModified]  DATETIME    NULL,
    [ModifiedBy]    INT         NULL,
    [Deleted]       BIT         CONSTRAINT [DF_Form1Form_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Form1Form] PRIMARY KEY CLUSTERED ([Form1FormId] ASC)
);

