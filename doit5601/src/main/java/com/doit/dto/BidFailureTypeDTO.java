package com.doit.dto;

public class BidFailureTypeDTO
{
	private int bidFailTypeId;             // 낙찰 실패 유형 코드 (PK)
	private String bidFailTypeName;        // 낙찰 실패 유형명

	public BidFailureTypeDTO() {}

	public int getBidFailTypeId()
	{
		return bidFailTypeId;
	}

	public void setBidFailTypeId(int bidFailTypeId)
	{
		this.bidFailTypeId = bidFailTypeId;
	}

	public String getBidFailTypeName()
	{
		return bidFailTypeName;
	}

	public void setBidFailTypeName(String bidFailTypeName)
	{
		this.bidFailTypeName = bidFailTypeName;
	}
}
