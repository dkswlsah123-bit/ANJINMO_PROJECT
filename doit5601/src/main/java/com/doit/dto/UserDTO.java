package com.doit.dto;

// 회원 고유키 (USERS)
public class UserDTO
{
	private int userId;    // 회원고유키 (PK)

	public UserDTO() {}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

}
