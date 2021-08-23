CREATE TABLE [dbo].[BomaStandard] (
    [BomaStandardId]   INT          IDENTITY (1, 1) NOT NULL,
    [BomaStandardName] VARCHAR (50) NOT NULL,
    [IsInFromList]     BIT          CONSTRAINT [DF_BomaStandard_From] DEFAULT ((0)) NOT NULL,
    [IsInToList]       BIT          CONSTRAINT [DF_BomaStandard_ToBoma] DEFAULT ((1)) NOT NULL,
    [LastModified]     DATETIME     NULL,
    [ModifiedBy]       INT          NULL,
    [Deleted]          BIT          CONSTRAINT [DF_BomaStandard_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_BomaStandard] PRIMARY KEY CLUSTERED ([BomaStandardId] ASC)
);

