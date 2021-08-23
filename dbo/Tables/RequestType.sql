CREATE TABLE [dbo].[RequestType] (
    [LastModified]        DATETIME       NULL,
    [ModifiedBy]          INT            NULL,
    [Deleted]             BIT            CONSTRAINT [DF_RequestType_Deleted] DEFAULT ((0)) NOT NULL,
    [RequestTypeId]       INT            IDENTITY (1, 1) NOT NULL,
    [IsTransfer]          BIT            NOT NULL,
    [IsAmend]             BIT            CONSTRAINT [DF_RequestType_IsAmend] DEFAULT ((0)) NOT NULL,
    [RequirePpmVp]        BIT            NOT NULL,
    [Selectable]          BIT            NOT NULL,
    [TypeName]            NVARCHAR (MAX) NULL,
    [AmendsRequestTypeId] INT            NULL,
    CONSTRAINT [PK_RequestType] PRIMARY KEY CLUSTERED ([RequestTypeId] ASC)
);

