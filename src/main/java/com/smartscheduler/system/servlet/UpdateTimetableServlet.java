package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.ClassroomDAO;
import com.smartscheduler.system.dao.SubjectDAO;
import com.smartscheduler.system.dao.TeacherDAO;
import com.smartscheduler.system.dao.TimetableDAO;
import com.smartscheduler.system.model.Timetable;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Time;
import java.util.List;

@WebServlet("/admin/UpdateTimetableServlet")
public class UpdateTimetableServlet extends HttpServlet {
    private final TimetableDAO dao = new TimetableDAO();
    private final SubjectDAO subjectDAO = new SubjectDAO();
    private final TeacherDAO teacherDAO = new TeacherDAO();
    private final ClassroomDAO classroomDAO = new ClassroomDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idS = req.getParameter("id");
        if (idS == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=timetable");
            return;
        }
        int id = Integer.parseInt(idS);
        Timetable t = dao.getById(id);

        req.setAttribute("item", t);
        req.setAttribute("subjects", subjectDAO.getAllSubjects());
        req.setAttribute("teachers", teacherDAO.getAllTeachers());
        req.setAttribute("rooms", classroomDAO.getAllClassrooms());
        req.getRequestDispatcher("/admin/editTimetable.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String day = req.getParameter("day");
            // input times expected as "HH:mm" — add seconds for Time.valueOf
            String startRaw = req.getParameter("start_time");
            String endRaw = req.getParameter("end_time");
            Time start = Time.valueOf((startRaw.length() == 5 ? startRaw + ":00" : startRaw));
            Time end = Time.valueOf((endRaw.length() == 5 ? endRaw + ":00" : endRaw));
            int subjectId = Integer.parseInt(req.getParameter("subject_id"));
            Integer teacherId = (req.getParameter("teacher_id") != null && !req.getParameter("teacher_id").isEmpty())
                    ? Integer.parseInt(req.getParameter("teacher_id")) : null;
            Integer classroomId = (req.getParameter("classroom_id") != null && !req.getParameter("classroom_id").isEmpty())
                    ? Integer.parseInt(req.getParameter("classroom_id")) : null;
            String year = req.getParameter("year");
            String semester = req.getParameter("semester");

            // availability checks (exclude current id)
            boolean teacherOk = dao.isTeacherAvailable(day, start, end, teacherId, year, semester, id);
            boolean roomOk = dao.isClassroomAvailable(day, start, end, classroomId, year, semester, id);

            if (!teacherOk || !roomOk) {
                Timetable t = dao.getById(id);
                req.setAttribute("item", t);
                req.setAttribute("subjects", subjectDAO.getAllSubjects());
                req.setAttribute("teachers", teacherDAO.getAllTeachers());
                req.setAttribute("rooms", classroomDAO.getAllClassrooms());

                StringBuilder err = new StringBuilder();
                if (!teacherOk) err.append("Selected teacher is not available at that time. ");
                if (!roomOk) err.append("Selected classroom is not available at that time.");
                req.setAttribute("errorMessage", err.toString());
                req.getRequestDispatcher("/admin/editTimetable.jsp").forward(req, resp);
                return;
            }

            Timetable t = new Timetable();
            t.setId(id);
            t.setDay(day);
            t.setStartTime(start);
            t.setEndTime(end);
            t.setSubjectId(subjectId);
            t.setTeacherId(teacherId);
            t.setClassroomId(classroomId);
            t.setYear(year);
            t.setSemester(semester);

            dao.updateTimetable(t);

            resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=timetable&year=" + year + "&semester=" + semester);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
