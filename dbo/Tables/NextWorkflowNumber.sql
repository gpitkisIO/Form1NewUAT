CREATE TABLE [dbo].[NextWorkflowNumber] (
    [NextWorkflowNumberId] INT IDENTITY (1, 1) NOT NULL,
    [NextNumber]           INT NOT NULL,
    CONSTRAINT [PK_NextWorkflowNumber] PRIMARY KEY CLUSTERED ([NextWorkflowNumberId] ASC)
);

