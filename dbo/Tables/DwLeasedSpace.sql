CREATE TABLE [dbo].[DwLeasedSpace] (
    [LeasedSpaceId]    INT             IDENTITY (1, 1) NOT NULL,
    [LeaseNumber]      NVARCHAR (450)  NULL,
    [FloorCode]        NVARCHAR (MAX)  NULL,
    [UnitCode]         NVARCHAR (MAX)  NULL,
    [UnitUsage]        NVARCHAR (MAX)  NULL,
    [UnitStartDate]    DATETIME2 (7)   NOT NULL,
    [UnitEndDate]      DATETIME2 (7)   NOT NULL,
    [UnitRentableArea] DECIMAL (18, 2) NOT NULL,
    [Occupied]         BIT             NOT NULL,
    [StaffCount]       INT             NOT NULL,
    [ModifiedDate]     DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_DwLeasedSpace] PRIMARY KEY CLUSTERED ([LeasedSpaceId] ASC),
    CONSTRAINT [FK_DwLeasedSpace_DwLease_LeaseNumber] FOREIGN KEY ([LeaseNumber]) REFERENCES [dbo].[DwLease] ([LeaseNumber])
);


GO
CREATE NONCLUSTERED INDEX [IX_DwLeasedSpace_LeaseNumber]
    ON [dbo].[DwLeasedSpace]([LeaseNumber] ASC);

