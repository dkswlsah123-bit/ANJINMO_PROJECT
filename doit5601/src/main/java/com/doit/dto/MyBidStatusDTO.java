package com.doit.dto;

import java.util.List;

public class MyBidStatusDTO {
	private int bidId, bidPrice, bidRank, bidderId, userId, auctionId, currentPrice, bidCount, maxPrice, maxRank;
	private String bidTime, auctionTitle, auctionEndDate, auctionStatus;

	private List<MyBidStatusDTO> bidDetail;
	


	public int getBidCount() {
		return bidCount;
	}

	public void setBidCount(int bidCount) {
		this.bidCount = bidCount;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

	public int getMaxRank() {
		return maxRank;
	}

	public void setMaxRank(int maxRank) {
		this.maxRank = maxRank;
	}

	public List<MyBidStatusDTO> getBidDetail() {
		return bidDetail;
	}

	public void setBidDetail(List<MyBidStatusDTO> bidDetail) {
		this.bidDetail = bidDetail;
	}



	public int getBidId() {
		return bidId;
	}
	public void setBidId(int bidId) {
		this.bidId = bidId;
	}
	public int getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}
	public int getBidRank() {
		return bidRank;
	}
	public void setBidRank(int bidRank) {
		this.bidRank = bidRank;
	}
	public int getBidderId() {
		return bidderId;
	}
	public void setBidderId(int bidderId) {
		this.bidderId = bidderId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getAuctionId() {
		return auctionId;
	}
	public void setAuctionId(int auctionId) {
		this.auctionId = auctionId;
	}
	public int getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(int currentPrice) {
		this.currentPrice = currentPrice;
	}
	public String getBidTime() {
		return bidTime;
	}
	public void setBidTime(String bidTime) {
		this.bidTime = bidTime;
	}
	public String getAuctionTitle() {
		return auctionTitle;
	}
	public void setAuctionTitle(String auctionTitle) {
		this.auctionTitle = auctionTitle;
	}
	public String getAuctionEndDate() {
		return auctionEndDate;
	}
	public void setAuctionEndDate(String auctionEndDate) {
		this.auctionEndDate = auctionEndDate;
	}
	public String getAuctionStatus() {
		return auctionStatus;
	}
	public void setAuctionStatus(String auctionStatus) {
		this.auctionStatus = auctionStatus;
	}
}
