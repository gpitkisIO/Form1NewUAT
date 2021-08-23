CREATE TABLE [dbo].[ioiLease] (
    [LeaseNumber]       VARCHAR (50)    NULL,
    [ParentLeaseNumber] VARCHAR (50)    NULL,
    [AssetNumber]       VARCHAR (10)    NULL,
    [LeaseType]         VARCHAR (50)    NULL,
    [LeaseCategory]     VARCHAR (50)    NULL,
    [Tenant]            VARCHAR (100)   NULL,
    [LeaseStatus]       VARCHAR (50)    NULL,
    [PrimaryUsage]      VARCHAR (50)    NULL,
    [RentableArea]      DECIMAL (9, 2)  NULL,
    [AreaMeasureUnit]   VARCHAR (10)    NULL,
    [AnnualBaseRent]    DECIMAL (13, 2) NULL,
    [TermStartDate]     DATETIME        NULL,
    [TermEndDate]       DATETIME        NULL,
    [BaseRentRate]      DECIMAL (13, 2) NULL,
    [ParkingRentRate]   DECIMAL (13, 2) NULL,
    [OMRate]            DECIMAL (13, 2) NULL,
    [TaxRate]           DECIMAL (13, 2) NULL,
    [ManagementRate]    DECIMAL (13, 2) NULL,
    [NoticeDate]        DATETIME        NULL,
    [ModifiedDate]      DATETIME        NULL
);

