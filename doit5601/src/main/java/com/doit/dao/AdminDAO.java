package com.doit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.doit.dto.AdminDTO;
import com.doit.util.DBCPConn;

public class AdminDAO {
	
	
    // 관리자 계정, 프로필, 이름, 권한명을 한 번에 가져오는 메소드
	public AdminDTO getAdmin(String adminId, String adminPwd) {
	    AdminDTO dto = null;
	    // 이력을 체크하는 JOIN을 빼고 계정과 권한만 먼저 확인합니다.
	    String sql = """
	                SELECT A.ADMIN_LOGIN_ID, R.ADMIN_ROLE_NAME, A.ADMIN_ACCOUNT_ID
	                FROM ADMIN_ACCOUNT A
	                JOIN ADMIN_ROLE R ON A.ADMIN_ROLE_ID = R.ADMIN_ROLE_ID
	                WHERE A.ADMIN_LOGIN_ID = ? AND A.ADMIN_PASSWORD = ?
	                """;

	    try (Connection conn = DBCPConn.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setString(1, adminId);
	        pstmt.setString(2, adminPwd);
	        
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                dto = new AdminDTO();
	                dto.setAdminLoginId(rs.getString("ADMIN_LOGIN_ID"));
	                dto.setAdminRoleName(rs.getString("ADMIN_ROLE_NAME"));
	                // 이름과 부서는 프로필 테이블이 없으면 임시값으로 세팅
	                dto.setEmployeeName("관리자"); 
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return dto;
	}
}
