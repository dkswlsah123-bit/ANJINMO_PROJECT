package com.doit.dto;

public class ReportDTO
{
	private int reportSubmissionId; // REPORT_SUBMISSION_ID (PK)
	private int userId; // USER_ID (신고자, FK)
	private int reportTargetId; // REPORT_TARGET_ID (1=상품, 2=경매)
	private int reportTypeId; // REPORT_TYPE_ID (1=도배, 2=광고, 3=개인정보, 4=기타)
	private String reportReason; // REPORT_REASON
	private String createdAt; // CREATED_AT

	private int productReportId; // PRODUCT_REPORT_ID (상품 신고 PK)
	private int productId; // PRODUCT_ID (상품 신고 대상)
	private int auctionReportId; // AUCTION_REPORT_ID (경매 신고 PK)
	private int auctionId; // AUCTION_ID (경매 신고 대상)

	private String reportTargetName; // REPORT_TARGET_NAME (상품/경매)
	private String reportTypeName; // REPORT_TYPE_NAME (도배/ 광고 등)
	private String userName; // 신고자명
	private String categoryName; // 뷰 카테고리 (상품/경매/기타)
	private String targetName; // 신고 대상명 (상품명 or 경매제목)
	private int targetId; // 신고 대상 코드 (PRODUCT_ID or AUCTION_ID)

	// REPORT_PROCESS / REPORT_RESULT (관리자)
	private int reportProcessId; // REPORT_PROCESS_ID (PK)
	private int reportResultId; // REPORT_RESULT_ID (FK)
	private String reportResultName; // REPORT_RESULT_NAME ('승인'/'반려' 등)
	private String processReason; // PROCESS_REASON (처리 내용)
	private String processedAt; // PROCESSED_AT (처리 일시)
	private int adminAccountId; // ADMIN_ACCOUNT_ID
	private String adminLoginId; // ADMIN_LOGIN_ID (담당 관리자)

	public int getReportSubmissionId()
	{
		return reportSubmissionId;
	}

	public void setReportSubmissionId(int reportSubmissionId)
	{
		this.reportSubmissionId = reportSubmissionId;
	}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public int getReportTargetId()
	{
		return reportTargetId;
	}

	public void setReportTargetId(int reportTargetId)
	{
		this.reportTargetId = reportTargetId;
	}

	public int getReportTypeId()
	{
		return reportTypeId;
	}

	public void setReportTypeId(int reportTypeId)
	{
		this.reportTypeId = reportTypeId;
	}

	public String getReportReason()
	{
		return reportReason;
	}

	public void setReportReason(String reportReason)
	{
		this.reportReason = reportReason;
	}

	public String getCreatedAt()
	{
		return createdAt;
	}

	public void setCreatedAt(String createdAt)
	{
		this.createdAt = createdAt;
	}

	// ── PRODUCT_REPORT / AUCTION_REPORT ──
	public int getProductReportId()
	{
		return productReportId;
	}

	public void setProductReportId(int productReportId)
	{
		this.productReportId = productReportId;
	}

	public int getProductId()
	{
		return productId;
	}

	public void setProductId(int productId)
	{
		this.productId = productId;
	}

	public int getAuctionReportId()
	{
		return auctionReportId;
	}

	public void setAuctionReportId(int auctionReportId)
	{
		this.auctionReportId = auctionReportId;
	}

	public int getAuctionId()
	{
		return auctionId;
	}

	public void setAuctionId(int auctionId)
	{
		this.auctionId = auctionId;
	}

	public String getReportTargetName()
	{
		return reportTargetName;
	}

	public void setReportTargetName(String reportTargetName)
	{
		this.reportTargetName = reportTargetName;
	}

	public String getReportTypeName()
	{
		return reportTypeName;
	}

	public void setReportTypeName(String reportTypeName)
	{
		this.reportTypeName = reportTypeName;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getCategoryName()
	{
		return categoryName;
	}

	public void setCategoryName(String categoryName)
	{
		this.categoryName = categoryName;
	}

	public String getTargetName()
	{
		return targetName;
	}

	public void setTargetName(String targetName)
	{
		this.targetName = targetName;
	}

	public int getTargetId()
	{
		return targetId;
	}

	public void setTargetId(int targetId)
	{
		this.targetId = targetId;
	}

	// ── REPORT_PROCESS / REPORT_RESULT ──
	public int getReportProcessId()
	{
		return reportProcessId;
	}

	public void setReportProcessId(int reportProcessId)
	{
		this.reportProcessId = reportProcessId;
	}

	public int getReportResultId()
	{
		return reportResultId;
	}

	public void setReportResultId(int reportResultId)
	{
		this.reportResultId = reportResultId;
	}

	public String getReportResultName()
	{
		return reportResultName;
	}

	public void setReportResultName(String reportResultName)
	{
		this.reportResultName = reportResultName;
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

	public int getAdminAccountId()
	{
		return adminAccountId;
	}

	public void setAdminAccountId(int adminAccountId)
	{
		this.adminAccountId = adminAccountId;
	}

	public String getAdminLoginId()
	{
		return adminLoginId;
	}

	public void setAdminLoginId(String adminLoginId)
	{
		this.adminLoginId = adminLoginId;
	}
}
