package com.doit.dto;

import java.sql.Date;

public class BidFailureHistoryDTO
{
	private int bidFailHistoryId;          // 낙찰 실패 이력 코드 (PK)
	private int bidResultId;               // 낙찰 결과 코드 (FK)
	private int bidFailTypeId;             // 낙찰 실패 유형 코드 (FK)
	private Date createdAt;                // 등록 일자

	public BidFailureHistoryDTO() {}

	public int getBidFailHistoryId()
	{
		return bidFailHistoryId;
	}

	public void setBidFailHistoryId(int bidFailHistoryId)
	{
		this.bidFailHistoryId = bidFailHistoryId;
	}

	public int getBidResultId()
	{
		return bidResultId;
	}

	public void setBidResultId(int bidResultId)
	{
		this.bidResultId = bidResultId;
	}

	public int getBidFailTypeId()
	{
		return bidFailTypeId;
	}

	public void setBidFailTypeId(int bidFailTypeId)
	{
		this.bidFailTypeId = bidFailTypeId;
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
