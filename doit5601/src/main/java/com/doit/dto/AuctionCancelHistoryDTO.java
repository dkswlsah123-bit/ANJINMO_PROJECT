package com.doit.dto;

import java.sql.Date;

public class AuctionCancelHistoryDTO
{
	private int auctionCancelId;           // 경매 취소 코드 (PK)
	private int auctionId;                 // 경매 코드 (FK)
	private String cancelReason;           // 취소 사유
	private Date cancelAt;                 // 취소 일자

	public AuctionCancelHistoryDTO() {}

	public int getAuctionCancelId()
	{
		return auctionCancelId;
	}

	public void setAuctionCancelId(int auctionCancelId)
	{
		this.auctionCancelId = auctionCancelId;
	}

	public int getAuctionId()
	{
		return auctionId;
	}

	public void setAuctionId(int auctionId)
	{
		this.auctionId = auctionId;
	}

	public String getCancelReason()
	{
		return cancelReason;
	}

	public void setCancelReason(String cancelReason)
	{
		this.cancelReason = cancelReason;
	}

	public Date getCancelAt()
	{
		return cancelAt;
	}

	public void setCancelAt(Date cancelAt)
	{
		this.cancelAt = cancelAt;
	}
}
