package com.doit.dto;

public class MoneyTypeDTO
{
	private int moneyTypeId;               // 머니 분류 코드 (PK)
	private String moneyTypeName;          // 머니 분류명

	public MoneyTypeDTO() {}

	public int getMoneyTypeId()
	{
		return moneyTypeId;
	}

	public void setMoneyTypeId(int moneyTypeId)
	{
		this.moneyTypeId = moneyTypeId;
	}

	public String getMoneyTypeName()
	{
		return moneyTypeName;
	}

	public void setMoneyTypeName(String moneyTypeName)
	{
		this.moneyTypeName = moneyTypeName;
	}
}
