package com.doit.dto;

public class ProductManufacturerDTO
{
	private int manufacturerId;            // 상품 제조사 코드 (PK)
	private String productCountryId;       // 상품 제조국 코드 (FK)
	private String manufacturerName;       // 상품 제조사명

	public ProductManufacturerDTO() {}

	public int getManufacturerId()
	{
		return manufacturerId;
	}

	public void setManufacturerId(int manufacturerId)
	{
		this.manufacturerId = manufacturerId;
	}

	public String getProductCountryId()
	{
		return productCountryId;
	}

	public void setProductCountryId(String productCountryId)
	{
		this.productCountryId = productCountryId;
	}

	public String getManufacturerName()
	{
		return manufacturerName;
	}

	public void setManufacturerName(String manufacturerName)
	{
		this.manufacturerName = manufacturerName;
	}
}
