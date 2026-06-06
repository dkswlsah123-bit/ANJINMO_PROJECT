package com.doit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.doit.dao.AdminUserDAO;
import com.doit.jydto.ShowUserDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/show-user-detail")
public class ShowUserDetailController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    String userKeyStr = req.getParameter("userKey");
	    
	    if (userKeyStr == null || userKeyStr.isEmpty()) {
	        resp.sendRedirect(req.getContextPath() + "/admin/show-all-users");
	        return;
	    }
	    
	    AdminUserDAO dao = new AdminUserDAO();
	    
	    try {
	        int userKey = Integer.parseInt(userKeyStr);
	        ShowUserDTO user = dao.showUserDetail(userKey);
	        
	        if (user != null) {
	            req.setAttribute("user", user);
	            // [수정] 파일명을 userDetail.jsp -> showUserDetail.jsp 로 변경
	            req.getRequestDispatcher("/WEB-INF/views/admin/showUserDetail.jsp").forward(req, resp);
	        } else {
	            resp.sendRedirect(req.getContextPath() + "/admin/show-all-users");
	        }
	    
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	
	    try {
	        int userKey = Integer.parseInt(userKeyStr);
	        System.out.println("조회하려는 userKey: " + userKey); // 확인용

	        ShowUserDTO user = dao.showUserDetail(userKey);
	        System.out.println("DB 조회 결과: " + user); // null인지 확인용
	        
	        if (user != null) {
	            req.setAttribute("user", user);
	            req.getRequestDispatcher("/WEB-INF/views/admin/showUserDetail.jsp").forward(req, resp);
	        } else {
	            System.out.println("데이터가 없어서 리다이렉트 합니다.");
	            resp.sendRedirect(req.getContextPath() + "/admin/show-all-users");
	        }
	    } catch (Exception e) {
	        System.out.println("에러 발생!");
	        e.printStackTrace();
	    }
	
	}
}