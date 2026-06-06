package com.doit.controller;

import java.io.IOException;

import com.doit.dao.ProductBuyDAO;
import com.doit.dto.PaymentDetailDTO;
import com.doit.dto.UserInfoDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payment.detail")
public class PaymentDetailController extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String resultStr = request.getParameter("resultId");
		String cp = request.getContextPath();
		
		HttpSession session = request.getSession();
		UserInfoDTO user = (UserInfoDTO) session.getAttribute("loginUser");

		
		if (user == null) { 
            response.sendRedirect(cp + "/user/auth/login");
            return;
        }
		
		int userId = user.getUserId();
		
		int resultId = 1;
		
		
		if (resultStr != null && !resultStr.trim().isEmpty()) {
		    try {
		    	resultId = Integer.parseInt(request.getParameter("resultId"));
		    } catch (NumberFormatException e) {
		       
		    	resultId = 0;
		    }
		}
		
		
		request.setAttribute("resultId", resultId);
		
		
		ProductBuyDAO dao = new ProductBuyDAO();
		
		
		PaymentDetailDTO dto = dao.takeItem(resultId);
		
		int money = dao.moneyCheck(userId);
		
		System.out.println(dto.getUserName());
		
		request.setAttribute("detail", dto);
		
		request.setAttribute("money", money);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/mypage/successBidBuy.jsp");
		dispatcher.forward(request, response);
	}
	
}
