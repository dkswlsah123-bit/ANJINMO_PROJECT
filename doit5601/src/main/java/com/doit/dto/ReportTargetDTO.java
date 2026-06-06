package com.doit.dto;

public class ReportTargetDTO
{
	private int reportTargetId;            // 신고 대상 코드 (PK)
	private String reportTargetName;       // 신고 대상명

	public ReportTargetDTO() {}

	public int getReportTargetId()
	{
		return reportTargetId;
	}

	public void setReportTargetId(int reportTargetId)
	{
		this.reportTargetId = reportTargetId;
	}

	public String getReportTargetName()
	{
		return reportTargetName;
	}

	public void setReportTargetName(String reportTargetName)
	{
		this.reportTargetName = reportTargetName;
	}
}
