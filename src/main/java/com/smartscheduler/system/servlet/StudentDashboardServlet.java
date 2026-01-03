package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.NoticeDAO;
import com.smartscheduler.system.dao.TimetableDAO;
import com.smartscheduler.system.model.Notice;
import com.smartscheduler.system.model.Timetable;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/student/dashboard")
public class StudentDashboardServlet extends HttpServlet {
    private final TimetableDAO timetableDAO = new TimetableDAO();
    private final NoticeDAO noticeDAO = new NoticeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- For now, hardcode to FY student ---
        // Later you can map students to year in DB.
        String year = "FY";  

        // Compute semester same way as admin
        java.time.LocalDate now = java.time.LocalDate.now();
        int month = now.getMonthValue();
        boolean oddHalf = (month >= 7 && month <= 12);

        String semester;
        if ("FY".equalsIgnoreCase(year)) semester = oddHalf ? "Sem 1" : "Sem 2";
        else if ("SY".equalsIgnoreCase(year)) semester = oddHalf ? "Sem 3" : "Sem 4";
        else if ("TY".equalsIgnoreCase(year)) semester = oddHalf ? "Sem 5" : "Sem 6";
        else semester = "Sem 1";

        // Fetch timetable + notices
        List<Timetable> timetable = timetableDAO.getTimetableDetailed(year, semester);
        List<Notice> notices = noticeDAO.getAllNotices();

        request.setAttribute("timetable", timetable);
        request.setAttribute("notices", notices);
        request.setAttribute("selectedYear", year);
        request.setAttribute("selectedSemester", semester);

        // forward to JSP
        request.getRequestDispatcher("/student/studentDashboard.jsp").forward(request, response);
    }
}
