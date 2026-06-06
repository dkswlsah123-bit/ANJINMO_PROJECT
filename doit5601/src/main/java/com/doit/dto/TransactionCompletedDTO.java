package com.doit.dto;

import java.sql.Date;

public class TransactionCompletedDTO
{
	private int transactionId;             // 거래 완료 코드 (PK)
	private int purchaseConfirmId;         // 구매 확정 코드 (FK)
	private Date createdAt;                // 등록 일자

	public TransactionCompletedDTO() {}

	public int getTransactionId()
	{
		return transactionId;
	}

	public void setTransactionId(int transactionId)
	{
		this.transactionId = transactionId;
	}

	public int getPurchaseConfirmId()
	{
		return purchaseConfirmId;
	}

	public void setPurchaseConfirmId(int purchaseConfirmId)
	{
		this.purchaseConfirmId = purchaseConfirmId;
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
