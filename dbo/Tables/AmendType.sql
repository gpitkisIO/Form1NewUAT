CREATE TABLE [dbo].[AmendType] (
    [AmendTypeId]   INT           IDENTITY (1, 1) NOT NULL,
    [AmendTypeName] NVARCHAR (50) NOT NULL,
    [LastModified]  DATETIME      NULL,
    [ModifiedBy]    INT           NULL,
    [Deleted]       BIT           CONSTRAINT [DF_AmendType_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_AmendType] PRIMARY KEY CLUSTERED ([AmendTypeId] ASC)
);

