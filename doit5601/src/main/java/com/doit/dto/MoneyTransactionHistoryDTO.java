package com.doit.dto;

import java.sql.Date;

public class MoneyTransactionHistoryDTO
{
	private int moneyId;                   // 머니 인덱스 번호 (PK)
	private int userId;                    // 회원 고유키 (FK)
	private int moneyTypeId;               // 머니 분류 코드 (FK)
	private int auctionId;                 // 경매 코드 (FK)
	private long amount;                   // 금액
	private Date createdAt;                // 등록 일자

	public MoneyTransactionHistoryDTO() {}

	public int getMoneyId()
	{
		return moneyId;
	}

	public void setMoneyId(int moneyId)
	{
		this.moneyId = moneyId;
	}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public int getMoneyTypeId()
	{
		return moneyTypeId;
	}

	public void setMoneyTypeId(int moneyTypeId)
	{
		this.moneyTypeId = moneyTypeId;
	}

	public int getAuctionId()
	{
		return auctionId;
	}

	public void setAuctionId(int auctionId)
	{
		this.auctionId = auctionId;
	}

	public long getAmount()
	{
		return amount;
	}

	public void setAmount(long amount)
	{
		this.amount = amount;
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
