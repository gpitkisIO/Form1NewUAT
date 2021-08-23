CREATE TABLE [dbo].[Roles] (
    [LastModified]                      DATETIME2 (7)  NULL,
    [ModifiedBy]                        INT            NULL,
    [Deleted]                           BIT            NOT NULL,
    [RoleId]                            INT            IDENTITY (1, 1) NOT NULL,
    [RoleName]                          NVARCHAR (MAX) NULL,
    [CanEditEmails]                     BIT            NOT NULL,
    [CanEditEmailSchedules]             BIT            NOT NULL,
    [CanEditConsiderationQuestions]     BIT            NOT NULL,
    [CanEditConsiderationQuestionLogic] BIT            CONSTRAINT [DF_Roles_CanEditConsiderationQuestionLogic] DEFAULT ((0)) NOT NULL,
    [CanEditUserRoles]                  BIT            CONSTRAINT [DF_Roles_CanEditUserRoles] DEFAULT ((0)) NOT NULL,
    [CanAssignApplicationRoles]         BIT            CONSTRAINT [DF_Roles_CanAssignApplicationRoles] DEFAULT ((0)) NOT NULL,
    [CanAssignWorkflowRoles]            BIT            CONSTRAINT [DF_Roles_CanAssignWorkflowRoles] DEFAULT ((0)) NOT NULL,
    [CanEditDelegates]                  BIT            CONSTRAINT [DF_Roles_CanEditDelegates] DEFAULT ((0)) NOT NULL,
    [CanSeeAllRequests]                 BIT            DEFAULT ((0)) NOT NULL,
    [CanSeeAllWorkflowPages]            BIT            DEFAULT ((0)) NOT NULL,
    [CanSeeFileDownloadPage]            BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([RoleId] ASC)
);

