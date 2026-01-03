package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.TeacherDAO;
import com.smartscheduler.system.model.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "TeacherAddServlet", urlPatterns = {"/TeacherAddServlet", "/admin/TeacherAddServlet"})
public class TeacherAddServlet extends HttpServlet {
    private final TeacherDAO dao = new TeacherDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // read params carefully
        String name = request.getParameter("name");
        String designation = request.getParameter("designation");
        String email = request.getParameter("email");
        String specialization = request.getParameter("specialization");

        Teacher t = new Teacher();
        t.setName(name);
        t.setDesignation(designation);
        t.setEmail(email);
        t.setSpecialization(specialization);

        dao.addTeacher(t);

        // redirect back to dashboard / teachers tab
        response.sendRedirect(request.getContextPath() + "/admin/dashboard?tab=teachers");
    }

    // If someone wants to open the form URL to show a JSP, let it forward
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/addTeacher.jsp").forward(req, resp);
    }
}
