package com.doit.dto;

public class AdminProfileDTO
{
	private int employeeId;                // 사번 (PK)
	private String employeeName;           // 이름
	private String department;             // 소속

	public AdminProfileDTO() {}

	public int getEmployeeId()
	{
		return employeeId;
	}

	public void setEmployeeId(int employeeId)
	{
		this.employeeId = employeeId;
	}

	public String getEmployeeName()
	{
		return employeeName;
	}

	public void setEmployeeName(String employeeName)
	{
		this.employeeName = employeeName;
	}

	public String getDepartment()
	{
		return department;
	}

	public void setDepartment(String department)
	{
		this.department = department;
	}
}
