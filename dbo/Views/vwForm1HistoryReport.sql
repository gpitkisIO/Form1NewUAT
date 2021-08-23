










CREATE VIEW [dbo].[vwForm1HistoryReport]
AS

WITH Rank_Task
AS
(
	SELECT *, RANK() OVER (PARTITION BY WorkflowInstaceId, UserId, TaskName ORDER BY TaskInstanceId DESC) AS RANK_T 
	FROM [dbo].[TaskInstance]
)

SELECT * 
FROM
(
SELECT 
	RD.Form1Id
	, RT.TypeName AS RequestType
	, NSS.SubcategoryName
	, T.TenantName AS Client
	, RD.LandBuildingNumber
	, RD.LLease
	, RD.GLease
	, RD.Region
	, RD.Address
	, RD.City
	, STC.Category AS SpaceTypeCategory
	, P_I.CommonName AS Initiator
	, WFI.DateCreated AS SubmissionDate
	, CASE WFI.Status WHEN 1 THEN 'Drafted' WHEN 2 THEN 'Initiated' WHEN 3 THEN 'Completed' WHEN 4 THEN 'Returned' WHEN 5 THEN 'Cancelled' End AS Form1Status
	, P_R.CommonName AS Reviewer
	, CASE T_R.TaskStatus WHEN 1 THEN 'Pending' WHEN 2 THEN 'Approved' WHEN 3 THEN 'Rejected' WHEN 4 THEN 'Submitted' WHEN 5 THEN 'Reviewed' End AS ReviewerStatus
	, CASE WHEN T_R.TaskStatus IN(2,3) THEN T_R.LastModified End AS ReviewerDate
	, P_CVP.CommonName AS IOClientVPApprover
	, CASE T_CVP.TaskStatus WHEN 1 THEN 'Pending' WHEN 2 THEN 'Approved' WHEN 3 THEN 'Rejected' WHEN 4 THEN 'Submitted' WHEN 5 THEN 'Reviewed' End AS IOClientVPApproverStatus
	, CASE WHEN T_CVP.TaskStatus IN(2,3) THEN T_CVP.LastModified End AS IOClientVPDate
	, P_PREM.CommonName AS IOPrem
	, CASE T_PREM.TaskStatus WHEN 1 THEN 'Pending' WHEN 2 THEN 'Approved' WHEN 3 THEN 'Rejected' WHEN 4 THEN 'Submitted' WHEN 5 THEN 'Reviewed' End AS IOPremStatus
	, CASE WHEN T_PREM.TaskStatus IN(2,3) THEN T_PREM.LastModified End AS IOPremDate
	, P_D.CommonName AS IODirector
	, CASE T_D.TaskStatus WHEN 1 THEN 'Pending' WHEN 2 THEN 'Approved' WHEN 3 THEN 'Rejected' WHEN 4 THEN 'Submitted' WHEN 5 THEN 'Reviewed' End AS IODirectorStatus
	, CASE WHEN T_D.TaskStatus IN(2,3) THEN T_D.LastModified End AS IODirectorDate
	, P_C1.CommonName AS Client1Approver
	, CASE T_C1.TaskStatus WHEN 1 THEN 'Pending' WHEN 2 THEN 'Approved' WHEN 3 THEN 'Rejected' WHEN 4 THEN 'Submitted' WHEN 5 THEN 'Reviewed' End AS Client1ApproverStatus
	, CASE WHEN T_C1.TaskStatus IN(2,3) THEN T_C1.LastModified End AS Client1ApproverDate
	, P_C2.CommonName AS Client2Approver
	, CASE T_C2.TaskStatus WHEN 1 THEN 'Pending' WHEN 2 THEN 'Approved' WHEN 3 THEN 'Rejected' WHEN 4 THEN 'Submitted' WHEN 5 THEN 'Reviewed' End AS Client2ApproverStatus
	, CASE WHEN T_C2.TaskStatus IN(2,3) THEN T_C2.LastModified End AS Client2ApproverDate
	, P_C3.CommonName AS Client3Approver
	, CASE T_C3.TaskStatus WHEN 1 THEN 'Pending' WHEN 2 THEN 'Approved' WHEN 3 THEN 'Rejected' WHEN 4 THEN 'Submitted' WHEN 5 THEN 'Reviewed' End AS Client3ApproverStatus
	, CASE WHEN T_C3.TaskStatus IN(2,3) THEN T_C3.LastModified End AS Client3ApproverDate
	, WFI.LivelinkASideFolderId AS LiveLinkFolderId
	, P_Reject.CommonName AS LastRejectionPerson
	, T_Reject.TaskName AS LastRejectionTask
	, R_RejectReason.RejectionReason AS LastRejectionReason
	, T_Reject.DateCompleted AS LastRejectionDate
	, RD.WorkflowInstanceId
FROM [dbo].[RequestData] RD
INNER JOIN [dbo].[RequestType] RT ON RD.RequestTypeId=RT.RequestTypeId
LEFT OUTER JOIN [dbo].[vwTenant] T ON T.TenantId=RD.ClientId
LEFT OUTER JOIN [dbo].[SpaceTypeCategory] STC ON RD.SpaceTypeCategoryId=STC.SpaceTypeCategoryId
LEFT OUTER JOIN Person.dbo.Persons P_I ON RD.InitiatorId = P_I.PersonID
LEFT OUTER JOIN [dbo].[WorkflowInstance] WFI ON RD.WorkflowInstanceId=WFI.WorkflowInstanceId
LEFT OUTER JOIN (SELECT *, RANK() OVER (PARTITION BY WorkflowInstaceId ORDER BY TaskInstanceId DESC) AS RANK_Reject FROM [dbo].[TaskInstance] WHERE TaskStatus=3 AND TaskName IN ('Review','IO VP Approval','PREM Approval','Realty Operation Director Approval','Client Approval')) T_Reject ON RD.WorkflowInstanceId=T_Reject.WorkflowInstaceId AND T_Reject.RANK_Reject=1
LEFT OUTER JOIN Person.dbo.Persons P_R ON RD.ReviewerId = P_R.PersonID
LEFT OUTER JOIN RANK_Task T_R ON RD.WorkflowInstanceId=T_R.WorkflowInstaceId AND T_R.TaskName='Review' AND RD.ReviewerId=T_R.UserId AND T_R.DateCreated>ISNULL(T_Reject.DateCompleted, '1/1/1900') AND T_R.RANK_T =1
LEFT OUTER JOIN Person.dbo.Persons P_CVP ON RD.IoClientVpApproverId = P_CVP.PersonID
LEFT OUTER JOIN RANK_Task T_CVP ON RD.WorkflowInstanceId=T_CVP.WorkflowInstaceId AND T_CVP.TaskName='IO VP Approval' AND RD.IoClientVpApproverId=T_CVP.UserId AND T_CVP.DateCreated>ISNULL(T_Reject.DateCompleted, '1/1/1900') AND T_CVP.RANK_T =1
LEFT OUTER JOIN Person.dbo.Persons P_PREM ON RD.PremApproverId = P_PREM.PersonID
LEFT OUTER JOIN RANK_Task T_PREM ON RD.WorkflowInstanceId=T_PREM.WorkflowInstaceId AND T_PREM.TaskName='PREM Approval' AND RD.PremApproverId=T_PREM.UserId AND T_PREM.DateCreated>ISNULL(T_Reject.DateCompleted, '1/1/1900') AND T_PREM.RANK_T =1
LEFT OUTER JOIN Person.dbo.Persons P_D ON RD.RealtyOperationDirectorApproverId = P_D.PersonID
LEFT OUTER JOIN RANK_Task T_D ON RD.WorkflowInstanceId=T_D.WorkflowInstaceId AND T_D.TaskName='Realty Operation Director Approval' AND RD.RealtyOperationDirectorApproverId=T_D.UserId AND T_D.DateCreated>ISNULL(T_Reject.DateCompleted, '1/1/1900') AND T_D.RANK_T =1
LEFT OUTER JOIN Person.dbo.Persons P_C1 ON RD.ClientApprover1Id = P_C1.PersonID
LEFT OUTER JOIN RANK_Task T_C1 ON RD.WorkflowInstanceId=T_C1.WorkflowInstaceId AND T_C1.TaskName='Client Approval' AND RD.ClientApprover1Id=T_C1.UserId AND T_C1.DateCreated>ISNULL(T_Reject.DateCompleted, '1/1/1900') AND T_C1.RANK_T =1
LEFT OUTER JOIN Person.dbo.Persons P_C2 ON RD.ClientApprover2Id = P_C2.PersonID
LEFT OUTER JOIN RANK_Task T_C2 ON RD.WorkflowInstanceId=T_C2.WorkflowInstaceId AND T_C2.TaskName='Client Approval' AND RD.ClientApprover2Id=T_C2.UserId AND T_C2.DateCreated>ISNULL(T_Reject.DateCompleted, '1/1/1900') AND T_C2.RANK_T =1
LEFT OUTER JOIN Person.dbo.Persons P_C3 ON RD.ClientApprover3Id = P_C3.PersonID
LEFT OUTER JOIN RANK_Task T_C3 ON RD.WorkflowInstanceId=T_C3.WorkflowInstaceId AND T_C3.TaskName='Client Approval' AND RD.ClientApprover3Id=T_C3.UserId AND T_C3.DateCreated>ISNULL(T_Reject.DateCompleted, '1/1/1900') AND T_C3.RANK_T =1
LEFT OUTER JOIN [dbo].[NewSpaceSubcategory] NSS ON RD.SubcategoryId=NSS.NewSpaceSubcategoryId
LEFT OUTER JOIN Person.dbo.Persons P_Reject ON T_Reject.ModifiedBy = P_Reject.PersonID
LEFT OUTER JOIN [dbo].[RequestRejectionReason] R_RejectReason ON T_Reject.TaskInstanceId=R_RejectReason.TaskInstanceId
UNION ALL
SELECT 
	RD.Form1Id
	, RT.TypeName
	, '' AS SubCategoryName
	, T.TenantName
	, RD.LandBuildingNumber
	, RD.LLease
	, RD.GLease
	, RD.Region
	, RD.Address
	, RD.City
	, STC.Category
	, P_I.CommonName AS Initiator
	, WFI.DateCreated AS SubmissionDate
	, CASE WFI.Status WHEN 1 THEN 'Drafted' WHEN 2 THEN 'Initiated' WHEN 3 THEN 'Completed' WHEN 4 THEN 'Returned' WHEN 5 THEN 'Cancelled' End AS Form1Status
	, P_R.CommonName AS Reviewer
	, CASE T_R.TaskStatus WHEN 1 THEN 'Pending' WHEN 2 THEN 'Approved' WHEN 3 THEN 'Rejected' WHEN 4 THEN 'Submitted' WHEN 5 THEN 'Reviewed' End AS ReviewerStatus
	, CASE WHEN T_R.TaskStatus IN(2,3) THEN T_R.LastModified End AS ReviewerDate
	, P_CVP.CommonName AS IOClientVPApprover
	, CASE T_CVP.TaskStatus WHEN 1 THEN 'Pending' WHEN 2 THEN 'Approved' WHEN 3 THEN 'Rejected' WHEN 4 THEN 'Submitted' WHEN 5 THEN 'Reviewed' End AS IOClientVPApproverStatus
	, CASE WHEN T_CVP.TaskStatus IN(2,3) THEN T_CVP.LastModified End AS IOClientVPDate
	, P_PREM.CommonName AS IOPrem
	, CASE T_PREM.TaskStatus WHEN 1 THEN 'Pending' WHEN 2 THEN 'Approved' WHEN 3 THEN 'Rejected' WHEN 4 THEN 'Submitted' WHEN 5 THEN 'Reviewed' End AS IOPremStatus
	, CASE WHEN T_PREM.TaskStatus IN(2,3) THEN T_PREM.LastModified End AS IOPremDate
	, P_D.CommonName AS IODirector
	, CASE T_D.TaskStatus WHEN 1 THEN 'Pending' WHEN 2 THEN 'Approved' WHEN 3 THEN 'Rejected' WHEN 4 THEN 'Submitted' WHEN 5 THEN 'Reviewed' End AS IODirectorStatus
	, CASE WHEN T_D.TaskStatus IN(2,3) THEN T_D.LastModified End AS IODirectorDate
	, P_C1.CommonName AS Client1Approver
	, CASE T_C1.TaskStatus WHEN 1 THEN 'Pending' WHEN 2 THEN 'Approved' WHEN 3 THEN 'Rejected' WHEN 4 THEN 'Submitted' WHEN 5 THEN 'Reviewed' End AS Client1ApproverStatus
	, CASE WHEN T_C1.TaskStatus IN(2,3) THEN T_C1.LastModified End AS Client1ApproverDate
	, P_C2.CommonName AS Client2Approver
	, CASE T_C2.TaskStatus WHEN 1 THEN 'Pending' WHEN 2 THEN 'Approved' WHEN 3 THEN 'Rejected' WHEN 4 THEN 'Submitted' WHEN 5 THEN 'Reviewed' End AS Client2ApproverStatus
	, CASE WHEN T_C2.TaskStatus IN(2,3) THEN T_C2.LastModified End AS Client2ApproverDate
	, P_C3.CommonName AS Client3Approver
	, CASE T_C3.TaskStatus WHEN 1 THEN 'Pending' WHEN 2 THEN 'Approved' WHEN 3 THEN 'Rejected' WHEN 4 THEN 'Submitted' WHEN 5 THEN 'Reviewed' End AS Client3ApproverStatus
	, CASE WHEN T_C3.TaskStatus IN(2,3) THEN T_C3.LastModified End AS Client3ApproverDate
	, WFI.LivelinkBSideFolderId AS LiveLinkFolderId
	, P_Reject.CommonName AS LastRejectionPerson
	, T_Reject.TaskName AS LastRejectionTask
	, R_RejectReason.RejectionReason AS LastRejectionReason
	, T_Reject.DateCompleted AS LastRejectionDate
	, RD.WorkflowInstanceId
FROM [dbo].[RequestOffsetData] RD
INNER JOIN [dbo].[RequestData] R ON RD.RequestDataId=R.RequestDataId
INNER JOIN [dbo].[RequestType] RT ON RD.RequestTypeId=RT.RequestTypeId
LEFT OUTER JOIN [dbo].[vwTenant] T ON RD.ClientReceivingSpaceId=T.TenantId
LEFT OUTER JOIN [dbo].[SpaceTypeCategory] STC ON RD.SpaceTypeCategoryId=STC.SpaceTypeCategoryId
LEFT OUTER JOIN Person.dbo.Persons P_I ON RD.InitiatorId = P_I.PersonID
LEFT OUTER JOIN [dbo].[WorkflowInstance] WFI ON R.WorkflowInstanceId=WFI.WorkflowInstanceId
LEFT OUTER JOIN (SELECT *, RANK() OVER (PARTITION BY WorkflowInstaceId ORDER BY TaskInstanceId DESC) AS RANK_Reject FROM [dbo].[TaskInstance] WHERE TaskStatus=3 AND TaskName IN ('IO VP Approval Offset','Realty Operation Director Approval Offset','Client Approval Offset')) T_Reject ON R.WorkflowInstanceId=T_Reject.WorkflowInstaceId AND T_Reject.RANK_Reject=1
LEFT OUTER JOIN Person.dbo.Persons P_R ON RD.ReviewerId = P_R.PersonID
LEFT OUTER JOIN RANK_Task T_R ON RD.WorkflowInstanceId=T_R.WorkflowInstaceId AND T_R.TaskName='Review Offset' AND RD.ReviewerId=T_R.UserId AND T_R.DateCreated>ISNULL(T_Reject.DateCompleted, '1/1/1900') AND T_R.RANK_T =1
LEFT OUTER JOIN Person.dbo.Persons P_CVP ON RD.IoClientVpApproverId = P_CVP.PersonID
LEFT OUTER JOIN RANK_Task T_CVP ON RD.WorkflowInstanceId=T_CVP.WorkflowInstaceId AND T_CVP.TaskName='IO VP Approval Offset' AND RD.ClientApprover1Id=T_CVP.UserId AND T_CVP.DateCreated>ISNULL(T_Reject.DateCompleted, '1/1/1900') AND T_CVP.RANK_T =1
LEFT OUTER JOIN Person.dbo.Persons P_PREM ON RD.PremApproverId = P_PREM.PersonID
LEFT OUTER JOIN RANK_Task T_PREM ON RD.WorkflowInstanceId=T_PREM.WorkflowInstaceId AND T_PREM.TaskName='PREM Approval Offset' AND RD.PremApproverId=T_PREM.UserId AND T_PREM.DateCreated>ISNULL(T_Reject.DateCompleted, '1/1/1900') AND T_PREM.RANK_T =1
LEFT OUTER JOIN Person.dbo.Persons P_D ON RD.RealtyOperationDirectorApproverId = P_D.PersonID
LEFT OUTER JOIN RANK_Task T_D ON RD.WorkflowInstanceId=T_D.WorkflowInstaceId AND T_D.TaskName='Realty Operation Director Approval Offset' AND RD.RealtyOperationDirectorApproverId=T_D.UserId AND T_D.DateCreated>ISNULL(T_Reject.DateCompleted, '1/1/1900') AND T_D.RANK_T =1
LEFT OUTER JOIN Person.dbo.Persons P_C1 ON RD.ClientApprover1Id = P_C1.PersonID
LEFT OUTER JOIN RANK_Task T_C1 ON RD.WorkflowInstanceId=T_C1.WorkflowInstaceId AND T_C1.TaskName='Client Approval Offset' AND RD.ClientApprover1Id=T_C1.UserId AND T_C1.DateCreated>ISNULL(T_Reject.DateCompleted, '1/1/1900') AND T_C1.RANK_T =1
LEFT OUTER JOIN Person.dbo.Persons P_C2 ON RD.ClientApprover2Id = P_C2.PersonID
LEFT OUTER JOIN RANK_Task T_C2 ON RD.WorkflowInstanceId=T_C2.WorkflowInstaceId AND T_C2.TaskName='Client Approval Offset' AND RD.ClientApprover2Id=T_C2.UserId AND T_C2.DateCreated>ISNULL(T_Reject.DateCompleted, '1/1/1900') AND T_C2.RANK_T =1
LEFT OUTER JOIN Person.dbo.Persons P_C3 ON RD.ClientApprover3Id = P_C3.PersonID
LEFT OUTER JOIN RANK_Task T_C3 ON RD.WorkflowInstanceId=T_C3.WorkflowInstaceId AND T_C3.TaskName='Client Approval Offset' AND RD.ClientApprover3Id=T_C3.UserId AND T_C3.DateCreated>ISNULL(T_Reject.DateCompleted, '1/1/1900') AND T_C3.RANK_T =1
LEFT OUTER JOIN Person.dbo.Persons P_Reject ON T_Reject.ModifiedBy = P_Reject.PersonID
LEFT OUTER JOIN [dbo].[RequestRejectionReason] R_RejectReason ON T_Reject.TaskInstanceId=R_RejectReason.TaskInstanceId
) A





