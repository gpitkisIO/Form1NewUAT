CREATE TABLE [dbo].[FormTemplate] (
    [TemplateId]   INT            IDENTITY (1, 1) NOT NULL,
    [TemplateName] NVARCHAR (250) NOT NULL,
    [Template]     NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_FormTemplate] PRIMARY KEY CLUSTERED ([TemplateId] ASC)
);

