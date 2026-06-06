package com.doit.dto;

public class AdminDTO {
	
	private int adminAccountId;      // 관리자 계정 번호 (PK)
    private String adminLoginId;     // 관리자 아이디
    private String adminPassword;    // 관리자 비밀번호
    private int adminRoleId;         // 권한 코드
    private String adminRoleName;    // 권한명 (최고관리자, 관리자 등)
    
    private int employeeId;          // 사번
    private String employeeName;     // 이름
    private String department;       // 소속 부서
	public int getAdminAccountId() {
		return adminAccountId;
	}
	public void setAdminAccountId(int adminAccountId) {
		this.adminAccountId = adminAccountId;
	}
	public String getAdminLoginId() {
		return adminLoginId;
	}
	public void setAdminLoginId(String adminLoginId) {
		this.adminLoginId = adminLoginId;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public int getAdminRoleId() {
		return adminRoleId;
	}
	public void setAdminRoleId(int adminRoleId) {
		this.adminRoleId = adminRoleId;
	}
	public String getAdminRoleName() {
		return adminRoleName;
	}
	public void setAdminRoleName(String adminRoleName) {
		this.adminRoleName = adminRoleName;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	
    
    
    
}
