package com.doit.dto;

public class AuctionReportDTO
{
	private int auctionReportId;           // 경매 신고 코드 (PK)
	private int reportSubmissionId;        // 신고 신청 코드 (FK)
	private int auctionId;                 // 경매 코드 (FK)

	public AuctionReportDTO() {}

	public int getAuctionReportId()
	{
		return auctionReportId;
	}

	public void setAuctionReportId(int auctionReportId)
	{
		this.auctionReportId = auctionReportId;
	}

	public int getReportSubmissionId()
	{
		return reportSubmissionId;
	}

	public void setReportSubmissionId(int reportSubmissionId)
	{
		this.reportSubmissionId = reportSubmissionId;
	}

	public int getAuctionId()
	{
		return auctionId;
	}

	public void setAuctionId(int auctionId)
	{
		this.auctionId = auctionId;
	}
}
