package com.doit.dto;

public class UserAccountDTO
{
	private int userId;                    // 회원 고유키 (PK/FK)
	private String userLoginId;            // 아이디
	private String userPassword;           // 패스워드

	public UserAccountDTO() {}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public String getUserLoginId()
	{
		return userLoginId;
	}

	public void setUserLoginId(String userLoginId)
	{
		this.userLoginId = userLoginId;
	}

	public String getUserPassword()
	{
		return userPassword;
	}

	public void setUserPassword(String userPassword)
	{
		this.userPassword = userPassword;
	}
}
