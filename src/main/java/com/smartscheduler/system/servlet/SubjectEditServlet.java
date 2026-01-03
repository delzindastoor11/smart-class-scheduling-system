package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.SubjectDAO;
import com.smartscheduler.system.dao.TeacherDAO;
import com.smartscheduler.system.model.Subject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "SubjectEditServlet", urlPatterns = {"/SubjectEditServlet", "/admin/SubjectEditServlet"})
public class SubjectEditServlet extends HttpServlet {
    private final SubjectDAO dao = new SubjectDAO();
    private final TeacherDAO teacherDAO = new TeacherDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("id");
        if (sid == null || sid.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=subjects");
            return;
        }
        try {
            int id = Integer.parseInt(sid);
            Subject s = dao.getSubjectById(id);
            if (s == null) {
                resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=subjects");
                return;
            }
            req.setAttribute("subject", s);
            req.setAttribute("teachers", teacherDAO.getAllTeachers());
            req.getRequestDispatcher("/admin/editSubject.jsp").forward(req, resp);
        } catch (NumberFormatException ex) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=subjects");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("id");
        if (sid == null || sid.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=subjects");
            return;
        }
        try {
            int id = Integer.parseInt(sid);
            String code = req.getParameter("code");
            String name = req.getParameter("name");
            int semester = Integer.parseInt(req.getParameter("semester"));
            int credits = Integer.parseInt(req.getParameter("credits"));
            String teacherIdS = req.getParameter("teacherId");
            Integer teacherId = null;
            if (teacherIdS != null && !teacherIdS.trim().isEmpty()) teacherId = Integer.parseInt(teacherIdS);

            Subject s = new Subject();
            s.setId(id);
            s.setCode(code);
            s.setName(name);
            s.setSemester(semester);
            s.setCredits(credits);
            s.setTeacherId(teacherId);

            dao.updateSubject(s);

        } catch (Exception ex) {
            // ignore - redirect back
        }
        resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=subjects");
    }
}
