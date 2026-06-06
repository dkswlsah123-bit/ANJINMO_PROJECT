package com.doit.dto;

public class ProductGradeDTO
{
	private int productGradeId;            // 상품 등급 코드 (PK)
	private String productGradeName;       // 상품 등급명

	public ProductGradeDTO() {}

	public int getProductGradeId()
	{
		return productGradeId;
	}

	public void setProductGradeId(int productGradeId)
	{
		this.productGradeId = productGradeId;
	}

	public String getProductGradeName()
	{
		return productGradeName;
	}

	public void setProductGradeName(String productGradeName)
	{
		this.productGradeName = productGradeName;
	}
}
