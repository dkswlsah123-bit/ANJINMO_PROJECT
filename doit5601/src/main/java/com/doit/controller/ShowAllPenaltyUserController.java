package com.doit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.doit.dao.AdminUserDAO;
import com.doit.jydto.ShowUserPenaltyDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/show-penalty-user")
public class ShowAllPenaltyUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 파라미터 수집
        String pageParam = req.getParameter("page");
        int currentPage = (pageParam == null || pageParam.isEmpty()) ? 1 : Integer.parseInt(pageParam);
        int pageSize = 20; // 페이지당 20개씩 출력

        // 검색 파라미터 (사용자 ID 검색용)
        String searchKeyword = req.getParameter("searchKeyword");

        AdminUserDAO dao = new AdminUserDAO();
        
        try {
            // 2. 페이징 범위 계산
            int start = (currentPage - 1) * pageSize + 1;
            int end = currentPage * pageSize;

            // 3. DAO를 통한 데이터 조회
            List<ShowUserPenaltyDTO> penaltyList = dao.getPenaltyList(start, end, searchKeyword);
            int totalCount = dao.getTotalPenaltyCount(searchKeyword);
            
            // 4. 전체 페이지 수 계산
            int totalPages = (int) Math.ceil((double) totalCount / pageSize);

            // 5. 결과 전달 (Request Scope)
            req.setAttribute("penaltyList", penaltyList);
            req.setAttribute("currentPage", currentPage);
            req.setAttribute("totalPages", totalPages);
            req.setAttribute("totalCount", totalCount);
            req.setAttribute("searchKeyword", searchKeyword); // 검색어 유지용

            req.getRequestDispatcher("/WEB-INF/views/admin/showPenaltyUser.jsp").forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}