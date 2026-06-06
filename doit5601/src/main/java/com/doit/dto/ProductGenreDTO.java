package com.doit.dto;

public class ProductGenreDTO
{
	private int productGenreId;            // 상품 장르 코드 (PK)
	private String productGenreName;       // 상품 장르명

	public ProductGenreDTO() {}

	public int getProductGenreId()
	{
		return productGenreId;
	}

	public void setProductGenreId(int productGenreId)
	{
		this.productGenreId = productGenreId;
	}

	public String getProductGenreName()
	{
		return productGenreName;
	}

	public void setProductGenreName(String productGenreName)
	{
		this.productGenreName = productGenreName;
	}
}
