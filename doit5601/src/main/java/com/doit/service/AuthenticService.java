package com.doit.service;

import java.sql.SQLException;

import com.doit.dao.AuthenticDAO;
import com.doit.dto.UserInfoDTO;

public class AuthenticService {

	public static String signUp(UserInfoDTO dto, String userPwdChk) {
		AuthenticDAO dao = new AuthenticDAO();
		
		try {
			dao.signUp(dto, userPwdChk);
			
			return "SUCCESS";
			
			
		} catch (SQLException e) {
			
			String errMsg = e.getMessage();
			
//			if (dbMsg.contains("ORA-20001")) return "이미 사용 중인 아이디입니다.";
//            if (dbMsg.contains("ORA-20002")) return "비밀번호 확인이 일치하지 않습니다.";
//            
//            return "가입 처리 중 오류 발생: " + dbMsg;
			
			if (errMsg.contains(": ")) {
	            return errMsg.split(": ")[1].trim().split("O")[0]; 
	        }
	        
	        return errMsg;
			
		}
	}
	

	
}
