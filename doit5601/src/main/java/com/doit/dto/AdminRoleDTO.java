package com.doit.dto;

public class AdminRoleDTO
{
	private int adminRoleId;               // 관리자 권한 코드 (PK)
	private String adminRoleName;          // 관리자 권한명

	public AdminRoleDTO() {}

	public int getAdminRoleId()
	{
		return adminRoleId;
	}

	public void setAdminRoleId(int adminRoleId)
	{
		this.adminRoleId = adminRoleId;
	}

	public String getAdminRoleName()
	{
		return adminRoleName;
	}

	public void setAdminRoleName(String adminRoleName)
	{
		this.adminRoleName = adminRoleName;
	}
}
