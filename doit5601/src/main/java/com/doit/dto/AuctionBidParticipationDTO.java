package com.doit.dto;

import java.sql.Timestamp;

public class AuctionBidParticipationDTO
{
	private int bidId;                     // 입찰 코드 (PK)
	private int userId;                    // 회원 고유키 (FK)
	private int auctionId;                 // 경매 코드 (FK)
	private Timestamp bidTime;             // 입찰 시간
	private long bidPrice;                 // 입찰가

	public AuctionBidParticipationDTO() {}

	public int getBidId()
	{
		return bidId;
	}

	public void setBidId(int bidId)
	{
		this.bidId = bidId;
	}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public int getAuctionId()
	{
		return auctionId;
	}

	public void setAuctionId(int auctionId)
	{
		this.auctionId = auctionId;
	}

	public Timestamp getBidTime()
	{
		return bidTime;
	}

	public void setBidTime(Timestamp bidTime)
	{
		this.bidTime = bidTime;
	}

	public long getBidPrice()
	{
		return bidPrice;
	}

	public void setBidPrice(long bidPrice)
	{
		this.bidPrice = bidPrice;
	}
}
