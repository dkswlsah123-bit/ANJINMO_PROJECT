package com.doit.dto;

import java.sql.Date;

public class ProductWishlistDTO
{
	private int wishlistId;                // 인덱스 번호 (PK)
	private int userId;                    // 회원 고유키 (FK)
	private int productId;                 // 상품 코드 (FK)
	private Date createdAt;                // 등록 일자

	public ProductWishlistDTO() {}

	public int getWishlistId()
	{
		return wishlistId;
	}

	public void setWishlistId(int wishlistId)
	{
		this.wishlistId = wishlistId;
	}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public int getProductId()
	{
		return productId;
	}

	public void setProductId(int productId)
	{
		this.productId = productId;
	}

	public Date getCreatedAt()
	{
		return createdAt;
	}

	public void setCreatedAt(Date createdAt)
	{
		this.createdAt = createdAt;
	}
}
