package com.doit.dto;

public class ProductReportDTO
{
	private int productReportId;           // 상품 신고 코드 (PK)
	private int reportSubmissionId;        // 신고 신청 코드 (FK)
	private int productId;                 // 상품 코드 (FK)

	public ProductReportDTO() {}

	public int getProductReportId()
	{
		return productReportId;
	}

	public void setProductReportId(int productReportId)
	{
		this.productReportId = productReportId;
	}

	public int getReportSubmissionId()
	{
		return reportSubmissionId;
	}

	public void setReportSubmissionId(int reportSubmissionId)
	{
		this.reportSubmissionId = reportSubmissionId;
	}

	public int getProductId()
	{
		return productId;
	}

	public void setProductId(int productId)
	{
		this.productId = productId;
	}
}
