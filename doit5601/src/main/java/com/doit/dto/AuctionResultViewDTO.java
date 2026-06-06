package com.doit.dto;

public class AuctionResultViewDTO
{
	private int auctionId,winnerUserId,winnerAmount
	,productId,startPrice,auctionUseDate,winnerBidId
	,finalPrice,winnerId,paymentId,failType;
	
	private String auctionTitle,winnerDate
	,auctionStartDate,winnerBidDate,auctionStat
	,winnerStat,paymentStat,paymentDate,fail,shipping
	,shippingDate,confirm,confirmDate,winner,img;

	public AuctionResultViewDTO() {}
	
	public AuctionResultViewDTO(int auctionId, int winnerUserId, int winnerAmount, int productId, int startPrice,
			int auctionUseDate, int winnerBidId, int finalPrice, int winnerId, int paymentId, int failType,
			String auctionTitle, String winnerDate, String auctionStartDate, String winnerBidDate,
			String auctionStat, String winnerStat, String paymentStat, String paymentDate, String fail, String shipping,
			String shippingDate, String confirm, String confirmDate, String winner, String img)
	{
		this.auctionId = auctionId;
		this.winnerUserId = winnerUserId;
		this.winnerAmount = winnerAmount;
		this.productId = productId;
		this.startPrice = startPrice;
		this.auctionUseDate = auctionUseDate;
		this.winnerBidId = winnerBidId;
		this.finalPrice = finalPrice;
		this.winnerId = winnerId;
		this.paymentId = paymentId;
		this.failType = failType;
		this.auctionTitle = auctionTitle;
		this.winnerDate = winnerDate;
		this.auctionStartDate = auctionStartDate;
		this.winnerBidDate = winnerBidDate;
		this.auctionStat = auctionStat;
		this.winnerStat = winnerStat;
		this.paymentStat = paymentStat;
		this.paymentDate = paymentDate;
		this.fail = fail;
		this.shipping = shipping;
		this.shippingDate = shippingDate;
		this.confirm = confirm;
		this.confirmDate = confirmDate;
		this.winner = winner;
		this.img = img;
	}

	
	public String getImg()
	{
		return img;
	}

	public void setImg(String img)
	{
		this.img = img;
	}

	public String getWinner()
	{
		return winner;
	}

	public void setWinner(String winner)
	{
		this.winner = winner;
	}
	
	public int getAuctionId()
	{
		return auctionId;
	}

	public void setAuctionId(int auctionId)
	{
		this.auctionId = auctionId;
	}

	public int getWinnerUserId()
	{
		return winnerUserId;
	}

	public void setWinnerUserId(int winnerUserId)
	{
		this.winnerUserId = winnerUserId;
	}

	public int getWinnerAmount()
	{
		return winnerAmount;
	}

	public void setWinnerAmount(int winnerAmount)
	{
		this.winnerAmount = winnerAmount;
	}

	public int getProductId()
	{
		return productId;
	}

	public void setProductId(int productId)
	{
		this.productId = productId;
	}

	public int getStartPrice()
	{
		return startPrice;
	}

	public void setStartPrice(int startPrice)
	{
		this.startPrice = startPrice;
	}

	public int getAuctionUseDate()
	{
		return auctionUseDate;
	}

	public void setAuctionUseDate(int auctionUseDate)
	{
		this.auctionUseDate = auctionUseDate;
	}

	public int getWinnerBidId()
	{
		return winnerBidId;
	}

	public void setWinnerBidId(int winnerBidId)
	{
		this.winnerBidId = winnerBidId;
	}

	public int getFinalPrice()
	{
		return finalPrice;
	}

	public void setFinalPrice(int finalPrice)
	{
		this.finalPrice = finalPrice;
	}

	public int getWinnerId()
	{
		return winnerId;
	}

	public void setWinnerId(int winnerId)
	{
		this.winnerId = winnerId;
	}

	public int getPaymentId()
	{
		return paymentId;
	}

	public void setPaymentId(int paymentId)
	{
		this.paymentId = paymentId;
	}

	public int getFailType()
	{
		return failType;
	}

	public void setFailType(int failType)
	{
		this.failType = failType;
	}


	public String getAuctionTitle()
	{
		return auctionTitle;
	}

	public void setAuctionTitle(String auctionTitle)
	{
		this.auctionTitle = auctionTitle;
	}

	public String getWinnerDate()
	{
		return winnerDate;
	}

	public void setWinnerDate(String winnerDate)
	{
		this.winnerDate = winnerDate;
	}

	public String getAuctionStartDate()
	{
		return auctionStartDate;
	}

	public void setAuctionStartDate(String auctionStartDate)
	{
		this.auctionStartDate = auctionStartDate;
	}

	public String getWinnerBidDate()
	{
		return winnerBidDate;
	}

	public void setWinnerBidDate(String winnerBidDate)
	{
		this.winnerBidDate = winnerBidDate;
	}

	public String getAuctionStat()
	{
		return auctionStat;
	}

	public void setAuctionStat(String auctionStat)
	{
		this.auctionStat = auctionStat;
	}

	public String getWinnerStat()
	{
		return winnerStat;
	}

	public void setWinnerStat(String winnerStat)
	{
		this.winnerStat = winnerStat;
	}

	public String getPaymentStat()
	{
		return paymentStat;
	}

	public void setPaymentStat(String paymentStat)
	{
		this.paymentStat = paymentStat;
	}

	public String getPaymentDate()
	{
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate)
	{
		this.paymentDate = paymentDate;
	}

	public String getFail()
	{
		return fail;
	}

	public void setFail(String fail)
	{
		this.fail = fail;
	}

	public String getShipping()
	{
		return shipping;
	}

	public void setShipping(String shipping)
	{
		this.shipping = shipping;
	}

	public String getShippingDate()
	{
		return shippingDate;
	}

	public void setShippingDate(String shippingDate)
	{
		this.shippingDate = shippingDate;
	}

	public String getConfirm()
	{
		return confirm;
	}

	public void setConfirm(String confirm)
	{
		this.confirm = confirm;
	}

	public String getConfirmDate()
	{
		return confirmDate;
	}

	public void setConfirmDate(String confirmDate)
	{
		this.confirmDate = confirmDate;
	}
	
}
