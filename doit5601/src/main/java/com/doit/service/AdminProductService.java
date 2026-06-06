package com.doit.service;

import java.util.ArrayList;
import java.util.List;

import com.doit.dao.AdminProductDAO;
import com.doit.dao.ProductDAO;
import com.doit.dto.ProductDTO;

public class AdminProductService
{
//-- 속성 --//
	private final AdminProductDAO adminProductDao;
	
//-- 생성자 --//
	public AdminProductService()
	{
		this.adminProductDao = new AdminProductDAO();
	}
	
//-- 메서드 --//
	
	// 상품 갯수 가져오기
	public int getProductCount(String productStatus)
	{
		int result = 0;
		
		result = adminProductDao.selectProductCount(productStatus);
		
		return result;
	}// getTotalProductCount() END
	
	
	// 상품 리스트 가져오기
	public List<ProductDTO> getProductList(String productStatus, int page, int sizePerPage)
	{
		List<ProductDTO> result = new ArrayList<>();
		
		result = adminProductDao.selectProductList(productStatus, page, sizePerPage);
		
		return result;
	}
	
	// 상품 공개 여부를 비공개로 변경
	public int changProductHide(int productId)
	{
		int result = 0;
		
		result = adminProductDao.updateProductHide(productId);
		
		return result;
	}
	
	
	// 상품 상세 조회
	public ProductDTO getProductDetail(int productId)
	{
		ProductDTO result = adminProductDao.selectProductDetail(productId);
		
		return result;
	}

}// class AdminProductService END