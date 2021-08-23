CREATE TABLE [dbo].[FormSection] (
    [FormSectionId]   INT           IDENTITY (1, 1) NOT NULL,
    [FormSectionName] NVARCHAR (50) NOT NULL,
    [LastModified]    DATETIME      NULL,
    [ModifiedBy]      INT           NULL,
    [Deleted]         BIT           CONSTRAINT [DF_FormSection_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_FormSection] PRIMARY KEY CLUSTERED ([FormSectionId] ASC)
);

