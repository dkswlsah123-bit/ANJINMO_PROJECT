package com.doit.dto;

public class AdminAccountDTO
{
	private int adminAccountId;            // 관리자 계정 번호 (PK)
	private int adminRoleId;               // 관리자 권한 코드 (FK)
	private String adminLoginId;           // 아이디
	private String adminPassword;          // 패스워드

	public AdminAccountDTO() {}

	public int getAdminAccountId()
	{
		return adminAccountId;
	}

	public void setAdminAccountId(int adminAccountId)
	{
		this.adminAccountId = adminAccountId;
	}

	public int getAdminRoleId()
	{
		return adminRoleId;
	}

	public void setAdminRoleId(int adminRoleId)
	{
		this.adminRoleId = adminRoleId;
	}

	public String getAdminLoginId()
	{
		return adminLoginId;
	}

	public void setAdminLoginId(String adminLoginId)
	{
		this.adminLoginId = adminLoginId;
	}

	public String getAdminPassword()
	{
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword)
	{
		this.adminPassword = adminPassword;
	}
}
