package com.doit.dto;

import java.sql.Date;

public class AdminAccountHistoryDTO
{
	private int adminHistoryId;            // 관리자 계정 이력 코드 (PK)
	private int adminAccountId;            // 관리자 계정 번호 (FK)
	private int employeeId;                // 사번 (FK)
	private Date accountStartDate;         // 계정 사용 시작일
	private Date accountEndDate;           // 계정 사용 종료일

	public AdminAccountHistoryDTO() {}

	public int getAdminHistoryId()
	{
		return adminHistoryId;
	}

	public void setAdminHistoryId(int adminHistoryId)
	{
		this.adminHistoryId = adminHistoryId;
	}

	public int getAdminAccountId()
	{
		return adminAccountId;
	}

	public void setAdminAccountId(int adminAccountId)
	{
		this.adminAccountId = adminAccountId;
	}

	public int getEmployeeId()
	{
		return employeeId;
	}

	public void setEmployeeId(int employeeId)
	{
		this.employeeId = employeeId;
	}

	public Date getAccountStartDate()
	{
		return accountStartDate;
	}

	public void setAccountStartDate(Date accountStartDate)
	{
		this.accountStartDate = accountStartDate;
	}

	public Date getAccountEndDate()
	{
		return accountEndDate;
	}

	public void setAccountEndDate(Date accountEndDate)
	{
		this.accountEndDate = accountEndDate;
	}
}
