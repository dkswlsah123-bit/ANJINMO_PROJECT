package com.doit.dto;

public class MoneyChargeMethodDTO
{
	private int moneyChargeMethodId;       // 머니 충전 수단 코드 (PK)
	private String moneyChargeMethodName;  // 머니 충전 수단명

	public MoneyChargeMethodDTO() {}

	public int getMoneyChargeMethodId()
	{
		return moneyChargeMethodId;
	}

	public void setMoneyChargeMethodId(int moneyChargeMethodId)
	{
		this.moneyChargeMethodId = moneyChargeMethodId;
	}

	public String getMoneyChargeMethodName()
	{
		return moneyChargeMethodName;
	}

	public void setMoneyChargeMethodName(String moneyChargeMethodName)
	{
		this.moneyChargeMethodName = moneyChargeMethodName;
	}
}
