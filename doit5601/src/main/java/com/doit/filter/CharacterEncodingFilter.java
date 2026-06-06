/*
	CharacterEncodingFilter.java
*/

package com.doit.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.http.HttpServletRequest;

//@WebFilter("/*")
@WebFilter
(	/*
	urlPatterns = "/*"
	, initParams =
	{
			@WebInitParam(name="charset", value="UTF-8")
			, @WebInitParam(name="forceEncoding", value="true")
			// 『forceEncoding』 → 기존 설정을 무시하고 이 인코딩을 강제로 적용할 것인지에 대한 설정.
	}
	*/

	urlPatterns = "/*"
	, initParams = @WebInitParam(name="charset", value="UTF-8")
)

public class CharacterEncodingFilter implements Filter
{

	private String charset;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException
	{
		// 필터의 초기 파라미터 값 설정
		charset = filterConfig.getInitParameter("charset");
		if(charset==null || charset.length()==0) {
			charset = "UTF-8";
		}
	}



	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException
	{
		if (req instanceof HttpServletRequest request)
		{
			if (request.getMethod().equalsIgnoreCase("POST"))
			{
				request.setCharacterEncoding(charset);
			}
		}
		chain.doFilter(req, resp);

	}

	@Override
	public void destroy()
	{
		// 인코딩 필터 운용 과정에서는 일반적으로 반납할 리소스 없음.
	}


}
