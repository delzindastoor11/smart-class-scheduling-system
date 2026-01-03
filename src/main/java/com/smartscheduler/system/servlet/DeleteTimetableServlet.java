package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.TimetableDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/DeleteTimetableServlet")
public class DeleteTimetableServlet extends HttpServlet {
    private final TimetableDAO dao = new TimetableDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idS = req.getParameter("id");
        String year = req.getParameter("year");
        String semester = req.getParameter("semester");

        if (idS != null) {
            try {
                dao.deleteById(Integer.parseInt(idS));
                req.getSession().setAttribute("flash", "Timetable slot deleted successfully!");
            } catch (Exception e) {
                req.getSession().setAttribute("flash", "Error deleting slot: " + e.getMessage());
                throw new ServletException(e);
            }
        }

        resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=timetable&year=" +
                (year == null ? "FY" : year) + "&semester=" + (semester == null ? "Sem 1" : semester));
    }
}
