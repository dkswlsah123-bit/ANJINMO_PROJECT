package com.doit.dto;

import java.sql.Date;

public class ReportProcessDTO
{
	private int reportProcessId;           // 신고 처리 코드 (PK)
	private int reportSubmissionId;        // 신고 신청 코드 (FK)
	private int adminAccountId;            // 관리자 계정 번호 (FK)
	private int reportResultId;            // 신고 처리 결과 코드 (FK)
	private String processedReason;        // 처리 사유
	private Date processedAt;              // 처리 일자

	public ReportProcessDTO() {}

	public int getReportProcessId()
	{
		return reportProcessId;
	}

	public void setReportProcessId(int reportProcessId)
	{
		this.reportProcessId = reportProcessId;
	}

	public int getReportSubmissionId()
	{
		return reportSubmissionId;
	}

	public void setReportSubmissionId(int reportSubmissionId)
	{
		this.reportSubmissionId = reportSubmissionId;
	}

	public int getAdminAccountId()
	{
		return adminAccountId;
	}

	public void setAdminAccountId(int adminAccountId)
	{
		this.adminAccountId = adminAccountId;
	}

	public int getReportResultId()
	{
		return reportResultId;
	}

	public void setReportResultId(int reportResultId)
	{
		this.reportResultId = reportResultId;
	}

	public String getProcessedReason()
	{
		return processedReason;
	}

	public void setProcessedReason(String processedReason)
	{
		this.processedReason = processedReason;
	}

	public Date getProcessedAt()
	{
		return processedAt;
	}

	public void setProcessedAt(Date processedAt)
	{
		this.processedAt = processedAt;
	}
}
