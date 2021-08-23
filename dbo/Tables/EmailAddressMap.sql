CREATE TABLE [dbo].[EmailAddressMap] (
    [EmailMapId]       INT            IDENTITY (1, 1) NOT NULL,
    [FromEmailAddress] NVARCHAR (250) NOT NULL,
    [ToEmailAddress]   NCHAR (250)    NOT NULL,
    [LastModified]     DATETIME       NULL,
    [ModifiedBy]       INT            NULL,
    [Deleted]          BIT            CONSTRAINT [DF_EmailAddressMap_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_EmailAddressMap] PRIMARY KEY CLUSTERED ([EmailMapId] ASC)
);

