package com.doit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.doit.dao.AuthenticDAO;
import com.doit.dto.UserInfoDTO;
import com.doit.service.AuthenticService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/auth/*")
public class AuthController extends HttpServlet{

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

		String uri = request.getRequestURI();
		
		// 로그인페이지 이동
		if(uri.endsWith("/user/auth/login")) {
			request.getRequestDispatcher("/WEB-INF/views/user/auth/login.jsp").forward(request, response);
		
		// 로그인요청
		}else if(uri.endsWith("/user/auth/loginAction")) {

			
			String loginId = request.getParameter("userId");
			String loginPw = request.getParameter("userPwd");
			String check = request.getParameter("check");
			
			if (loginId != null) 
				loginId = loginId.trim();
			
			UserInfoDTO loginUser = new UserInfoDTO();
			
			loginUser = AuthenticDAO.authenticateUser(loginId, loginPw);
			
			if(loginUser !=null) {
				// 성공 -> 세션에 담기
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				
				Cookie id = new Cookie("loginId", loginId);
				if(check!=null && check.equals("on")) {
					id.setMaxAge(3600*24*7);
				}else {
					id.setMaxAge(0);
				}
				response.addCookie(id);

				response.sendRedirect(request.getContextPath()+"/main");
				
				
			}else {
				// 실패 -> 로그인실패 메시지 담기
				request.setAttribute("errMsg", "아이디 또는 비밀번호가 틀렸습니다.");
				request.getRequestDispatcher("/WEB-INF/views/user/auth/login.jsp").forward(request, response);
			}
			
		// 로그아웃 요청	
		}else if(uri.endsWith("/user/auth/logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/main");
			
		// 아이디 찾기 페이지 이동	
		}else if(uri.endsWith("/user/auth/find-id")) {
			request.getRequestDispatcher("/WEB-INF/views/user/auth/findId.jsp").forward(request, response);
		
		// 아이디 찾기 요청
		}else if(uri.endsWith("/user/auth/find-id-action")) {
			
			String findName = request.getParameter("findIdName");
			String findEmail = request.getParameter("findIdEmail");
			
			
			String findId  = AuthenticDAO.findId(findName, findEmail);
			
			if(findId!=null) {
				request.setAttribute("findId", findId);
			}else {
				request.setAttribute("errMsg", "일치하는 회원 정보가 존재하지 않습니다.");
			}
			request.getRequestDispatcher("/WEB-INF/views/user/auth/findId.jsp").forward(request, response);
		
		// 비밀번호 찾기 페이지 이동
		}else if(uri.endsWith("/user/auth/find-pw")) {
			request.getRequestDispatcher("/WEB-INF/views/user/auth/findPwd.jsp").forward(request, response);
			
		// 비밀번호 찾기 요청
		}else if(uri.endsWith("/user/auth/find-pw-action")) {
			
			String findId = request.getParameter("findPwId");
			String findName = request.getParameter("findPwName");
			String findEmail = request.getParameter("findPwEmail");
			
			String findPw = AuthenticDAO.findPw(findId, findName, findEmail);
			
			if(findPw!=null) {
				request.setAttribute("findPw", findPw);
			}else {
				request.setAttribute("errMsg", "일치하는 회원 정보가 존재하지 않습니다.");
			}
			request.getRequestDispatcher("/WEB-INF/views/user/auth/findPwd.jsp").forward(request, response);
		
		// 회원가입 페이지 이동
		}else if(uri.endsWith("/user/auth/sign-up")) {
			request.getRequestDispatcher("/WEB-INF/views/user/auth/signUp.jsp").forward(request, response);
		
		// 회원가입 요청
		}else if(uri.endsWith("/user/auth/sign-up-action")) {
			
			String userId = request.getParameter("userId");
			String userPwd = request.getParameter("userPwd");
			String userPwdChk = request.getParameter("userPwdCheck");
			String userName = request.getParameter("userName");
			String userSsn1 = request.getParameter("userSsn1");
			String userSsn2 = request.getParameter("userSsn2");
			String userEmail = request.getParameter("userEmail");
			String userPhone1 = request.getParameter("userPhone1");
			String userPhone2 = request.getParameter("userPhone2");
			String userPhone3 = request.getParameter("userPhone3");
			String zipcode = request.getParameter("zipcode");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
		
			String userSsn = userSsn1+userSsn2;
			String userPhone = userPhone1+userPhone2+userPhone3;
			
			
			UserInfoDTO dto = new UserInfoDTO();
			dto.setUserLoginId(userId);
			dto.setUserPassword(userPwd);
			dto.setUserName(userName);
			dto.setUserSsn(userSsn);
			dto.setUserEmail(userEmail);
			dto.setUserPhone(userPhone);
			dto.setUserZipcode(zipcode);
			dto.setUserAddress(addr1);
			dto.setUserAddressDetail(addr2);
			
			
			String result = AuthenticService.signUp(dto, userPwdChk);
			
			if ("SUCCESS".equals(result)) {
				request.getRequestDispatcher("/WEB-INF/views/user/auth/signUpOk.jsp").forward(request, response);
			} else {
			    request.setAttribute("errMsg", result);
			    request.getRequestDispatcher("/WEB-INF/views/user/auth/signUpFail.jsp").forward(request, response);
			}
			
		}else if(uri.endsWith("/user/auth/id-check")) {
			String userId = request.getParameter("userId");
			
			AuthenticDAO dao = new AuthenticDAO();
			int result = dao.idCheck(userId);

			response.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = response.getWriter();
		    
		    if(result==0) {
		        out.print("AVAILABLE");
		    } else {
		        out.print("DUPLICATED");
		    }
		    out.flush();
		    return; 
		}
	}
}
