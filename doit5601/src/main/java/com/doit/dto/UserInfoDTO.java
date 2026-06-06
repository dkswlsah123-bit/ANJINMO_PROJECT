package com.doit.dto;

public class UserInfoDTO {
	
	private int userId, totalMoney;
	private String userLoginId, userPassword, userName, userSsn, userEmail, userPhone, userZipcode, userAddress, userAddressDetail, createdAt, deletedAt;
	
	public UserInfoDTO() {
		this(0,0 ,"","","","","","","","","","","");
	}

	public UserInfoDTO(int userId, int totalMoney, String userLoginId, String userPassword, String userName,
			String userSsn, String userEmail, String userPhone, String userZipcode, String userAddress,
			String userAddressDetail, String createdAt, String deletedAt) {
		super();
		this.userId = userId;
		this.totalMoney = totalMoney;
		this.userLoginId = userLoginId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userSsn = userSsn;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userZipcode = userZipcode;
		this.userAddress = userAddress;
		this.userAddressDetail = userAddressDetail;
		this.createdAt = createdAt;
		this.deletedAt = deletedAt;
	}




	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getUserLoginId() {
		return userLoginId;
	}
	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserSsn() {
		return userSsn;
	}
	public void setUserSsn(String userSsn) {
		this.userSsn = userSsn;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserZipcode() {
		return userZipcode;
	}
	public void setUserZipcode(String userZipcode) {
		this.userZipcode = userZipcode;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserAddressDetail() {
		return userAddressDetail;
	}
	public void setUserAddressDetail(String userAddressDetail) {
		this.userAddressDetail = userAddressDetail;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getDeletedAt() {
		return deletedAt;
	}
	public void setDeletedAt(String deletedAt) {
		this.deletedAt = deletedAt;
	}
	
	
}
