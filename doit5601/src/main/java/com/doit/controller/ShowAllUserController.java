package com.doit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.doit.dao.AdminUserDAO;
import com.doit.jydto.ShowUserDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/show-all-users")
public class ShowAllUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageParam = req.getParameter("page");
        int currentPage = (pageParam == null) ? 1 : Integer.parseInt(pageParam);
        int pageSize = 20;

        // 검색 파라미터 추가
        String searchType = req.getParameter("searchType");
        String searchKeyword = req.getParameter("searchKeyword");

        AdminUserDAO dao = new AdminUserDAO();
        try {
            int start = (currentPage - 1) * pageSize + 1;
            int end = currentPage * pageSize;

            List<ShowUserDTO> userList = dao.showAllUsers(start, end, searchType, searchKeyword);
            int totalCount = dao.getTotalCount(searchType, searchKeyword);
            int totalPages = (int) Math.ceil((double) totalCount / pageSize);

            req.setAttribute("userList", userList);
            req.setAttribute("currentPage", currentPage);
            req.setAttribute("totalPages", totalPages);
            req.setAttribute("totalCount", totalCount);
            
            // 검색 상태 유지를 위해 다시 보냄
            req.setAttribute("searchType", searchType);
            req.setAttribute("searchKeyword", searchKeyword);

            req.getRequestDispatcher("/WEB-INF/views/admin/showAllUser.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}