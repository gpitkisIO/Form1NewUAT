CREATE TABLE [dbo].[RequestTypeQuestion] (
    [LastModified]                  DATETIME2 (7)  NULL,
    [ModifiedBy]                    INT            NULL,
    [Deleted]                       BIT            NOT NULL,
    [RequestTypeId]                 INT            NOT NULL,
    [ChecklistQuestionId]           INT            NOT NULL,
    [ShowOnMainForm]                BIT            CONSTRAINT [DF_RequestTypeQuestion_ShowOnMainForm] DEFAULT ((0)) NOT NULL,
    [ShowOnOffsetForm]              BIT            CONSTRAINT [DF_RequestTypeQuestion_ShowOnOffsetForm] DEFAULT ((0)) NOT NULL,
    [ShowOnInterviewForm]           BIT            CONSTRAINT [DF_RequestTypeQuestion_ShowOnInterviewForm] DEFAULT ((0)) NOT NULL,
    [OrderOnMainForm]               INT            CONSTRAINT [DF_RequestTypeQuestion_OrderOnMainForm] DEFAULT ((0)) NOT NULL,
    [OrderOnOffsetForm]             INT            CONSTRAINT [DF_RequestTypeQuestion_OrderOnOffsetForm] DEFAULT ((0)) NOT NULL,
    [OrderOnInterviewForm]          INT            CONSTRAINT [DF_RequestTypeQuestion_OrderOnInterviewForm] DEFAULT ((0)) NOT NULL,
    [IsRequiredOnMainForm]          BIT            CONSTRAINT [DF_RequestTypeQuestion_IsRequiredOnMainForm] DEFAULT ((0)) NOT NULL,
    [IsRequiredOnOffsetForm]        BIT            CONSTRAINT [DF_RequestTypeQuestion_IsRequiredOnOffsetForm] DEFAULT ((0)) NOT NULL,
    [IsRequiredOnInterviewForm]     BIT            CONSTRAINT [DF_RequestTypeQuestion_IsRequiredOnInterviewForm] DEFAULT ((0)) NOT NULL,
    [DefaultAnswerOnMainForm]       INT            CONSTRAINT [DF__RequestTy__Defau__31EC6D26] DEFAULT ((3)) NOT NULL,
    [DefaultAnswerOnOffsetForm]     INT            CONSTRAINT [DF__RequestTy__Defau__32E0915F] DEFAULT ((3)) NOT NULL,
    [DefaultAnswerOnInterviewForm]  INT            CONSTRAINT [DF_RequestTypeQuestion_DefaultAnswerOnInterviewForm] DEFAULT ((3)) NOT NULL,
    [DefaultCommentOnMainForm]      NVARCHAR (MAX) NULL,
    [DefaultCommentOnOffsetForm]    NVARCHAR (MAX) NULL,
    [DefaultCommnetOnInterviewForm] NVARCHAR (MAX) NULL,
    [IsReadonlyOnMainForm]          BIT            CONSTRAINT [DF_RequestTypeQuestion_IsReadonlyOnMainForm] DEFAULT ((0)) NOT NULL,
    [IsReadonlyOnOffsetForm]        BIT            CONSTRAINT [DF_RequestTypeQuestion_IsReadonlyOnOffsetForm] DEFAULT ((0)) NOT NULL,
    [IsReadonlyMyInterviewForm]     BIT            CONSTRAINT [DF_RequestTypeQuestion_IsReadonlyMyInterviewForm] DEFAULT ((0)) NOT NULL,
    [ShowLogicOnMainForm]           NVARCHAR (MAX) NULL,
    [ShowLogicOnOffsetForm]         NVARCHAR (MAX) NULL,
    [ShowLogicOnInterviewForm]      NVARCHAR (MAX) NULL,
    [ShowFormlogicOnMainForm]       NVARCHAR (MAX) NULL,
    [ShowFormLogicOnOffsetForm]     NVARCHAR (MAX) NULL,
    [ShowFormLogicOnInterviewForm]  NVARCHAR (MAX) NULL,
    [SectionOnMainForm]             INT            CONSTRAINT [DF_RequestTypeQuestion_SectionOnMainForm] DEFAULT ((3)) NOT NULL,
    [SectionOnOffsetForm]           INT            CONSTRAINT [DF_RequestTypeQuestion_SectionOnOffsetForm] DEFAULT ((3)) NOT NULL,
    [SectionOnInterviewForm]        INT            CONSTRAINT [DF_RequestTypeQuestion_SectionOnInterviewForm] DEFAULT ((3)) NOT NULL,
    [canDelete]                     BIT            CONSTRAINT [DF__RequestTy__canDe__17036CC0] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_RequestTypeQuestion] PRIMARY KEY CLUSTERED ([RequestTypeId] ASC, [ChecklistQuestionId] ASC),
    CONSTRAINT [FK_RequestTypeQuestion_ChecklistQuestion_ChecklistQuestionId] FOREIGN KEY ([ChecklistQuestionId]) REFERENCES [dbo].[ChecklistQuestion] ([ChecklistQuestionId]) ON DELETE CASCADE,
    CONSTRAINT [FK_RequestTypeQuestion_RequestType_RequestTypeId] FOREIGN KEY ([RequestTypeId]) REFERENCES [dbo].[RequestType] ([RequestTypeId]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_RequestTypeQuestion_ChecklistQuestionId]
    ON [dbo].[RequestTypeQuestion]([ChecklistQuestionId] ASC);

