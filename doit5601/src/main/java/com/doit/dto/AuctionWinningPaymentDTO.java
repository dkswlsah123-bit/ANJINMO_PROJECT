package com.doit.dto;

import java.sql.Date;

public class AuctionWinningPaymentDTO
{
	private int paymentId;                 // 낙찰 입금 코드 (PK)
	private int bidResultId;               // 낙찰 결과 코드 (FK)
	private int moneyId;                   // 머니 인덱스 번호 (FK)
	private Date createdAt;                // 등록 일시

	public AuctionWinningPaymentDTO() {}

	public int getPaymentId()
	{
		return paymentId;
	}

	public void setPaymentId(int paymentId)
	{
		this.paymentId = paymentId;
	}

	public int getBidResultId()
	{
		return bidResultId;
	}

	public void setBidResultId(int bidResultId)
	{
		this.bidResultId = bidResultId;
	}

	public int getMoneyId()
	{
		return moneyId;
	}

	public void setMoneyId(int moneyId)
	{
		this.moneyId = moneyId;
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
