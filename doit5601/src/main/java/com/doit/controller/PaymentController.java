package com.doit.controller;

import java.io.IOException;
import java.util.Date;

import com.doit.dao.ProductBuyDAO;
import com.doit.dto.BidActionDTO;
import com.doit.dto.MoneyChargeHistoryDTO;
import com.doit.dto.PaymentDetailDTO;
import com.doit.dto.UserInfoDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@WebServlet("/payment/*")
public class PaymentController extends HttpServlet
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
		String uri = request.getRequestURI();
		
		if(uri.endsWith("/charge"))
		{
			charge(request, response);
			return;
		}
		
		if(uri.endsWith("/success"))
		{
			success(request, response);
			return;
		}
		if(uri.endsWith("/successPage"))
		{
			successPage(request, response);
			return;
		}
		if(uri.endsWith("/takefail"))
		{
			takefail(request, response);
			return;
		}
		if(uri.endsWith("/takefailSuccess"))
		{
			takefailSuccess(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/money/moneyChargeHome.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void charge(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String cp = request.getContextPath();
		
		HttpSession session = request.getSession();
		UserInfoDTO user = (UserInfoDTO) session.getAttribute("loginUser");

		
		if (user == null) { 
            response.sendRedirect(cp + "/user/auth/login");
            return;
        }
		
		int userId = user.getUserId();
		
		Integer paymentType = Integer.parseInt(request.getParameter("btnradio"));
		Integer chargeMoney = Integer.parseInt(request.getParameter("chargeMoney"));
		
		ProductBuyDAO dao = new ProductBuyDAO();
		
		MoneyChargeHistoryDTO dto = new MoneyChargeHistoryDTO();
		
		dto.setUserId(userId);
		dto.setMoneyChargeMethodId(paymentType);
		dto.setChargeAmount(chargeMoney);
		
		boolean result = false;
		try
		{
			result = dao.moneyCharge(dto);
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		
		int totalMoney = dao.moneyCheck(userId);
		
		request.setAttribute("chargeMoney", chargeMoney);
		request.setAttribute("totalMoney", totalMoney);
	
		if(result)
		{
			request.setAttribute("message", "충전이 완료되었습니다");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/money/charge.jsp");
			dispatcher.forward(request, response);
		}else
		{
			request.setAttribute("message", "충전이 완료되지않았습니다");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/money/charge.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	protected void success(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		String cp = request.getContextPath();
		HttpSession session = request.getSession();
		UserInfoDTO user = (UserInfoDTO) session.getAttribute("loginUser");

		if (user == null) { 
            response.sendRedirect(cp + "/user/auth/login");
            return;
        }
		int userId = user.getUserId();
		
		String bidStr = request.getParameter("bid");
		String amountStr = request.getParameter("price");
		
		int bid = 1; 

		if (bidStr != null && !bidStr.trim().isEmpty()) {
		    try {
		    	bid = Integer.parseInt(request.getParameter("bid"));
		    } catch (NumberFormatException e) {
		       
		    	bid = 1;
		    }
		}
		
		int amount = 1; 

		if (amountStr != null && !amountStr.trim().isEmpty()) {
		    try {
		    	amount = Integer.parseInt(request.getParameter("price"));
		    } catch (NumberFormatException e) {
		       
		    	amount = 1;
		    }
		}
		
		ProductBuyDAO dao = new ProductBuyDAO();
		BidActionDTO dto = new BidActionDTO(userId, bid, amount);
		
		
		Date today = new java.util.Date();
		
		request.setAttribute("today",today );
		
		int result = dao.paymentBid(dto);
		System.out.println("결제가격"+dto.getAmount());
		System.out.println("결제낙찰"+dto.getBidResultId());
		System.out.println("결제유저"+dto.getUserId());
		System.out.println(result);
		
		String img =  request.getParameter("img");
		String title = request.getParameter("title");
		String grade = request.getParameter("grade");
		String manudacturer = request.getParameter("manudacturer");
		String price = request.getParameter("price");

		String url = "?bid="+bid+"&price="+price;
		
		if(result > 0)
		{
			request.setAttribute("massage", "결제가 완료되었습니다!");
			//url += "&type=1";
			//response.sendRedirect(cp+"/payment/successPage"+url);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/mypage/success.jsp");
			dispatcher.forward(request, response);
			return;
		}else
		{
			request.setAttribute("massage", "결제가 실패하였습니다..");
			//url += "&type=2";
			//response.sendRedirect(cp+"/payment/successPage"+url);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/mypage/success.jsp");
			dispatcher.forward(request, response);
			return;
		}
		
		
		
	}
	
	protected void successPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		Date today = new java.util.Date();
		
		request.setAttribute("today",today );
		
		String img =  request.getParameter("img");
		String title = request.getParameter("title");
		String grade = request.getParameter("grade");
		String manudacturer = request.getParameter("manudacturer");
		String price = request.getParameter("price");
		
		request.setAttribute("img", img);
		request.setAttribute("title", title);
		request.setAttribute("grade", grade);
		request.setAttribute("manudacturer", manudacturer);
		request.setAttribute("price", price);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/mypage/success.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void takefail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String cp = request.getContextPath();
		HttpSession session = request.getSession();
		UserInfoDTO user = (UserInfoDTO) session.getAttribute("loginUser");

		if (user == null) { 
            response.sendRedirect(cp + "/user/auth/login");
            return;
        }
		int userId = user.getUserId();
		
		String bidStr = request.getParameter("bid");
		String amountStr = request.getParameter("price");
		
		int bid = 1; 

		if (bidStr != null && !bidStr.trim().isEmpty()) {
		    try {
		    	bid = Integer.parseInt(request.getParameter("bid"));
		    } catch (NumberFormatException e) {
		       
		    	bid = 1;
		    }
		}
		
		int amount = 1; 

		if (amountStr != null && !amountStr.trim().isEmpty()) {
		    try {
		    	amount = Integer.parseInt(request.getParameter("price"));
		    } catch (NumberFormatException e) {
		       
		    	amount = 1;
		    }
		}
		
		request.setAttribute("userId", userId);
		request.setAttribute("bidId", bid);
		request.setAttribute("amount", amount);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/mypage/takefail.jsp");
		dispatcher.forward(request, response);
		
	}
	
	protected void takefailSuccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String cp = request.getContextPath();
		HttpSession session = request.getSession();
		UserInfoDTO user = (UserInfoDTO) session.getAttribute("loginUser");

		if (user == null) { 
            response.sendRedirect(cp + "/user/auth/login");
            return;
        }
		int userId = user.getUserId();
		
		String bidStr = request.getParameter("bid");
		String amountStr = request.getParameter("price");
		String resultIdStr = request.getParameter("resultId");
		
		int bid = 1; 

		if (bidStr != null && !bidStr.trim().isEmpty()) {
		    try {
		    	bid = Integer.parseInt(request.getParameter("bid"));
		    } catch (NumberFormatException e) {
		       
		    	bid = 0;
		    }
		}
		
		int amount = 1; 

		if (amountStr != null && !amountStr.trim().isEmpty()) {
		    try {
		    	amount = Integer.parseInt(request.getParameter("price"));
		    } catch (NumberFormatException e) {
		       
		    	amount = 0;
		    }
		}
		
		int resultId = 1; 

		if (resultIdStr != null && !resultIdStr.trim().isEmpty()) {
		    try {
		    	resultId = Integer.parseInt(request.getParameter("resultId"));
		    } catch (NumberFormatException e) {
		       
		    	resultId = 0;
		    }
		}
		
		ProductBuyDAO dao = new ProductBuyDAO();
		
		BidActionDTO dto = new BidActionDTO(userId, resultId, amount);
		
		int result = dao.failBid(dto);
		
		String takefailYN = "";
		
		if(result > 0)
		{
			takefailYN = "Y";
		}else
		{
			takefailYN = "N";
		}
		System.out.println("takefailYN:"+takefailYN);
		response.sendRedirect(cp+"/user/products?takefailYN="+takefailYN);

	}
}
