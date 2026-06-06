package com.doit.dto;

public class ProductCountryDTO
{
	private String productCountryId;       // 상품 제조국 코드 (PK)
	private String productCountryName;     // 상품 제조국명

	public ProductCountryDTO() {}

	public String getProductCountryId()
	{
		return productCountryId;
	}

	public void setProductCountryId(String productCountryId)
	{
		this.productCountryId = productCountryId;
	}

	public String getProductCountryName()
	{
		return productCountryName;
	}

	public void setProductCountryName(String productCountryName)
	{
		this.productCountryName = productCountryName;
	}
}
