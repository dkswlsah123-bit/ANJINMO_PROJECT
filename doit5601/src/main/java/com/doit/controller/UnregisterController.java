package com.doit.controller;

import java.io.IOException;

import com.doit.dao.ProductBuyDAO;
import com.doit.dto.UserInfoDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/unregister/*")
public class UnregisterController extends HttpServlet{

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
		
		String url = request.getRequestURI();
		
		if(url.endsWith("/suc"))
		{
			suc(request, response);
			return;
		}
		
		
		String cp = request.getContextPath();
		
		HttpSession session = request.getSession();
		UserInfoDTO user = (UserInfoDTO) session.getAttribute("loginUser");

		
		if (user == null) { 
            response.sendRedirect(cp + "/user/auth/login");
            return;
        }
		
		int userId = user.getUserId();
		
		request.setAttribute("name", user.getUserName());
		request.setAttribute("userId", user.getUserLoginId());
		request.setAttribute("money", user.getTotalMoney());
		request.setAttribute("password", user.getUserPassword());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/mypage/unregister.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void suc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cp = request.getContextPath();
		
		HttpSession session = request.getSession();
		UserInfoDTO user = (UserInfoDTO) session.getAttribute("loginUser");

		
		if (user == null) { 
            response.sendRedirect(cp + "/user/auth/login");
            return;
        }
		
		int userId = user.getUserId();
		
		String password = request.getParameter("password");
		
		if(password.equals(user.getUserPassword()))
		{
			ProductBuyDAO dao = new ProductBuyDAO();
			
			int result = dao.unregist(userId);
			
			if(result > 0)
			{
				response.sendRedirect(cp+"/main");
			}else
			{
				response.sendRedirect(cp+"/unregister");
			}
			
			
		}else
		{
			response.sendRedirect(cp+"/unregister");
		}
		
		
	}
}
