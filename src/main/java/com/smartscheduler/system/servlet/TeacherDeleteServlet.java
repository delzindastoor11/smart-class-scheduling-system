package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.TeacherDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "TeacherDeleteServlet", urlPatterns = {"/TeacherDeleteServlet", "/admin/TeacherDeleteServlet"})
public class TeacherDeleteServlet extends HttpServlet {
    private final TeacherDAO dao = new TeacherDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("id");
        if (sid != null && !sid.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(sid);
                dao.deleteTeacher(id);
            } catch (NumberFormatException ex) {
                // ignore
            }
        }
        resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=teachers");
    }
}
