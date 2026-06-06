package com.doit.dto;

public class BidActionDTO
{
	private int userId, bidResultId, amount;

	public BidActionDTO() {};
	
	public BidActionDTO(int userId, int bidResultId, int amount)
	{
		this.userId = userId;
		this.bidResultId = bidResultId;
		this.amount = amount;
	}
	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public int getBidResultId()
	{
		return bidResultId;
	}

	public void setBidResultId(int bidResultId)
	{
		this.bidResultId = bidResultId;
	}


	public int getAmount()
	{
		return amount;
	}

	public void setAmount(int amount)
	{
		this.amount = amount;
	}

}
