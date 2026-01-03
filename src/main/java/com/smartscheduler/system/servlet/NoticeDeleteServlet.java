package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.NoticeDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/NoticeDeleteServlet")
public class NoticeDeleteServlet extends HttpServlet {
    private final NoticeDAO dao = new NoticeDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        dao.deleteNotice(id);
        resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=notices");
    }
}
