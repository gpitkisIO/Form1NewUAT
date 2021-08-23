CREATE TABLE [dbo].[AmendRationale] (
    [AmendRationaleId] INT            IDENTITY (1, 1) NOT NULL,
    [Rationale]        NVARCHAR (250) NOT NULL,
    [AmendTypeId]      INT            NOT NULL,
    [LastModified]     DATETIME2 (7)  NULL,
    [ModifiedBy]       INT            NULL,
    [Deleted]          BIT            CONSTRAINT [DF_AmendRationale_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_AmendRationale] PRIMARY KEY CLUSTERED ([AmendRationaleId] ASC),
    CONSTRAINT [FK_AmendRationale_AmendType] FOREIGN KEY ([AmendTypeId]) REFERENCES [dbo].[AmendType] ([AmendTypeId])
);

