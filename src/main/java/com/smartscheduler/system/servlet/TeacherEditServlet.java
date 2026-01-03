package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.TeacherDAO;
import com.smartscheduler.system.model.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "TeacherEditServlet", urlPatterns = {"/TeacherEditServlet", "/admin/TeacherEditServlet"})
public class TeacherEditServlet extends HttpServlet {
    private final TeacherDAO dao = new TeacherDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("id");
        if (sid == null || sid.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=teachers");
            return;
        }
        int id;
        try {
            id = Integer.parseInt(sid);
        } catch (NumberFormatException ex) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=teachers");
            return;
        }
        Teacher t = dao.getTeacherById(id);
        if (t == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=teachers");
            return;
        }
        req.setAttribute("teacher", t);
        req.getRequestDispatcher("/admin/editTeacher.jsp").forward(req, resp);
    }

    // handle update
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("id");
        if (sid == null || sid.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=teachers");
            return;
        }
        try {
            int id = Integer.parseInt(sid);
            String name = req.getParameter("name");
            String designation = req.getParameter("designation");
            String email = req.getParameter("email");
            String specialization = req.getParameter("specialization");

            com.smartscheduler.system.model.Teacher t = new com.smartscheduler.system.model.Teacher();
            t.setId(id);
            t.setName(name);
            t.setDesignation(designation);
            t.setEmail(email);
            t.setSpecialization(specialization);
            dao.updateTeacher(t);

        } catch (NumberFormatException ex) {
            // ignore and redirect
        }
        resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=teachers");
    }
}
