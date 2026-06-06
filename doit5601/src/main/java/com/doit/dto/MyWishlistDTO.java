package com.doit.dto;

public class MyWishlistDTO {

	private int wishlistId, productId;
	private Integer auctionId;
	private String productReleaseName, imagePath1, auctionEndDate, isFinished;
	public int getWishlistId() {
		return wishlistId;
	}
	public void setWishlistId(int wishlistId) {
		this.wishlistId = wishlistId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public Integer getAuctionId() {
		return auctionId;
	}
	public void setAuctionId(Integer auctionId) {
		this.auctionId = auctionId;
	}
	public String getProductReleaseName() {
		return productReleaseName;
	}
	public void setProductReleaseName(String productReleaseName) {
		this.productReleaseName = productReleaseName;
	}
	public String getImagePath1() {
		return imagePath1;
	}
	public void setImagePath1(String imagePath1) {
		this.imagePath1 = imagePath1;
	}
	public String getAuctionEndDate() {
		return auctionEndDate;
	}
	public void setAuctionEndDate(String auctionEndDate) {
		this.auctionEndDate = auctionEndDate;
	}
	public String getIsFinished() {
		return isFinished;
	}
	public void setIsFinished(String isFinished) {
		this.isFinished = isFinished;
	}
	
	
	
}
