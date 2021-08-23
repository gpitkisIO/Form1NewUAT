CREATE TABLE [dbo].[City] (
    [LastModified] DATETIME2 (7)  NULL,
    [ModifiedBy]   INT            NULL,
    [Deleted]      BIT            NOT NULL,
    [CityId]       INT            IDENTITY (1, 1) NOT NULL,
    [CityName]     NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED ([CityId] ASC)
);

