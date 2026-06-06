package com.doit.dto;

public class AuctionPeriodDTO
{
	private int auctionPeriodId;           // 경매 기간 코드 (PK)
	private String auctionPeriodName;      // 경매 기간명

	public AuctionPeriodDTO() {}

	public int getAuctionPeriodId()
	{
		return auctionPeriodId;
	}

	public void setAuctionPeriodId(int auctionPeriodId)
	{
		this.auctionPeriodId = auctionPeriodId;
	}

	public String getAuctionPeriodName()
	{
		return auctionPeriodName;
	}

	public void setAuctionPeriodName(String auctionPeriodName)
	{
		this.auctionPeriodName = auctionPeriodName;
	}
}
