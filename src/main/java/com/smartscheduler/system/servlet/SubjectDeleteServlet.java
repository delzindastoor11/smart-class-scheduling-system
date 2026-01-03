package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.SubjectDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "SubjectDeleteServlet", urlPatterns = {"/SubjectDeleteServlet", "/admin/SubjectDeleteServlet"})
public class SubjectDeleteServlet extends HttpServlet {
    private final SubjectDAO dao = new SubjectDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("id");
        if (sid != null && !sid.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(sid);
                dao.deleteSubject(id);
            } catch (NumberFormatException ignore) { }
        }
        resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=subjects");
    }
}
