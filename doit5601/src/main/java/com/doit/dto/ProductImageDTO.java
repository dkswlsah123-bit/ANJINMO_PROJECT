package com.doit.dto;

import java.sql.Date;

public class ProductImageDTO
{
	private int productImageId;            // 인덱스 번호 (PK)
	private int productId;                 // 상품 코드 (FK)
	private int imageOrder;                // 이미지 순서
	private String filePath;               // 파일 경로
	private Date createdAt;                // 등록일

	public ProductImageDTO() {}

	public int getProductImageId()
	{
		return productImageId;
	}

	public void setProductImageId(int productImageId)
	{
		this.productImageId = productImageId;
	}

	public int getProductId()
	{
		return productId;
	}

	public void setProductId(int productId)
	{
		this.productId = productId;
	}

	public int getImageOrder()
	{
		return imageOrder;
	}

	public void setImageOrder(int imageOrder)
	{
		this.imageOrder = imageOrder;
	}

	public String getFilePath()
	{
		return filePath;
	}

	public void setFilePath(String filePath)
	{
		this.filePath = filePath;
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
