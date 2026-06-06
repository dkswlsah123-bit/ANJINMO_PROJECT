package com.doit.dto;

import java.util.Date;

public class MoneyTransactionListDTO
{
	private int userId, amount, transactionTypeCode,inoutType;
	private String transactionType,description,inout,part;
	private java.util.Date transactionDate;
	
	public MoneyTransactionListDTO() {}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public int getAmount()
	{
		return amount;
	}

	public void setAmount(int amount)
	{
		this.amount = amount;
	}

	public int getTransactionTypeCode()
	{
		return transactionTypeCode;
	}

	public void setTransactionTypeCode(int transactionTypeCode)
	{
		this.transactionTypeCode = transactionTypeCode;
	}

	public int getInoutType()
	{
		return inoutType;
	}

	public void setInoutType(int inoutType)
	{
		this.inoutType = inoutType;
	}

	public String getTransactionType()
	{
		return transactionType;
	}

	public void setTransactionType(String transactionType)
	{
		this.transactionType = transactionType;
	}

	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	public String getInout()
	{
		return inout;
	}

	public void setInout(String inout)
	{
		this.inout = inout;
	}

	public String getPart()
	{
		return part;
	}

	public void setPart(String part)
	{
		this.part = part;
	}

	public java.util.Date getTransactionDate()
	{
		return transactionDate;
	}

	public void setTransactionDate(java.util.Date transactionDate)
	{
		this.transactionDate = transactionDate;
	}

	public MoneyTransactionListDTO(int userId, int amount, int transactionTypeCode, int inoutType,
			String transactionType, String description, String inout, String part, Date transactionDate)
	{
		this.userId = userId;
		this.amount = amount;
		this.transactionTypeCode = transactionTypeCode;
		this.inoutType = inoutType;
		this.transactionType = transactionType;
		this.description = description;
		this.inout = inout;
		this.part = part;
		this.transactionDate = transactionDate;
	}

	
	
	
	
	
}
