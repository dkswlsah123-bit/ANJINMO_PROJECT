package com.doit.dto;

import java.sql.Date;

public class DeliveryCompletedDTO
{
	private int shippingId;                // 발송 완료 코드 (PK)
	private int paymentId;                 // 낙찰 입금 코드 (FK)
	private Date createdAt;                // 등록 일시

	public DeliveryCompletedDTO() {}

	public int getShippingId()
	{
		return shippingId;
	}

	public void setShippingId(int shippingId)
	{
		this.shippingId = shippingId;
	}

	public int getPaymentId()
	{
		return paymentId;
	}

	public void setPaymentId(int paymentId)
	{
		this.paymentId = paymentId;
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
