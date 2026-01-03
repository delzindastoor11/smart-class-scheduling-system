package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.NoticeDAO;
import com.smartscheduler.system.model.Notice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/NoticeEditServlet")
public class NoticeEditServlet extends HttpServlet {
    private final NoticeDAO dao = new NoticeDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Notice notice = dao.getNoticeById(id);

        req.setAttribute("notice", notice);
        req.getRequestDispatcher("/admin/editNotice.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String category = req.getParameter("category");
        String postedBy = req.getParameter("postedBy");

        Notice n = new Notice(id, title, description, category, postedBy, null);
        dao.updateNotice(n);

        resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=notices");
    }
}
