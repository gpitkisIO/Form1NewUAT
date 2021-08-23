CREATE TABLE [dbo].[DwLease] (
    [LeaseNumber]       NVARCHAR (450)  NOT NULL,
    [ParentLeaseNumber] NVARCHAR (MAX)  NULL,
    [AssetNumber]       NVARCHAR (450)  NULL,
    [LeaseType]         NVARCHAR (MAX)  NULL,
    [LeaseCategory]     NVARCHAR (MAX)  NULL,
    [Tenant]            NVARCHAR (MAX)  NULL,
    [LeaseStatus]       NVARCHAR (MAX)  NULL,
    [PrimaryUsage]      NVARCHAR (MAX)  NULL,
    [RentableArea]      DECIMAL (18, 2) NOT NULL,
    [AreaMeasureUnit]   DECIMAL (18, 2) NOT NULL,
    [AnnualBaseRent]    DECIMAL (18, 2) NOT NULL,
    [TermStartDate]     DATETIME2 (7)   NOT NULL,
    [TermEndDate]       DATETIME2 (7)   NOT NULL,
    [BaseRentRate]      DECIMAL (18, 2) NOT NULL,
    [ParkingRentRate]   DECIMAL (18, 2) NOT NULL,
    [OMRate]            DECIMAL (18, 2) NOT NULL,
    [TaxRate]           DECIMAL (18, 2) NOT NULL,
    [ManagementRate]    DECIMAL (18, 2) NOT NULL,
    [NoticeDate]        DATETIME2 (7)   NOT NULL,
    [ModifiedDate]      DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_DwLease] PRIMARY KEY CLUSTERED ([LeaseNumber] ASC),
    CONSTRAINT [FK_DwLease_DwAsset_AssetNumber] FOREIGN KEY ([AssetNumber]) REFERENCES [dbo].[DwAsset] ([AssetNumber])
);


GO
CREATE NONCLUSTERED INDEX [IX_DwLease_AssetNumber]
    ON [dbo].[DwLease]([AssetNumber] ASC);

