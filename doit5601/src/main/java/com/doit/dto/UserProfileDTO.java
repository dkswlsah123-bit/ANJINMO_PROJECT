package com.doit.dto;

public class UserProfileDTO
{
	private int userId;                    // 회원 고유키 (PK/FK)
	private String userName;               // 이름
	private String userSsn;                // 주민번호
	private String userEmail;              // 이메일
	private String userPhone;              // 전화번호
	private String userZipcode;            // 우편번호
	private String userAddress;            // 주소
	private String userAddressDetail;      // 상세 주소

	public UserProfileDTO() {}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
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

	public String getUserPhone()
	{
		return userPhone;
	}

	public void setUserPhone(String userPhone)
	{
		this.userPhone = userPhone;
	}

	public String getUserZipcode()
	{
		return userZipcode;
	}

	public void setUserZipcode(String userZipcode)
	{
		this.userZipcode = userZipcode;
	}

	public String getUserAddress()
	{
		return userAddress;
	}

	public void setUserAddress(String userAddress)
	{
		this.userAddress = userAddress;
	}

	public String getUserAddressDetail()
	{
		return userAddressDetail;
	}

	public void setUserAddressDetail(String userAddressDetail)
	{
		this.userAddressDetail = userAddressDetail;
	}
}
