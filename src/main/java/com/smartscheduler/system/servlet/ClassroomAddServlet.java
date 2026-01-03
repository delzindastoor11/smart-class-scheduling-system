package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.ClassroomDAO;
import com.smartscheduler.system.model.Classroom;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "ClassroomAddServlet", urlPatterns = {"/ClassroomAddServlet", "/admin/ClassroomAddServlet"})
public class ClassroomAddServlet extends HttpServlet {
    private final ClassroomDAO dao = new ClassroomDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/addClassroom.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String roomName = req.getParameter("roomName");
        String type = req.getParameter("type");
        int capacity = Integer.parseInt(req.getParameter("capacity"));
        String facilities = req.getParameter("facilities");

        Classroom c = new Classroom();
        c.setRoomName(roomName);
        c.setType(type);
        c.setCapacity(capacity);
        c.setFacilities(facilities);

        dao.addClassroom(c);
        resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=classrooms");
    }
}
