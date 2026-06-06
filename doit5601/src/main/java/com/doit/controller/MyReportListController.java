package com.doit.controller;

import java.io.IOException;
import java.util.List;

import com.doit.dao.ReportDAO;
import com.doit.jydto.ReportDTO;
import com.doit.dto.UserInfoDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/mypage/report-list")
public class MyReportListController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        UserInfoDTO loginUser = (UserInfoDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            resp.sendRedirect(req.getContextPath() + "/user/auth/login");
            return;
        }

        int userIdx = loginUser.getUserId(); 
        List<ReportDTO> reportList = ReportDAO.getUserReportList(userIdx);

        req.setAttribute("reportList", reportList);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/myReportList.jsp");
        dispatcher.forward(req, resp);
    }
}