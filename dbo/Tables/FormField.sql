CREATE TABLE [dbo].[FormField] (
    [FormFieldId]      INT            IDENTITY (1, 1) NOT NULL,
    [FieldName]        NVARCHAR (250) NULL,
    [FieldDescription] NVARCHAR (250) NULL,
    [LastModified]     DATETIME       NULL,
    [ModifiedBy]       INT            NULL,
    [Deleted]          BIT            CONSTRAINT [DF_FormField_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_FormField] PRIMARY KEY CLUSTERED ([FormFieldId] ASC)
);

