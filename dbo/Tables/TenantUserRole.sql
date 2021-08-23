CREATE TABLE [dbo].[TenantUserRole] (
    [LastModified]                   DATETIME2 (7) NULL,
    [ModifiedBy]                     INT           NULL,
    [Deleted]                        BIT           NOT NULL,
    [UserId]                         INT           NOT NULL,
    [TenantId]                       INT           NOT NULL,
    [CSM]                            BIT           CONSTRAINT [DF_TenantUserRole_CSM] DEFAULT ((0)) NOT NULL,
    [Reviewer]                       BIT           CONSTRAINT [DF_TenantUserRole_Reviewer] DEFAULT ((0)) NOT NULL,
    [IOClientVP]                     BIT           CONSTRAINT [DF_TenantUserRole_IOClientVP] DEFAULT ((0)) NOT NULL,
    [PREM]                           BIT           CONSTRAINT [DF_TenantUserRole_PREM] DEFAULT ((0)) NOT NULL,
    [RealtyOperationDirector]        BIT           CONSTRAINT [DF_TenantUserRole_RealtyOperationDirector] DEFAULT ((0)) NOT NULL,
    [SpecialAdvisor]                 BIT           CONSTRAINT [DF_TenantUserRole_SpecialAdvisor] DEFAULT ((0)) NOT NULL,
    [ClientApprover]                 BIT           CONSTRAINT [DF_TenantUserRole_ClientApprover] DEFAULT ((0)) NOT NULL,
    [DefaultCSM]                     BIT           CONSTRAINT [DF_TenantUserRole_DefaultCSM] DEFAULT ((0)) NOT NULL,
    [DefaultReviewer]                BIT           CONSTRAINT [DF_TenantUserRole_DefaultReviewer] DEFAULT ((0)) NOT NULL,
    [DefaultIOClientVP]              BIT           CONSTRAINT [DF_TenantUserRole_DefaultIOClientVP] DEFAULT ((0)) NOT NULL,
    [DefaultPREM]                    BIT           CONSTRAINT [DF_TenantUserRole_DefaultPREM] DEFAULT ((0)) NOT NULL,
    [DefaultRealtyOperationDirector] BIT           CONSTRAINT [DF_TenantUserRole_DefaultRealtyOpeationDirector] DEFAULT ((0)) NOT NULL,
    [DefaultSpecialAdvisor]          BIT           CONSTRAINT [DF_TenantUserRole_DefaultSpecialAdvisor] DEFAULT ((0)) NOT NULL,
    [DefaultClientApprover1]         BIT           CONSTRAINT [DF_TenantUserRole_DefaultClientApprover1] DEFAULT ((0)) NOT NULL,
    [DefaultClientApprover2]         BIT           CONSTRAINT [DF_TenantUserRole_DefaultClientApprover2] DEFAULT ((0)) NOT NULL,
    [DefaultClientApprover3]         BIT           CONSTRAINT [DF_TenantUserRole_DefaultClientApprover3] DEFAULT ((0)) NOT NULL,
    [FinalClientEmailRecipient]      BIT           CONSTRAINT [DF_TenantUserRole_FinalClientEmailRecipient] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_TenantUserRole] PRIMARY KEY CLUSTERED ([UserId] ASC, [TenantId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TenantUserRole_TenantId]
    ON [dbo].[TenantUserRole]([TenantId] ASC);

