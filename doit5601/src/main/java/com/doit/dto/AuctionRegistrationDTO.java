package com.doit.dto;

import java.sql.Date;

public class AuctionRegistrationDTO
{
	private int auctionId;                 // 경매 코드 (PK)
	private int productId;                 // 상품 코드 (FK)
	private String auctionTitle;           // 경매 제목
	private String auctionContent;         // 경매 글
	private int startPrice;               // 시작가
	private Date createdAt;                // 등록 시간
	private int auctionPeriodId;           // 경매 기간 코드 (FK)

	public AuctionRegistrationDTO() {}

	public int getAuctionId()
	{
		return auctionId;
	}

	public void setAuctionId(int auctionId)
	{
		this.auctionId = auctionId;
	}

	public int getProductId()
	{
		return productId;
	}

	public void setProductId(int productId)
	{
		this.productId = productId;
	}

	public String getAuctionTitle()
	{
		return auctionTitle;
	}

	public void setAuctionTitle(String auctionTitle)
	{
		this.auctionTitle = auctionTitle;
	}

	public String getAuctionContent()
	{
		return auctionContent;
	}

	public void setAuctionContent(String auctionContent)
	{
		this.auctionContent = auctionContent;
	}

	public int getStartPrice()
	{
		return startPrice;
	}

	public void setStartPrice(int startPrice)
	{
		this.startPrice = startPrice;
	}

	public Date getCreatedAt()
	{
		return createdAt;
	}

	public void setCreatedAt(Date createdAt)
	{
		this.createdAt = createdAt;
	}

	public int getAuctionPeriodId()
	{
		return auctionPeriodId;
	}

	public void setAuctionPeriodId(int auctionPeriodId)
	{
		this.auctionPeriodId = auctionPeriodId;
	}
}
