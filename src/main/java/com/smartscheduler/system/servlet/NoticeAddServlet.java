package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.NoticeDAO;
import com.smartscheduler.system.model.Notice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/NoticeAddServlet")
public class NoticeAddServlet extends HttpServlet {
    private final NoticeDAO dao = new NoticeDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/admin/addNotice.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String category = req.getParameter("category");
        String postedBy = req.getParameter("postedBy");

        Notice n = new Notice(title, description, category, postedBy);
        dao.addNotice(n);

        resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=notices");
    }
}
