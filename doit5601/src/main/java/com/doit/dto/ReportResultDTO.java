package com.doit.dto;

public class ReportResultDTO
{
	private int reportResultId;            // 신고 처리 결과 코드 (PK)
	private String reportResultName;       // 신고 처리 결과명

	public ReportResultDTO() {}

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
}
