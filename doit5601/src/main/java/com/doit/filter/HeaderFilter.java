package com.doit.filter;

import java.io.IOException;

import com.doit.dao.ProductBuyDAO;
import com.doit.dto.UserInfoDTO;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns="/*")
public class HeaderFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession();
		
		UserInfoDTO user = (UserInfoDTO) session.getAttribute("loginUser");

		ProductBuyDAO moneyDao = new ProductBuyDAO();
		
	    if (user != null) {
	        int currentMoney = moneyDao.moneyCheck(user.getUserId());
	        request.setAttribute("currentMoney", currentMoney);
	    }
	    chain.doFilter(request, response);
	}

	

	
}
