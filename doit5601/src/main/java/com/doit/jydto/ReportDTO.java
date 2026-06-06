package com.doit.jydto;

public class ReportDTO
{
	private int reportId;          // 신고 번호 (PK, 상세페이지 이동 시 사용)
    private int userId;            // 신고자 고유 번호 (FK, 세션의 loginUser.userId와 매칭)
    private String reportType;     // 신고 종류 
    private String category;       // 신고 유형 
    private String targetName;     // 신고 대상 명칭 
    private String reportReason;   // 신고사유 (상세내용)
    private String createdAt;      // 신고 일자
    private String status;         // 처리 결과 
    private String processAt;      // 처리 일자 
    private String reportTarget;   // 신고대상구분 (상품/경매)
    private String processReason;  // 처리내용 (관리자 답변)
    
    public String getReportReason()
	{
		return reportReason;
	}
	public void setReportReason(String reportReason)
	{
		this.reportReason = reportReason;
	}
	public String getReportTarget()
	{
		return reportTarget;
	}
	public void setReportTarget(String reportTarget)
	{
		this.reportTarget = reportTarget;
	}
	public String getProcessReason()
	{
		return processReason;
	}
	public void setProcessReason(String processReason)
	{
		this.processReason = processReason;
	}
	public String getProcessedAt()
	{
		return processedAt;
	}
	public void setProcessedAt(String processedAt)
	{
		this.processedAt = processedAt;
	}
	private String processedAt;    // 처리일시
    
	public int getReportId()
	{
		return reportId;
	}
	public void setReportId(int reportId)
	{
		this.reportId = reportId;
	}
	public int getUserId()
	{
		return userId;
	}
	public void setUserId(int userId)
	{
		this.userId = userId;
	}
	public String getReportType()
	{
		return reportType;
	}
	public void setReportType(String reportType)
	{
		this.reportType = reportType;
	}
	public String getCategory()
	{
		return category;
	}
	public void setCategory(String category)
	{
		this.category = category;
	}
	public String getTargetName()
	{
		return targetName;
	}
	public void setTargetName(String targetName)
	{
		this.targetName = targetName;
	}
	public String getCreatedAt()
	{
		return createdAt;
	}
	public void setCreatedAt(String createdAt)
	{
		this.createdAt = createdAt;
	}
	public String getStatus()
	{
		return status;
	}
	public void setStatus(String status)
	{
		this.status = status;
	}
	public String getProcessAt()
	{
		return processAt;
	}
	public void setProcessAt(String processAt)
	{
		this.processAt = processAt;
	}
    
    
    
    
    
    
    
}
