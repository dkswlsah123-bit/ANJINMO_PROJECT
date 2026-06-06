package com.doit.dto;


public class ProductDTO
{
	private int productId;              // PRODUCT_ID (PK)
	private String productReleaseName;  // PRODUCT_RELEASE_NAME
	private String productAlias;        // PRODUCT_ALIAS
	private int userId;                 // USER_ID (FK)
	private int manufacturerId;         // MANUFACTURER_ID (FK)
	private int productGradeId;         // PRODUCT_GRADE_ID (FK)
	private int productGenreId;         // PRODUCT_GENRE_ID (FK)
	private int productSizeId;          // PRODUCT_SIZE_ID (FK)
	private String workName;            // WORK_NAME
	private String characterName;       // CHARACTER_NAME
	private String purchaseDateTime;    // PURCHASE_DATETIME
	private int isOpened;               // IS_OPENED (NUMBER(1)) - INSERT/UPDATE 용
	private int isPartsMissing;         // IS_PARTS_MISSING (NUMBER(1)) - INSERT/UPDATE 용
	private String descriptions;        // DESCRIPTIONS
	private String imagePath1;          // IMAGE_PATH_1
	private String imagePath2;          // IMAGE_PATH_2
	private String imagePath3;          // IMAGE_PATH_3
	private int isPublic;               // IS_PUBLIC (NUMBER(1)) - INSERT/UPDATE 용
	private String createdAt;           // CREATED_AT

	// VW_PRODUCT_LIST 조인컬럼
	private String manufacturerName;    // MANUFACTURER_NAME
	private String productCountryId;    // PRODUCT_COUNTRY_ID (CHAR(2))
	private String productCountryName;  // PRODUCT_COUNTRY_NAME
	private String productGradeName;    // PRODUCT_GRADE_NAME
	private String productGenreName;    // PRODUCT_GENRE_NAME
	private String productSizeName;     // PRODUCT_SIZE_NAME
	private String isOpenedName;        // '개봉' / '미개봉'
	private String isPartsMissingName;  // '정상' / '누락'
	private String isPublicName;        // '공개' / '비공개'

	// VW_PRODUCT_LIST 추가 이미지
	private String imagePath4;          // IMAGE_PATH_4
	private String imagePath5;          // IMAGE_PATH_5
	private String imagePath6;          // IMAGE_PATH_6
	private String imagePath7;          // IMAGE_PATH_7
	private String imagePath8;          // IMAGE_PATH_8
	private String imagePath9;          // IMAGE_PATH_9
	private String imagePath10;         // IMAGE_PATH_10

	
	private int auctionId;
	private String isFinished;

	public int getAuctionId() {
		return auctionId;
	}
	public void setAuctionId(int auctionId) {
		this.auctionId = auctionId;
	}
	public String getIsFinished() {
		return isFinished;
	}
	public void setIsFinished(String isFinished) {
		this.isFinished = isFinished;
	}
	public int getProductId()
	{
		return productId;
	}
	public void setProductId(int productId)
	{
		this.productId = productId;
	}
	public String getProductReleaseName()
	{
		return productReleaseName;
	}
	public void setProductReleaseName(String productReleaseName)
	{
		this.productReleaseName = productReleaseName;
	}
	public String getProductAlias()
	{
		return productAlias;
	}
	public void setProductAlias(String productAlias)
	{
		this.productAlias = productAlias;
	}
	public int getUserId()
	{
		return userId;
	}
	public void setUserId(int userId)
	{
		this.userId = userId;
	}
	public int getManufacturerId()
	{
		return manufacturerId;
	}
	public void setManufacturerId(int manufacturerId)
	{
		this.manufacturerId = manufacturerId;
	}
	public int getProductGradeId()
	{
		return productGradeId;
	}
	public void setProductGradeId(int productGradeId)
	{
		this.productGradeId = productGradeId;
	}
	public int getProductGenreId()
	{
		return productGenreId;
	}
	public void setProductGenreId(int productGenreId)
	{
		this.productGenreId = productGenreId;
	}
	public int getProductSizeId()
	{
		return productSizeId;
	}
	public void setProductSizeId(int productSizeId)
	{
		this.productSizeId = productSizeId;
	}
	public String getWorkName()
	{
		return workName;
	}
	public void setWorkName(String workName)
	{
		this.workName = workName;
	}
	public String getCharacterName()
	{
		return characterName;
	}
	public void setCharacterName(String characterName)
	{
		this.characterName = characterName;
	}
	public String getPurchaseDateTime()
	{
		return purchaseDateTime;
	}
	public void setPurchaseDateTime(String purchaseDateTime)
	{
		this.purchaseDateTime = purchaseDateTime;
	}
	public int getIsOpened()
	{
		return isOpened;
	}
	public void setIsOpened(int isOpened)
	{
		this.isOpened = isOpened;
	}
	public int getIsPartsMissing()
	{
		return isPartsMissing;
	}
	public void setIsPartsMissing(int isPartsMissing)
	{
		this.isPartsMissing = isPartsMissing;
	}
	public String getDescriptions()
	{
		return descriptions;
	}
	public void setDescriptions(String descriptions)
	{
		this.descriptions = descriptions;
	}
	public String getImagePath1()
	{
		return imagePath1;
	}
	public void setImagePath1(String imagePath1)
	{
		this.imagePath1 = imagePath1;
	}
	public String getImagePath2()
	{
		return imagePath2;
	}
	public void setImagePath2(String imagePath2)
	{
		this.imagePath2 = imagePath2;
	}
	public String getImagePath3()
	{
		return imagePath3;
	}
	public void setImagePath3(String imagePath3)
	{
		this.imagePath3 = imagePath3;
	}
	public int getIsPublic()
	{
		return isPublic;
	}
	public void setIsPublic(int isPublic)
	{
		this.isPublic = isPublic;
	}
	public String getCreatedAt()
	{
		return createdAt;
	}
	public void setCreatedAt(String createdAt)
	{
		this.createdAt = createdAt;
	}

	// ── VW_PRODUCT_LIST 조인 컬럼
	public String getManufacturerName()
	{
		return manufacturerName;
	}
	public void setManufacturerName(String manufacturerName)
	{
		this.manufacturerName = manufacturerName;
	}
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
	public String getProductGradeName()
	{
		return productGradeName;
	}
	public void setProductGradeName(String productGradeName)
	{
		this.productGradeName = productGradeName;
	}
	public String getProductGenreName()
	{
		return productGenreName;
	}
	public void setProductGenreName(String productGenreName)
	{
		this.productGenreName = productGenreName;
	}
	public String getProductSizeName()
	{
		return productSizeName;
	}
	public void setProductSizeName(String productSizeName)
	{
		this.productSizeName = productSizeName;
	}
	public String getIsOpenedName()
	{
		return isOpenedName;
	}
	public void setIsOpenedName(String isOpenedName)
	{
		this.isOpenedName = isOpenedName;
	}
	public String getIsPartsMissingName()
	{
		return isPartsMissingName;
	}
	public void setIsPartsMissingName(String isPartsMissingName)
	{
		this.isPartsMissingName = isPartsMissingName;
	}
	public String getIsPublicName()
	{
		return isPublicName;
	}
	public void setIsPublicName(String isPublicName)
	{
		this.isPublicName = isPublicName;
	}

	// ── 추가 이미지 (IMAGE_PATH_4 ~ 10)
	public String getImagePath4()
	{
		return imagePath4;
	}
	public void setImagePath4(String imagePath4)
	{
		this.imagePath4 = imagePath4;
	}
	public String getImagePath5()
	{
		return imagePath5;
	}
	public void setImagePath5(String imagePath5)
	{
		this.imagePath5 = imagePath5;
	}
	public String getImagePath6()
	{
		return imagePath6;
	}
	public void setImagePath6(String imagePath6)
	{
		this.imagePath6 = imagePath6;
	}
	public String getImagePath7()
	{
		return imagePath7;
	}
	public void setImagePath7(String imagePath7)
	{
		this.imagePath7 = imagePath7;
	}
	public String getImagePath8()
	{
		return imagePath8;
	}
	public void setImagePath8(String imagePath8)
	{
		this.imagePath8 = imagePath8;
	}
	public String getImagePath9()
	{
		return imagePath9;
	}
	public void setImagePath9(String imagePath9)
	{
		this.imagePath9 = imagePath9;
	}
	public String getImagePath10()
	{
		return imagePath10;
	}
	public void setImagePath10(String imagePath10)
	{
		this.imagePath10 = imagePath10;
	}
}
