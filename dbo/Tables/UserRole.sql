CREATE TABLE [dbo].[UserRole] (
    [LastModified] DATETIME2 (7) NULL,
    [ModifiedBy]   INT           NULL,
    [Deleted]      BIT           NOT NULL,
    [UserId]       INT           NOT NULL,
    [RoleId]       INT           NOT NULL,
    CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC),
    CONSTRAINT [FK_UserRole_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([RoleId]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_UserRole_RoleId]
    ON [dbo].[UserRole]([RoleId] ASC);

