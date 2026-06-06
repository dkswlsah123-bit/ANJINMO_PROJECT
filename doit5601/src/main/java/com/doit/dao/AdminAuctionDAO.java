package com.doit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.doit.dto.AuctionDTO;
import com.doit.util.DBCPConn;

public class AdminAuctionDAO
{
	//-- 메서드 --//
	// 경매 총 갯수 가져오기
	public int selectAuctionTotalCount(String auctionStatus)
	{
		int result = 0;
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS TOTAL_COUNT FROM VW_AUCTION_LIST";
		
		if (auctionStatus.equalsIgnoreCase("active"))
		{
			sql += " WHERE IS_FINISHED = '진행중'";
		}
		else if (auctionStatus.equalsIgnoreCase("closed"))
		{
			sql += " WHERE IS_FINISHED = '마감'";
		}
		
		
		// DB 작업 수행
		try(Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();)
		{
			if (rs.next())
			{
				result = rs.getInt("TOTAL_COUNT");
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("DB 작업중 에러 발생: " + e.getMessage(), e);
		}
		
		return result;
	}
	
	
	
	// 경매 리스트 가져오기
	public List<AuctionDTO> selectAuctionList(String auctionStatus, int page, int sizePerPage)
	{
		List<AuctionDTO> result = new ArrayList<>();
		
		
		// 쿼리문 준비 (1/2)
		String sql = "SELECT *"
					+ " FROM ("
					+ "	SELECT"
					+ "		ROW_NUMBER() OVER(ORDER BY AUCTION_ID DESC) AS AUCTION_NUM"
					+ "		, AUCTION_ID"
					+ "		, USER_ID"
					+ "		, AUCTION_TITLE"
					+ "		, TO_CHAR(AUCTION_END_DATE, 'YYYY-MM-DD HH24:MI:SS') AS AUCTION_END_DATE"
					+ "		, IS_FINISHED"
					+ "		, IMAGE_PATH_1"
					+ "		, BID_CURRENT_PRICE"
					+ "		, BID_MAX_PRICE"
					+ "		, BID_COUNT"
					+ "	FROM VW_AUCTION_LIST";
		
		if (auctionStatus.equalsIgnoreCase("active"))
		{
			sql += " WHERE IS_FINISHED = '진행중'";
		}
		else if (auctionStatus.equalsIgnoreCase("closed"))
		{
			sql += " WHERE IS_FINISHED = '마감'";
		}
		
		
		// 쿼리문 준비 (2/2)
		sql +=  ")"
				+ " WHERE AUCTION_NUM >= ?"		// 시작번호 
				+ "  AND AUCTION_NUM <= ?";		// 끝 번호
		
		
		
		// 현재 페이지의 데이터 시작 번호, 끝 번호 구하기
		int dataStartNum = (page - 1) * sizePerPage + 1;
		int dataEndNum = page * sizePerPage;
		
		// DB 작업 수행
		try(Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			pstmt.setInt(1, dataStartNum);
			pstmt.setInt(2, dataEndNum);

			try(ResultSet rs = pstmt.executeQuery();)
			{
				while (rs.next())
				{
					AuctionDTO dto = new AuctionDTO();
					
					dto.setAuctionId(rs.getInt("AUCTION_ID"));
					dto.setUserId(rs.getInt("USER_ID"));
					dto.setAuctionTitle(rs.getString("AUCTION_TITLE"));
					dto.setAuctionEndDate(rs.getString("AUCTION_END_DATE"));
					dto.setIsFinished(rs.getString("IS_FINISHED"));
					dto.setImagePath1(rs.getString("IMAGE_PATH_1"));
					dto.setBidCurrentPrice(rs.getInt("BID_CURRENT_PRICE"));
					dto.setBidMaxPrice(rs.getInt("BID_MAX_PRICE"));
					dto.setBidCount(rs.getInt("BID_COUNT"));
					
					result.add(dto);
				}
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("DB 작업 중 에러 발생: " + e.getMessage(), e);
		}
		
		return result;
	}

}// class AdminAuctionDAO END