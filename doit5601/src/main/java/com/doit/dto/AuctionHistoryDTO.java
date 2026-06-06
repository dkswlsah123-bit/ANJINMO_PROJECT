package com.doit.dto;

public class AuctionHistoryDTO {

	private int auctionId, finalPrice;
	private String auctionTitle, auctionEndDate, transactionStatus, purchaseConfirmDate, bidFailType, shippingYn, winningPaymentStatus;
	
	public String getShippingYn() {
		return shippingYn;
	}




	public void setShippingYn(String shippingYn) {
		this.shippingYn = shippingYn;
	}




	public String getWinningPaymentStatus() {
		return winningPaymentStatus;
	}




	public void setWinningPaymentStatus(String winningPaymentStatus) {
		this.winningPaymentStatus = winningPaymentStatus;
	}




	public AuctionHistoryDTO() {
		this(0,0,"","","","","");
	}
	


	
	public AuctionHistoryDTO(int auctionId, int finalPrice, String auctionTitle, String auctionEndDate,
			String transactionStatus, String purchaseConfirmDate, String bidFailType) {
		this.auctionId = auctionId;
		this.finalPrice = finalPrice;
		this.auctionTitle = auctionTitle;
		this.auctionEndDate = auctionEndDate;
		this.transactionStatus = transactionStatus;
		this.purchaseConfirmDate = purchaseConfirmDate;
		this.bidFailType = bidFailType;
	}


	public String getPurchaseConfirmDate() {
		return purchaseConfirmDate;
	}
	
	public void setPurchaseConfirmDate(String purchaseConfirmDate) {
		this.purchaseConfirmDate = purchaseConfirmDate;
	}
	
	public String getBidFailType() {
		return bidFailType;
	}
	
	public void setBidFailType(String bidFailType) {
		this.bidFailType = bidFailType;
	}
	public int getAuctionId() {
		return auctionId;
	}
	
	public void setAuctionId(int auctionId) {
		this.auctionId = auctionId;
	}
	public int getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
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
	public String getTransactionStatus() {
		return transactionStatus;
	}
	public void setTransactionStatus(String transactionStatus) {
		this.transactionStatus = transactionStatus;
	}


}