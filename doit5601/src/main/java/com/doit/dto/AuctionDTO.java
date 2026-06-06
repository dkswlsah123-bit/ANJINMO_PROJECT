package com.doit.dto;

import java.util.List;

public class AuctionDTO
{
	// AUCTION_REGISTRATION 테이블 컬럼

	private int auctionId; // AUCTION_ID (PK)
	private int userId; // USER_ID (경매 등록자)
	private int productId; // PRODUCT_ID (FK)
	private String auctionTitle; // AUCTION_TITLE
	private String auctionContent; // AUCTION_CONTENT
	private int startPrice; // START_PRICE (NUMBER(12))
	private int auctionPeriodId; // AUCTION_PERIOD_ID (FK)
	private String createdAt; // CREATED_AT

	// VW_AUCTION_LIST 조인 컬럼
	private String auctionPeriodName; // AUCTION_PERIOD_NAME
	private String auctionStartDate; // TO_CHAR(CREATED_AT, 'YYYY-MM-DD HH24:MI')
	private String auctionEndDate; // FN_GET_AUCTION_DUE_DATE → 'YYYY-MM-DD HH24:MI' 또는 '-'
	private String isFinished; // '진행중' / '마감'

	// 상품 쪽 조인 컬럼
	private String productReleaseName; // PRODUCT_RELEASE_NAME
	private String productAlias; // PRODUCT_ALIAS
	private String manufacturerName; // MANUFACTURER_NAME
	private String productGradeName; // PRODUCT_GRADE_NAME
	private String imagePath1; // IMAGE_PATH_1 (대표 이미지)
	private String imagePath2, imagePath3, imagePath4, imagePath5, imagePath6, imagePath7, imagePath8, imagePath9,
			imagePath10;

	// 입찰 집계
	private int bidCurrentPrice; // 현재가 (NVL 처리, 입찰 없으면 시작가)
	private Integer bidMaxPrice; // 최고 입찰가 (입찰 없으면 null인데 null처리를 하려면 integer를 쓴다함
	private int bidCount; // 입찰 건수

	// 추가
	private List<BidRankDTO> bidRankList;

	public List<BidRankDTO> getBidRankList()
	{
		return bidRankList;
	}

	public void setBidRankList(List<BidRankDTO> bidRankList)
	{
		this.bidRankList = bidRankList;
	}

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

	public int getAuctionPeriodId()
	{
		return auctionPeriodId;
	}

	public void setAuctionPeriodId(int auctionPeriodId)
	{
		this.auctionPeriodId = auctionPeriodId;
	}

	public String getCreatedAt()
	{
		return createdAt;
	}

	public void setCreatedAt(String createdAt)
	{
		this.createdAt = createdAt;
	}

	// ── 뷰 조인 컬럼──
	public String getAuctionPeriodName()
	{
		return auctionPeriodName;
	}

	public void setAuctionPeriodName(String auctionPeriodName)
	{
		this.auctionPeriodName = auctionPeriodName;
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

	public String getIsFinished()
	{
		return isFinished;
	}

	public void setIsFinished(String isFinished)
	{
		this.isFinished = isFinished;
	}

	// ── 상품쪽 조인 컬럼 ──
	public String getProductReleaseName()
	{
		return productReleaseName;
	}

	public void setProductReleaseName(String productReleaseName)
	{
		this.productReleaseName = productReleaseName;
	}

	public String getProductAlias()
	{
		return productAlias;
	}

	public void setProductAlias(String productAlias)
	{
		this.productAlias = productAlias;
	}

	public String getManufacturerName()
	{
		return manufacturerName;
	}

	public void setManufacturerName(String manufacturerName)
	{
		this.manufacturerName = manufacturerName;
	}

	public String getProductGradeName()
	{
		return productGradeName;
	}

	public void setProductGradeName(String productGradeName)
	{
		this.productGradeName = productGradeName;
	}

	public String getImagePath1()
	{
		return imagePath1;
	}

	public void setImagePath1(String imagePath1)
	{
		this.imagePath1 = imagePath1;
	}

	public String getImagePath2()
	{
		return imagePath2;
	}

	public void setImagePath2(String imagePath2)
	{
		this.imagePath2 = imagePath2;
	}

	public String getImagePath3()
	{
		return imagePath3;
	}

	public void setImagePath3(String imagePath3)
	{
		this.imagePath3 = imagePath3;
	}

	public String getImagePath4()
	{
		return imagePath4;
	}

	public void setImagePath4(String imagePath4)
	{
		this.imagePath4 = imagePath4;
	}

	public String getImagePath5()
	{
		return imagePath5;
	}

	public void setImagePath5(String imagePath5)
	{
		this.imagePath5 = imagePath5;
	}

	public String getImagePath6()
	{
		return imagePath6;
	}

	public void setImagePath6(String imagePath6)
	{
		this.imagePath6 = imagePath6;
	}

	public String getImagePath7()
	{
		return imagePath7;
	}

	public void setImagePath7(String imagePath7)
	{
		this.imagePath7 = imagePath7;
	}

	public String getImagePath8()
	{
		return imagePath8;
	}

	public void setImagePath8(String imagePath8)
	{
		this.imagePath8 = imagePath8;
	}

	public String getImagePath9()
	{
		return imagePath9;
	}

	public void setImagePath9(String imagePath9)
	{
		this.imagePath9 = imagePath9;
	}

	public String getImagePath10()
	{
		return imagePath10;
	}

	public void setImagePath10(String imagePath10)
	{
		this.imagePath10 = imagePath10;
	}

	// ── 입찰 집계 ──
	public int getBidCurrentPrice()
	{
		return bidCurrentPrice;
	}

	public void setBidCurrentPrice(int bidCurrentPrice)
	{
		this.bidCurrentPrice = bidCurrentPrice;
	}

	public Integer getBidMaxPrice()
	{
		return bidMaxPrice;
	}

	public void setBidMaxPrice(Integer bidMaxPrice)
	{
		this.bidMaxPrice = bidMaxPrice;
	}

	public int getBidCount()
	{
		return bidCount;
	}

	public void setBidCount(int bidCount)
	{
		this.bidCount = bidCount;
	}

	public int getUserId() { return userId; }
	public void setUserId(int userId) { this.userId = userId; }

}

