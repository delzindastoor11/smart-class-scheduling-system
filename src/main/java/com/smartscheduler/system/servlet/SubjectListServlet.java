package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.SubjectDAO;
import com.smartscheduler.system.dao.TeacherDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

    @WebServlet("/admin/SubjectListServlet")
    public class SubjectListServlet extends HttpServlet {
    private final SubjectDAO subjectDAO = new SubjectDAO();
    private final TeacherDAO teacherDAO = new TeacherDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Load subjects
        req.setAttribute("subjects", subjectDAO.getAllSubjects());

        // Load teachers
        req.setAttribute("teachers", teacherDAO.getAllTeachers());

        // Forward to the subjects.jsp (not teachers.jsp!)
        req.getRequestDispatcher("/admin/subjects.jsp").forward(req, resp);
    }
}
