package com.doit.dto;

public class UsersDTO
{
	private int userId;                    // 회원 고유키 (PK)

	public UsersDTO() {}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}
}
