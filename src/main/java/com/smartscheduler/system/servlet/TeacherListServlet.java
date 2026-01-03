package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.TeacherDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "TeacherListServlet", urlPatterns = {
        "/TeacherListServlet", "/admin/TeacherListServlet", "/admin/teachers", "/TeacherList"
})
public class TeacherListServlet extends HttpServlet {
    private final TeacherDAO dao = new TeacherDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("teachers", dao.getAllTeachers());
        request.setAttribute("teacherCount", dao.getTeacherCount());
        // forward to unified dashboard with tab=teachers
        request.getRequestDispatcher("/admin/dashboard.jsp?tab=teachers").forward(request, response);
    }
}
