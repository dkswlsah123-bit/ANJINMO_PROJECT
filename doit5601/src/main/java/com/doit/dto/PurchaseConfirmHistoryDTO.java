package com.doit.dto;

import java.sql.Date;

public class PurchaseConfirmHistoryDTO
{
	private int purchaseConfirmId;         // 구매 확정 코드 (PK)
	private int shippingId;                // 발송 완료 코드 (FK)
	private Date createdAt;                // 등록 일자

	public PurchaseConfirmHistoryDTO() {}

	public int getPurchaseConfirmId()
	{
		return purchaseConfirmId;
	}

	public void setPurchaseConfirmId(int purchaseConfirmId)
	{
		this.purchaseConfirmId = purchaseConfirmId;
	}

	public int getShippingId()
	{
		return shippingId;
	}

	public void setShippingId(int shippingId)
	{
		this.shippingId = shippingId;
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
