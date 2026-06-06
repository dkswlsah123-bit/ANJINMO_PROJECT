package com.doit.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin")
public class AdminMainController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		process(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		process(req, resp);
	}

//------------------------------------------------------------------------------------------------------------------------
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String viewPath = "/WEB-INF/views/admin/mainDashBoard.jsp";
		
		
		
		request.getRequestDispatcher(viewPath).forward(request, response);
		return;
	}// process(...) END
	
}// class AdminController END