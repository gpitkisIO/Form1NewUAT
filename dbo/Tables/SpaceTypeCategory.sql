CREATE TABLE [dbo].[SpaceTypeCategory] (
    [SpaceTypeCategoryId] INT            IDENTITY (1, 1) NOT NULL,
    [Category]            NVARCHAR (MAX) NULL,
    [LastModified]        DATETIME2 (7)  NULL,
    [ModifiedBy]          INT            NULL,
    [Deleted]             BIT            CONSTRAINT [DF_SpaceTypeCategory_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_SpaceTypeCategory] PRIMARY KEY CLUSTERED ([SpaceTypeCategoryId] ASC)
);

