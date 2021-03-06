CREATE TABLE [dbo].[RequestTypeFormField] (
    [RequestTypeId]       INT            NOT NULL,
    [FormFieldId]         INT            NOT NULL,
    [Form1FormId]         INT            NOT NULL,
    [FormSectionId]       INT            CONSTRAINT [DF_RequestTypeFormField_FormSectionId] DEFAULT ((1)) NOT NULL,
    [Label]               NVARCHAR (250) NULL,
    [listOrder]           INT            CONSTRAINT [DF_RequestTypeFormField_order] DEFAULT ((0)) NOT NULL,
    [ControlType]         NVARCHAR (250) NULL,
    [ItemListFilter]      NVARCHAR (250) NULL,
    [DefaultItemFilter]   NVARCHAR (250) NULL,
    [Required]            BIT            CONSTRAINT [DF_RequestTypeFormField_Required] DEFAULT ((0)) NOT NULL,
    [MaxValue]            INT            NULL,
    [MinValue]            INT            NULL,
    [MaxLength]           INT            NULL,
    [Minlength]           INT            NULL,
    [ValidationLogicName] NVARCHAR (250) NULL,
    [PostCreationLogic]   NVARCHAR (250) NULL,
    [PreCreationLogic]    NVARCHAR (250) NULL,
    [Readonly]            BIT            CONSTRAINT [DF_RequestTypeFormField_Readonly] DEFAULT ((0)) NOT NULL,
    [FormSectionTitle]    NVARCHAR (250) NULL,
    [LastModified]        DATETIME       NULL,
    [ModifiedBy]          INT            NULL,
    [Deleted]             BIT            CONSTRAINT [DF_RequestTypeFormField_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_RequestTypeFormField] PRIMARY KEY CLUSTERED ([FormFieldId] ASC, [Form1FormId] ASC, [FormSectionId] ASC, [RequestTypeId] ASC),
    CONSTRAINT [FK_RequestTypeFormField_Form1Form] FOREIGN KEY ([Form1FormId]) REFERENCES [dbo].[Form1Form] ([Form1FormId]),
    CONSTRAINT [FK_RequestTypeFormField_FormField] FOREIGN KEY ([FormFieldId]) REFERENCES [dbo].[FormField] ([FormFieldId]),
    CONSTRAINT [FK_RequestTypeFormField_FormSection] FOREIGN KEY ([FormSectionId]) REFERENCES [dbo].[FormSection] ([FormSectionId]),
    CONSTRAINT [FK_RequestTypeFormField_RequestType] FOREIGN KEY ([RequestTypeId]) REFERENCES [dbo].[RequestType] ([RequestTypeId])
);

