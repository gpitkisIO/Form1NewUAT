CREATE TABLE [dbo].[ioiLeasedSpace] (
    [LeasedSpaceID]    INT            NOT NULL,
    [LeaseNumber]      VARCHAR (50)   NOT NULL,
    [FloorCode]        VARCHAR (20)   NULL,
    [UnitCode]         VARCHAR (20)   NULL,
    [UnitUsage]        VARCHAR (50)   NULL,
    [UnitStartDate]    DATETIME       NULL,
    [UnitEndDate]      DATETIME       NULL,
    [UnitRentableArea] DECIMAL (9, 2) NULL,
    [Occupied]         VARCHAR (10)   NULL,
    [StaffCount]       INT            NULL,
    [ModifiedDate]     DATETIME       NULL
);

