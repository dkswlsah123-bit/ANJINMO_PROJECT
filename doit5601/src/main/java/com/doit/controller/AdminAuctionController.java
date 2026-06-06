package com.doit.controller;

import java.io.IOException;
import java.util.List;

import com.doit.dto.AuctionDTO;
import com.doit.service.AdminAuctionService;
import com.doit.util.Pagination;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/auction/*")
public class AdminAuctionController extends HttpServlet
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
	
//--------------------------------------------------------------------------------------------------------------------------------------
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String methodType = request.getMethod();
		String uri = request.getRequestURI();
		String path = uri.substring(request.getContextPath().length());
		
		String viewPath = "/WEB-INF/views";
		
		try
		{
			//-- GET 방식 요청 --//
			if (methodType.equalsIgnoreCase("GET"))
			{
				if (path.equalsIgnoreCase("/admin/auction/list"))
				{
					// 이전 페이지 (mainDashBoard.jsp, auctionList.jsp)에서 전달된 데이터 수신
					//-- auctionStatus, page
					String auctionStatus = request.getParameter("auctionStatus") == null ? "all" : request.getParameter("auctionStatus");
					int page = Integer.parseInt(request.getParameter("page") == null ? "1" : request.getParameter("page"));
					
					
					// Service 객체 생성
					AdminAuctionService adminAuctionService  = new AdminAuctionService();
					
					
					// 경매 총 갯수 가져오기
					int auctionTotalCount = adminAuctionService.getAuctionTotalCount(auctionStatus);
					
					// 경매 리스트 가져오기
					int sizePerPage = 10;
					List<AuctionDTO> auctionList = adminAuctionService.getAuctionList(auctionStatus, page, sizePerPage);
					
					// 경매의 페이지 엘리먼트 생성
					Pagination pagination = new Pagination();
					int totalPage = pagination.pageCount(auctionTotalCount, sizePerPage);
					
					String listUrl = uri + "?auctionStatus=" + auctionStatus;
					
					String pageElement = pagination.paging(page, totalPage, listUrl);
					
					
					
					// 데이터 request에 바인딩
					request.setAttribute("auctionStatus", auctionStatus);
					request.setAttribute("auctionTotalCount", auctionTotalCount);
					request.setAttribute("auctionList", auctionList);
					request.setAttribute("pageElement", pageElement);
					
					
					viewPath = viewPath + "/admin/auctionList.jsp";
				}
				
				request.getRequestDispatcher(viewPath).forward(request, response);
				return;
			}
			//-- POST 방식 요청 --//
			else if (methodType.equalsIgnoreCase("POST"))
			{
				
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}// process(...) END
}// class AdminAuctionController END