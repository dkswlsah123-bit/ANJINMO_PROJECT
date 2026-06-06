package com.doit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.doit.dto.UserInfoDTO;
import com.doit.util.DBCPConn;

public class AuthenticDAO {

	// 로그인 인증 메소드
	public static UserInfoDTO authenticateUser(String userId, String userPwd) {
		UserInfoDTO dto = null;
		String sql = """
					SELECT USER_ID, USER_LOGIN_ID, USER_PASSWORD
					,USER_NAME, USER_SSN, USER_EMAIL, USER_PHONE
					, USER_ZIPCODE, USER_ADDRESS, USER_ADDRESS_DETAIL
					, TOTAL_MONEY, CREATED_AT, DELETED_AT
					FROM VW_USER_INFO
					WHERE USER_LOGIN_ID = ? AND USER_PASSWORD = ?
					AND DELETED_AT IS NULL
					""";
		try (Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			try(ResultSet rs = pstmt.executeQuery()) {
				if(rs.next()) {
					dto = new UserInfoDTO();
					
					dto.setUserId(rs.getInt("USER_ID"));
					dto.setUserLoginId(rs.getString("USER_LOGIN_ID"));
					dto.setUserPassword(rs.getString("USER_PASSWORD"));
					dto.setUserName(rs.getString("USER_NAME"));
					dto.setUserSsn(rs.getString("USER_SSN"));
					dto.setUserEmail(rs.getString("USER_EMAIL"));
					dto.setUserPhone(rs.getString("USER_PHONE"));
					dto.setUserZipcode(rs.getString("USER_ZIPCODE"));
					dto.setUserAddress(rs.getString("USER_ADDRESS"));
					dto.setUserAddressDetail(rs.getString("USER_ADDRESS_DETAIL"));
					dto.setTotalMoney(rs.getInt("TOTAL_MONEY"));
					dto.setCreatedAt(rs.getString("CREATED_AT"));
					dto.setDeletedAt(rs.getString("DELETED_AT"));
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//아이디 찾기 메소드
	public static String findId(String userName, String userEmail) {
		String findId = null;
		String sql ="""
				SELECT USER_LOGIN_ID
				FROM VW_USER_INFO
				WHERE USER_NAME = ? AND USER_EMAIL=?
				""";
		try(Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);
			
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					findId = rs.getString("USER_LOGIN_ID");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return findId;
	}
	
	
	// 비밀번호 찾기 메소드
	public static String findPw(String userId, String userName, String userEmail) {
		String findPw = null;
		String sql ="""
				SELECT USER_PASSWORD
				FROM VW_USER_INFO
				WHERE USER_LOGIN_ID =? AND USER_NAME = ? AND USER_EMAIL=?
				""";
		try(Connection conn = DBCPConn.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
				
				pstmt.setString(1, userId);
				pstmt.setString(2, userName);
				pstmt.setString(3, userEmail);
				
				try(ResultSet rs = pstmt.executeQuery()){
					if(rs.next()) {
						findPw = rs.getString("USER_PASSWORD");
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		return findPw;
	}
	
	// 회원가입 프로시저 
	public void signUp(UserInfoDTO dto, String userPwdChk) throws SQLException{
		
		String sql = "{call PRC_USER_SIGNUP(?,?,?,?,?,?,?,?,?,?)}";
		
		try(Connection conn = DBCPConn.getConnection();
			CallableStatement cstmt = conn.prepareCall(sql)) {
			
			cstmt.setString(1, dto.getUserLoginId());
			cstmt.setString(2, dto.getUserPassword());
			cstmt.setString(3, userPwdChk);
			cstmt.setString(4, dto.getUserName());
			cstmt.setString(5, dto.getUserSsn());
			cstmt.setString(6, dto.getUserEmail());
			cstmt.setString(7, dto.getUserPhone());
			cstmt.setString(8, dto.getUserZipcode());
			cstmt.setString(9, dto.getUserAddress());
			cstmt.setString(10, dto.getUserAddressDetail());
			
			cstmt.execute();
			
		}		
		
	}
	
	// 아이디 중복 확인 
	public int idCheck(String userId) {
		int result = 0;
		String sql = """
				SELECT COUNT(*) AS COUNT
				FROM USER_ACCOUNT
				WHERE USER_LOGIN_ID = ?
				""";
		try(Connection conn = DBCPConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setString(1, userId);
			
			try(ResultSet rs = pstmt.executeQuery()) {
				if(rs.next()) {
					result = rs.getInt("COUNT");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
