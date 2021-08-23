ALTER ROLE [db_owner] ADD MEMBER [IO\SVCSS_IOQSQL10];


GO
ALTER ROLE [db_owner] ADD MEMBER [io\pbreen];


GO
ALTER ROLE [db_datareader] ADD MEMBER [DARTSUser];


GO
ALTER ROLE [db_datareader] ADD MEMBER [Form1User];


GO
ALTER ROLE [db_datareader] ADD MEMBER [io\pbreen];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [Form1User];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [io\pbreen];

