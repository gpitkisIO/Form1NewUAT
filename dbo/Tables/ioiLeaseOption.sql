CREATE TABLE [dbo].[ioiLeaseOption] (
    [LeaseOptionID]      INT            NOT NULL,
    [LeaseNumber]        VARCHAR (50)   NOT NULL,
    [OptionType]         VARCHAR (50)   NULL,
    [OptionStatus]       VARCHAR (50)   NULL,
    [Active]             BIT            NULL,
    [EffectiveStartDate] DATETIME       NULL,
    [EffectiveEndDate]   DATETIME       NULL,
    [NoticeStartDate]    DATETIME       NULL,
    [NoticeEndDate]      DATETIME       NULL,
    [Comment]            VARCHAR (4000) NULL,
    [ModifiedDate]       DATETIME       NULL
);

