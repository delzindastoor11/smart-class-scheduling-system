package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.ClassroomDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "ClassroomDeleteServlet", urlPatterns = {"/ClassroomDeleteServlet", "/admin/ClassroomDeleteServlet"})
public class ClassroomDeleteServlet extends HttpServlet {
    private final ClassroomDAO dao = new ClassroomDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        dao.deleteClassroom(id);
        resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=classrooms");
    }
}
