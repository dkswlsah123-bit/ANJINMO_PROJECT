package com.doit.dto;

import java.sql.Date;

public class ReportSubmissionDTO
{
	private int reportSubmissionId;        // 신고 신청 코드 (PK)
	private int userId;                    // 회원 고유키 - 신고자 (FK)
	private int reportTargetId;            // 신고 대상 코드 (FK)
	private int reportTypeId;              // 신고 유형 코드 (FK)
	private String reportReason;           // 신고 사유
	private Date createdAt;                // 신고 일자

	public ReportSubmissionDTO() {}

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

	public Date getCreatedAt()
	{
		return createdAt;
	}

	public void setCreatedAt(Date createdAt)
	{
		this.createdAt = createdAt;
	}
}
