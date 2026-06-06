package com.doit.dto;

public class ShowUserDTO
{
	private int userKey;			// 고유키
	private String userId;
	private String userName;
	private String userTel;
	private String userCreated;
	private String userStatus;
	private String userSsn;
	private String userEmail;
	private String userAddress;
	private String userAddressDetail;
	
	
	public String getUserAddressDetail()
	{
		return userAddressDetail;
	}
	public void setUserAddressDetail(String userAddressDetail)
	{
		this.userAddressDetail = userAddressDetail;
	}
	public String getUserSsn()
	{
		return userSsn;
	}
	public void setUserSsn(String userSsn)
	{
		this.userSsn = userSsn;
	}
	public String getUserEmail()
	{
		return userEmail;
	}
	public void setUserEmail(String userEmail)
	{
		this.userEmail = userEmail;
	}
	public String getUserAddress()
	{
		return userAddress;
	}
	public void setUserAddress(String userAddress)
	{
		this.userAddress = userAddress;
	}
	public int getUserKey()
	{
		return userKey;
	}
	public void setUserKey(int userKey)
	{
		this.userKey = userKey;
	}
	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getUserTel()
	{
		return userTel;
	}
	public void setUserTel(String userTel)
	{
		this.userTel = userTel;
	}
	public String getUserCreated()
	{
		return userCreated;
	}
	public void setUserCreated(String userCreated)
	{
		this.userCreated = userCreated;
	}
	public String getUserStatus()
	{
		return userStatus;
	}
	public void setUserStatus(String userStatus)
	{
		this.userStatus = userStatus;
	}
	
}


