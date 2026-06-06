package com.doit.dto;

public class BidRankDTO {

	private int auctionId, userId, bidPrice, currentRank, totalBidders;
	private String bidTime;
	
	public BidRankDTO() {
		this(0,0,0,0,0,"");
	}
	
	public BidRankDTO(int auctionId, int userId, int bidPrice, int currentRank, int totalBidders, String bidTime) {
		this.auctionId = auctionId;
		this.userId = userId;
		this.bidPrice = bidPrice;
		this.currentRank = currentRank;
		this.totalBidders = totalBidders;
		this.bidTime = bidTime;
	}

	public int getAuctionId() {
		return auctionId;
	}
	public void setAuctionId(int auctionId) {
		this.auctionId = auctionId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}
	public int getCurrentRank() {
		return currentRank;
	}
	public void setCurrentRank(int currentRank) {
		this.currentRank = currentRank;
	}
	public int getTotalBidders() {
		return totalBidders;
	}
	public void setTotalBidders(int totalBidders) {
		this.totalBidders = totalBidders;
	}
	public String getBidTime() {
		return bidTime;
	}
	public void setBidTime(String bidTime) {
		this.bidTime = bidTime;
	}
	
	
	
}
