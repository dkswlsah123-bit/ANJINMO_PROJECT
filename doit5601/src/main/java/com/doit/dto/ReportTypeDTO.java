package com.doit.dto;

/**
 * REPORT_TYPE 테이블 매핑용 DTO
 * 신고 유형 드롭다운 표시용 (1=도배, 2=광고, 3=개인정보, 4=기타 등)
 */
public class ReportTypeDTO
{
	private int reportTypeId;      // REPORT_TYPE_ID (PK)
	private String reportTypeName; // REPORT_TYPE_NAME

	public int getReportTypeId()
	{
		return reportTypeId;
	}
	public void setReportTypeId(int reportTypeId)
	{
		this.reportTypeId = reportTypeId;
	}
	public String getReportTypeName()
	{
		return reportTypeName;
	}
	public void setReportTypeName(String reportTypeName)
	{
		this.reportTypeName = reportTypeName;
	}
}
