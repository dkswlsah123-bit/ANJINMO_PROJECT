package com.doit.dto;

import java.sql.Date;

public class MoneyChargeHistoryDTO
{
	private int moneyChargeId;             // 머니 충전 인덱스 번호 (PK)
	private int userId;                    // 회원 고유키 (FK)
	private int moneyChargeMethodId;       // 머니 충전 수단 코드 (FK)
	private int chargeAmount;              // 충전 금액
	private Date chargedAt;                // 충전 일자

	public MoneyChargeHistoryDTO() {}
	
	public int getMoneyChargeId()
	{
		return moneyChargeId;
	}

	public void setMoneyChargeId(int moneyChargeId)
	{
		this.moneyChargeId = moneyChargeId;
	}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public int getMoneyChargeMethodId()
	{
		return moneyChargeMethodId;
	}

	public void setMoneyChargeMethodId(int moneyChargeMethodId)
	{
		this.moneyChargeMethodId = moneyChargeMethodId;
	}

	public int getChargeAmount()
	{
		return chargeAmount;
	}

	public void setChargeAmount(int chargeAmount)
	{
		this.chargeAmount = chargeAmount;
	}

	public Date getChargedAt()
	{
		return chargedAt;
	}

	public void setChargedAt(Date chargedAt)
	{
		this.chargedAt = chargedAt;
	}
}
