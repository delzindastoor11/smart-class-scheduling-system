package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.SubjectDAO;
import com.smartscheduler.system.dao.TeacherDAO;
import com.smartscheduler.system.dao.ClassroomDAO;
import com.smartscheduler.system.dao.NoticeDAO;
import com.smartscheduler.system.dao.TimetableDAO;

import com.smartscheduler.system.model.Subject;
import com.smartscheduler.system.model.Teacher;
import com.smartscheduler.system.model.Classroom;
import com.smartscheduler.system.model.Notice;
import com.smartscheduler.system.model.Timetable;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DashboardServlet",
        urlPatterns = {"/admin/dashboard", "/dashboard", "/admin", "/"})
public class DashboardServlet extends HttpServlet {
    private final TeacherDAO teacherDAO = new TeacherDAO();
    private final SubjectDAO subjectDAO = new SubjectDAO();
    private final ClassroomDAO classroomDAO = new ClassroomDAO();
    private final NoticeDAO noticeDAO = new NoticeDAO();
    private final TimetableDAO timetableDAO = new TimetableDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- Counts for cards ---
        int teacherCount = teacherDAO.getTeacherCount();
        int subjectCount = subjectDAO.getSubjectCount();
        int classroomCount = classroomDAO.getClassroomCount();
        int noticeCount = noticeDAO.getNoticeCount();

        request.setAttribute("teacherCount", teacherCount);
        request.setAttribute("subjectCount", subjectCount);
        request.setAttribute("classroomCount", classroomCount);
        request.setAttribute("noticeCount", noticeCount);

        // --- Tab handling ---
        String tab = request.getParameter("tab");
        if (tab == null) tab = "teachers";

        switch (tab) {
            case "subjects": {
                String year = request.getParameter("year"); // "FY", "SY", "TY", or "ALL"
                if (year == null) year = "ALL";

                List<Subject> subjects = subjectDAO.getSubjectsByYear(year);
                List<Teacher> teachers = teacherDAO.getAllTeachers();

                request.setAttribute("subjects", subjects);
                request.setAttribute("teachers", teachers);
                request.setAttribute("selectedYear", year);
                break;
            }
            case "teachers": {
                List<Teacher> teachers = teacherDAO.getAllTeachers();
                request.setAttribute("teachers", teachers);
                break;
            }
            case "classrooms": {
                List<Classroom> classrooms = classroomDAO.getAllClassrooms();
                request.setAttribute("classrooms", classrooms);
                break;
            }
            case "notices": {
                List<Notice> notices = noticeDAO.getAllNotices();
                request.setAttribute("notices", notices);
                break;
            }
            case "timetable": {
                String year = request.getParameter("year");
                if (year == null) year = "FY";
                String semester = request.getParameter("semester");
                if (semester == null || semester.isEmpty()) {
                    java.time.LocalDate now = java.time.LocalDate.now();
                    int month = now.getMonthValue();
                    boolean oddHalf = (month >= 7 && month <= 12);
                    if ("FY".equalsIgnoreCase(year)) semester = oddHalf ? "Sem 1" : "Sem 2";
                    else if ("SY".equalsIgnoreCase(year)) semester = oddHalf ? "Sem 3" : "Sem 4";
                    else if ("TY".equalsIgnoreCase(year)) semester = oddHalf ? "Sem 5" : "Sem 6";
                    else semester = oddHalf ? "Sem 1" : "Sem 2";
                }

                List<Timetable> timetable = timetableDAO.getTimetableDetailed(year, semester);
                request.setAttribute("timetable", timetable);
                request.setAttribute("selectedYear", year);
                request.setAttribute("selectedSemester", semester);
                break;
            }
        }

        // --- Flash message handling ---
        String flash = (String) request.getSession().getAttribute("flash");
        if (flash != null) {
            request.setAttribute("flash", flash);
            request.getSession().removeAttribute("flash");
        }

        // Forward to JSP
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }

    // ---- helper to calculate semester from date ----
    private String getCurrentSemester(String year) {
        java.time.Month month = java.time.LocalDate.now().getMonth();
        boolean isOdd = (month.getValue() >= 7 && month.getValue() <= 12);

        switch (year) {
            case "FY": return isOdd ? "Sem 1" : "Sem 2";
            case "SY": return isOdd ? "Sem 3" : "Sem 4";
            case "TY": return isOdd ? "Sem 5" : "Sem 6";
            default: return "Sem 1";
        }
    }
}
