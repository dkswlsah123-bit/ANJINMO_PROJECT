package com.doit.dto;

public class PaymentDetailDTO
{
	private int bidResult,userId, auctionId,startPrice,currentPrice,maxPrice,producId,zipcode;

	private String auctionTitle,auctionStartDate,auctionEndDate,isFinish,producAlias
	,manudacturerName,gradeName,img,userName,email,address,addressDetail,phone;

	

	public PaymentDetailDTO() {}
	
	public PaymentDetailDTO(int bidResult, int userId, int auctionId, int startPrice, int currentPrice,
			int maxPrice, int producId, int zipcode, String auctionTitle, String auctionStartDate,
			String auctionEndDate, String isFinish, String producAlias, String manudacturerName, String gradeName,
			String img, String userName, String email, String address, String addressDetail, String phone)
	{
		this.bidResult = bidResult;
		this.userId = userId;
		this.auctionId = auctionId;
		this.startPrice = startPrice;
		this.currentPrice = currentPrice;
		this.maxPrice = maxPrice;
		this.producId = producId;
		this.zipcode = zipcode;
		this.auctionTitle = auctionTitle;
		this.auctionStartDate = auctionStartDate;
		this.auctionEndDate = auctionEndDate;
		this.isFinish = isFinish;
		this.producAlias = producAlias;
		this.manudacturerName = manudacturerName;
		this.gradeName = gradeName;
		this.img = img;
		this.userName = userName;
		this.email = email;
		this.address = address;
		this.addressDetail = addressDetail;
		this.phone = phone;
	}
	
	public String getPhone()
	{
		return phone;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}
	
	public int getBidResult()
	{
		return bidResult;
	}

	public void setBidResult(int bidResult)
	{
		this.bidResult = bidResult;
	}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public int getAuctionId()
	{
		return auctionId;
	}

	public void setAuctionId(int auctionId)
	{
		this.auctionId = auctionId;
	}

	public int getStartPrice()
	{
		return startPrice;
	}

	public void setStartPrice(int startPrice)
	{
		this.startPrice = startPrice;
	}

	public int getCurrentPrice()
	{
		return currentPrice;
	}

	public void setCurrentPrice(int currentPrice)
	{
		this.currentPrice = currentPrice;
	}

	public int getMaxPrice()
	{
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice)
	{
		this.maxPrice = maxPrice;
	}

	public int getProducId()
	{
		return producId;
	}

	public void setProducId(int producId)
	{
		this.producId = producId;
	}

	public int getZipcode()
	{
		return zipcode;
	}

	public void setZipcode(int zipcode)
	{
		this.zipcode = zipcode;
	}

	public String getAuctionTitle()
	{
		return auctionTitle;
	}

	public void setAuctionTitle(String auctionTitle)
	{
		this.auctionTitle = auctionTitle;
	}

	public String getAuctionStartDate()
	{
		return auctionStartDate;
	}

	public void setAuctionStartDate(String auctionStartDate)
	{
		this.auctionStartDate = auctionStartDate;
	}

	public String getAuctionEndDate()
	{
		return auctionEndDate;
	}

	public void setAuctionEndDate(String auctionEndDate)
	{
		this.auctionEndDate = auctionEndDate;
	}

	public String getIsFinish()
	{
		return isFinish;
	}

	public void setIsFinish(String isFinish)
	{
		this.isFinish = isFinish;
	}

	public String getProducAlias()
	{
		return producAlias;
	}

	public void setProducAlias(String producAlias)
	{
		this.producAlias = producAlias;
	}

	public String getManudacturerName()
	{
		return manudacturerName;
	}

	public void setManudacturerName(String manudacturerName)
	{
		this.manudacturerName = manudacturerName;
	}

	public String getGradeName()
	{
		return gradeName;
	}

	public void setGradeName(String gradeName)
	{
		this.gradeName = gradeName;
	}

	public String getImg()
	{
		return img;
	}

	public void setImg(String img)
	{
		this.img = img;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public String getAddressDetail()
	{
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail)
	{
		this.addressDetail = addressDetail;
	}
	
	
}	
