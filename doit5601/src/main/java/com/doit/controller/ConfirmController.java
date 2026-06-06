package com.doit.controller;

import java.io.IOException;

import com.doit.dao.ProductBuyDAO;
import com.doit.dto.BidActionDTO;
import com.doit.dto.UserInfoDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/purchaseConfirmAction")
public class ConfirmController extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String bidIdStr = request.getParameter("bidId");
        
        int bidId = 0;
        
        if (bidIdStr != null && !bidIdStr.trim().isEmpty()) {
		    try {
		    	bidId = Integer.parseInt(request.getParameter("bidId"));
		    } catch (NumberFormatException e) {
		       
		    	bidId = 1;
		    }
		}
        String cp = request.getContextPath();
		
		HttpSession session = request.getSession();
		UserInfoDTO user = (UserInfoDTO) session.getAttribute("loginUser");

		
		if (user == null) { 
            response.sendRedirect(cp + "/user/auth/login");
            return;
        }
		
		int userId = user.getUserId();
        // DAO 객체 생성 및 프로시저 호출
        ProductBuyDAO dao = new ProductBuyDAO();
        BidActionDTO dto = new BidActionDTO(userId,bidId,0);
        int result = dao.confirmBid(dto); // 
        
        
        // 응답 보내기
        response.setContentType("text/plain; charset=UTF-8");
        
        if (result > 0) {
            response.getWriter().write("success"); // 성공 시 
        } else {
            response.getWriter().write("fail");    // 실패 시 
        }
    }
}

