package com.doit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.doit.dao.AuctionDAO;
import com.doit.dto.UserInfoDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/bid/insert")
public class BidInsertController extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("[BidInsertController] 입찰 요청 진입");
        
        HttpSession session = req.getSession();
        UserInfoDTO user = (UserInfoDTO) session.getAttribute("loginUser");

        // 1. 로그인 여부 확인
        if (user == null) {
            System.out.println("[BidInsertController] 로그인 정보 없음");
            resp.sendRedirect(req.getContextPath() + "/user/auth/login");
            return;
        }

        String auctionIdStr = req.getParameter("auctionId");
        String bidPriceStr = req.getParameter("bidPrice");
        
        System.out.println("[BidInsertController] 파라미터 확인 -> auctionId: " + auctionIdStr + ", bidPrice: " + bidPriceStr);

        try {
            // 2. 데이터 변환
            long auctionId = Long.parseLong(auctionIdStr);
            int bidPrice = Integer.parseInt(bidPriceStr);
            long userNo = user.getUserId();

            // 3. DAO 실행
            AuctionDAO dao = new AuctionDAO();
            String result = dao.insertBid(auctionId, userNo, bidPrice);
            
            System.out.println("[BidInsertController] 프로시저 결과: " + result);

            // 4. 응답 처리
            if ("SUCCESS".equals(result)) {
                // 성공 시 상세페이지로 이동
                resp.sendRedirect(req.getContextPath() + "/auction/detail?auctionId=" + auctionId + "&bidOk=1");
            } else {
                // 프로시저에서 반환한 에러 메시지 (금액 부족 등) 출력
                responseAlert(resp, result);
            }

        } catch (Exception e) {
            System.err.println("[BidInsertController] 에러 발생!");
            e.printStackTrace();
            responseAlert(resp, "데이터 처리 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

	private void responseAlert(HttpServletResponse resp, String msg) throws IOException {
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('" + msg + "');");
        out.println("history.back();");
        out.println("</script>");
        out.flush();
    }
    
    
    
    
    
    
    
    
}