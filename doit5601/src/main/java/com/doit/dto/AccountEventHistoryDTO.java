package com.doit.dto;

import java.sql.Date;

public class AccountEventHistoryDTO
{
	private int accountEventId;            // 회원 계정 이벤트 이력 코드 (PK)
	private int userId;                    // 회원 고유키 (FK)
	private int accountEventTypeId;        // 계정 이벤트 분류 코드 (FK)
	private Date createdAt;                // 등록 일자

	public AccountEventHistoryDTO() {}

	public int getAccountEventId()
	{
		return accountEventId;
	}

	public void setAccountEventId(int accountEventId)
	{
		this.accountEventId = accountEventId;
	}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public int getAccountEventTypeId()
	{
		return accountEventTypeId;
	}

	public void setAccountEventTypeId(int accountEventTypeId)
	{
		this.accountEventTypeId = accountEventTypeId;
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
