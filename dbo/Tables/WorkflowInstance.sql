CREATE TABLE [dbo].[WorkflowInstance] (
    [WorkflowInstanceId]               INT           IDENTITY (1, 1) NOT NULL,
    [RequestTypeId]                    INT           NOT NULL,
    [Stage]                            INT           NOT NULL,
    [DateCompleted]                    DATETIME2 (7) NULL,
    [DateCreated]                      DATETIME2 (7) NOT NULL,
    [FirstAmendingWorkflowInstanceId]  INT           NULL,
    [SecondAmendingWorkflowInstanceId] INT           NULL,
    [CancellationWorkflowInstanceId]   INT           NULL,
    [AmendTypeId]                      INT           NULL,
    [AmendedWorkflowInstanceId]        INT           NULL,
    [LiveLinkContainerId]              INT           NULL,
    [LastModified]                     DATETIME2 (7) NULL,
    [ModifiedBy]                       INT           NULL,
    [Deleted]                          BIT           NOT NULL,
    [Status]                           INT           CONSTRAINT [DF_WorkflowInstance_status] DEFAULT ((1)) NOT NULL,
    [IsCorporateRealtyRequest]         BIT           CONSTRAINT [DF_WorkflowInstance_IsCorporateRealtyRequest] DEFAULT ((0)) NOT NULL,
    [LivelinkASideFolderId]            INT           NULL,
    [LivelinkBSideFolderId]            INT           NULL,
    CONSTRAINT [PK_WorkflowInstance] PRIMARY KEY CLUSTERED ([WorkflowInstanceId] ASC),
    CONSTRAINT [FK_WorkflowInstance_RequestType_RequestTypeId] FOREIGN KEY ([RequestTypeId]) REFERENCES [dbo].[RequestType] ([RequestTypeId]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_WorkflowInstance_RequestTypeId]
    ON [dbo].[WorkflowInstance]([RequestTypeId] ASC);

