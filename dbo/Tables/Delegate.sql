CREATE TABLE [dbo].[Delegate] (
    [LastModified]   DATETIME2 (7) NULL,
    [ModifiedBy]     INT           NULL,
    [Deleted]        BIT           NOT NULL,
    [DelegateId]     INT           IDENTITY (1, 1) NOT NULL,
    [UserId]         INT           NOT NULL,
    [UserDelegateId] INT           NOT NULL,
    [FromDate]       DATETIME2 (7) NULL,
    [ToDate]         DATETIME2 (7) NULL,
    CONSTRAINT [PK_Delegate] PRIMARY KEY CLUSTERED ([DelegateId] ASC)
);

