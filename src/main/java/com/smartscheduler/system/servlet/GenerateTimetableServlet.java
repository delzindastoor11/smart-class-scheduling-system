package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.SubjectDAO;
import com.smartscheduler.system.dao.ClassroomDAO;
import com.smartscheduler.system.dao.TimetableDAO;
import com.smartscheduler.system.model.Subject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/admin/GenerateTimetableServlet")
public class GenerateTimetableServlet extends HttpServlet {
    private final TimetableDAO timetableDAO = new TimetableDAO();
    private final SubjectDAO subjectDAO = new SubjectDAO();
    private final ClassroomDAO classroomDAO = new ClassroomDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String year = req.getParameter("year");
        String semester = req.getParameter("semester");

        try {
            List<Subject> subjects = subjectDAO.getSubjectsByYear(year);
            List<Integer> classroomIds = classroomDAO.getAllClassrooms()
                                                    .stream()
                                                    .map(c -> c.getId())
                                                    .collect(Collectors.toList());

            timetableDAO.generateForYearSemester(year, semester, subjects, classroomIds);
            req.getSession().setAttribute("flash", "Timetable generated successfully!");
        } catch (SQLException e) {
            req.getSession().setAttribute("flash", "Error generating timetable: " + e.getMessage());
            throw new ServletException(e);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=timetable&year=" + year + "&semester=" + semester);
    }
}
  