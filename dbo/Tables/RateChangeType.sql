CREATE TABLE [dbo].[RateChangeType] (
    [RateChangeTypeId]   INT           IDENTITY (1, 1) NOT NULL,
    [RateChangeTypeName] NVARCHAR (50) NOT NULL,
    [LastModified]       DATETIME      NULL,
    [ModifiedBy]         INT           NULL,
    [Deleted]            BIT           CONSTRAINT [DF_RateChangeType_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_RateChangeType] PRIMARY KEY CLUSTERED ([RateChangeTypeId] ASC)
);

