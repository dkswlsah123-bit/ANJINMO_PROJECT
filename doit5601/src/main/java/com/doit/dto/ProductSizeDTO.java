package com.doit.dto;

public class ProductSizeDTO
{
	private int productSizeId;             // 상품 사이즈 코드 (PK)
	private String productSizeName;        // 상품 사이즈명

	public ProductSizeDTO() {}

	public int getProductSizeId()
	{
		return productSizeId;
	}

	public void setProductSizeId(int productSizeId)
	{
		this.productSizeId = productSizeId;
	}

	public String getProductSizeName()
	{
		return productSizeName;
	}

	public void setProductSizeName(String productSizeName)
	{
		this.productSizeName = productSizeName;
	}
}
