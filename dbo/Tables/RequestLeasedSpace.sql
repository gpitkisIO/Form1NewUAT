CREATE TABLE [dbo].[RequestLeasedSpace] (
    [LastModified]         DATETIME2 (7)   NULL,
    [ModifiedBy]           INT             NULL,
    [Deleted]              BIT             NOT NULL,
    [RequestLeasedSpaceId] INT             IDENTITY (1, 1) NOT NULL,
    [RequestDataId]        INT             NULL,
    [RequestOffsetDataId]  INT             NULL,
    [FloorCode]            NVARCHAR (MAX)  NULL,
    [UnitCode]             NVARCHAR (MAX)  NULL,
    [UnitRentableArea]     DECIMAL (18, 2) NOT NULL,
    CONSTRAINT [PK_RequestLeasedSpace] PRIMARY KEY CLUSTERED ([RequestLeasedSpaceId] ASC),
    CONSTRAINT [FK_RequestLeasedSpace_RequestData] FOREIGN KEY ([RequestDataId]) REFERENCES [dbo].[RequestData] ([RequestDataId]),
    CONSTRAINT [FK_RequestLeasedSpace_RequestOffsetData_RequestOffsetDataId] FOREIGN KEY ([RequestOffsetDataId]) REFERENCES [dbo].[RequestOffsetData] ([RequestOffsetDataId])
);


GO
CREATE NONCLUSTERED INDEX [IX_RequestLeasedSpace_RequestDataId]
    ON [dbo].[RequestLeasedSpace]([RequestDataId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestLeasedSpace_RequestOffsetDataId]
    ON [dbo].[RequestLeasedSpace]([RequestOffsetDataId] ASC);

