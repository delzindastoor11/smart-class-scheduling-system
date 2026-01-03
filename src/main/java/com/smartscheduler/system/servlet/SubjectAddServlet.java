package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.SubjectDAO;
import com.smartscheduler.system.dao.TeacherDAO;
import com.smartscheduler.system.model.Subject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "SubjectAddServlet", urlPatterns = {"/SubjectAddServlet", "/admin/SubjectAddServlet"})
public class SubjectAddServlet extends HttpServlet {
    private final SubjectDAO dao = new SubjectDAO();
    private final TeacherDAO teacherDAO = new TeacherDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // read and trim params
        String code = trim(req.getParameter("code"));
        String name = trim(req.getParameter("name"));
        String semesterS = trim(req.getParameter("semester"));
        String creditsS = trim(req.getParameter("credits"));
        String teacherIdS = trim(req.getParameter("teacherId"));

        // basic validation
        String error = null;
        if (code == null || code.isEmpty()) {
            error = "Subject code is required.";
        } else if (name == null || name.isEmpty()) {
            error = "Subject name is required.";
        }

        int semester = 0;
        int credits = 0;
        Integer teacherId = null;

        if (error == null) {
            try {
                if (semesterS != null && !semesterS.isEmpty()) {
                    semester = Integer.parseInt(semesterS);
                }
            } catch (NumberFormatException e) {
                error = "Semester must be a number.";
            }
        }

        if (error == null) {
            try {
                if (creditsS != null && !creditsS.isEmpty()) {
                    credits = Integer.parseInt(creditsS);
                }
            } catch (NumberFormatException e) {
                error = "Credits must be a number.";
            }
        }

        if (error == null && teacherIdS != null && !teacherIdS.isEmpty()) {
            try {
                teacherId = Integer.parseInt(teacherIdS);
            } catch (NumberFormatException ignored) {
                // treat as unassigned
                teacherId = null;
            }
        }

        // if validation failed, forward back to form with error + teachers list
        if (error != null) {
            req.setAttribute("error", error);
            req.setAttribute("teachers", teacherDAO.getAllTeachers());
            req.getRequestDispatcher("/admin/addSubject.jsp").forward(req, resp);
            return;
        }

        // build the model and persist
        Subject s = new Subject();
        s.setCode(code);
        s.setName(name);
        s.setSemester(semester);
        s.setCredits(credits);
        s.setTeacherId(teacherId);

        try {
            dao.addSubject(s);
        } catch (Exception e) {
            // on DB error, forward back with message and teacher list
            req.setAttribute("error", "Failed to add subject: " + e.getMessage());
            req.setAttribute("teachers", teacherDAO.getAllTeachers());
            req.getRequestDispatcher("/admin/addSubject.jsp").forward(req, resp);
            return;
        }

        // success -> redirect to dashboard subjects tab (POST-Redirect-GET)
        resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=subjects");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // ensure the Add form always has the teachers list
        req.setAttribute("teachers", teacherDAO.getAllTeachers());
        req.getRequestDispatcher("/admin/addSubject.jsp").forward(req, resp);
    }

    // small helper to avoid repetitive null checks
    private static String trim(String s) {
        return s == null ? null : s.trim();
    }
}
