package com.doit.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//@WebServlet("/auction/detail") 
public class AuctionDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //파라미터 받기
        String auctionId = req.getParameter("auctionId");  
        // DB  ex) AuctionVO auction = service.getAuctionDetail(auctionId);
        
        // 임시 데이터
        Map<String, Object> dummyAuction = new HashMap<>();
        dummyAuction.put("auctionTitle", "하츠네 미쿠 한정판 (테스트)");
        dummyAuction.put("currentPrice", 250000);
        dummyAuction.put("remainSeconds", 3600); 
        dummyAuction.put("startPrice", 100000);
        dummyAuction.put("bidUnit", 10000);
        dummyAuction.put("mainImage", "miku2.jpg");
        
        //  세션 및 로직 처리
        HttpSession session = req.getSession();
        Object loginUser = session.getAttribute("loginUser");
        
        String viewStatus = "ongoing_guest";
        int remainSeconds = (int) dummyAuction.get("remainSeconds");
        boolean isWinner = false; 
        
        if (remainSeconds <= 0) {
            if (loginUser == null) viewStatus = "finished_guest";
            else if (isWinner) viewStatus = "finished_winner";
            else viewStatus = "finished_user";
        } else {
            if (loginUser != null) viewStatus = "ongoing_user";
        }

        //  데이터 바인딩
        req.setAttribute("auction", dummyAuction);
        req.setAttribute("viewStatus", viewStatus);
        req.setAttribute("bidCount", 5);
        
        // 뷰 이동
        String view = "/gangmyeongcheol_jsp/auctionDetail.jsp";
        RequestDispatcher dispatcher = req.getRequestDispatcher(view);
        dispatcher.forward(req, resp);
    }
}