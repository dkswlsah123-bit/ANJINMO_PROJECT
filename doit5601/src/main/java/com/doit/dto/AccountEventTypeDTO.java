package com.doit.dto;

public class AccountEventTypeDTO
{
	private int accountEventTypeId;        // 계정 이벤트 분류 코드 (PK)
	private String eventName;              // 이벤트명

	public AccountEventTypeDTO() {}

	public int getAccountEventTypeId()
	{
		return accountEventTypeId;
	}

	public void setAccountEventTypeId(int accountEventTypeId)
	{
		this.accountEventTypeId = accountEventTypeId;
	}

	public String getEventName()
	{
		return eventName;
	}

	public void setEventName(String eventName)
	{
		this.eventName = eventName;
	}
}
