package com.doit.dto;

import java.sql.Date;

public class AuctionWinningResultDTO
{
	private int bidResultId;               // 낙찰 결과 코드 (PK)
	private int bidId;                     // 입찰 코드 (FK)
	private Date createdAt;                // 등록 일시

	public AuctionWinningResultDTO() {}

	public int getBidResultId()
	{
		return bidResultId;
	}

	public void setBidResultId(int bidResultId)
	{
		this.bidResultId = bidResultId;
	}

	public int getBidId()
	{
		return bidId;
	}

	public void setBidId(int bidId)
	{
		this.bidId = bidId;
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
