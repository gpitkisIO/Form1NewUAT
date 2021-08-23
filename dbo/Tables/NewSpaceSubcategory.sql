CREATE TABLE [dbo].[NewSpaceSubcategory] (
    [NewSpaceSubcategoryId] INT           IDENTITY (1, 1) NOT NULL,
    [SubcategoryName]       NVARCHAR (50) NOT NULL,
    [LastModified]          DATETIME      NULL,
    [ModifiedBy]            INT           NULL,
    [Deleted]               BIT           CONSTRAINT [DF_NewSpaceSubcategory_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_NewSpaceSubcategory] PRIMARY KEY CLUSTERED ([NewSpaceSubcategoryId] ASC)
);

