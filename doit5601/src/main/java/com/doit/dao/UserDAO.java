package com.doit.dao;

import java.sql.Connection;

import com.doit.util.DBCPConn;

public class UserDAO {
	
    public String connectionTest() {
        Connection conn = DBCPConn.getConnection();
        String result = "";
        
        try {
            if (conn != null) {
                result = "데이터베이스 연결 성공";
            } else {
                result = "데이터베이스 연결 실패";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBCPConn.close(conn);
        }
        
        return result;
    }
	
}
