package com.smartscheduler.system.servlet;

import com.smartscheduler.system.dao.ClassroomDAO;
import com.smartscheduler.system.model.Classroom;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ClassroomEditServlet", urlPatterns = {"/ClassroomEditServlet", "/admin/ClassroomEditServlet"})
public class ClassroomEditServlet extends HttpServlet {
    private final ClassroomDAO dao = new ClassroomDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        List<Classroom> all = dao.getAllClassrooms();

        // find the classroom with the given ID
        Classroom found = all.stream().filter(c -> c.getId() == id).findFirst().orElse(null);
        req.setAttribute("classroom", found);

        req.getRequestDispatcher("/admin/editClassroom.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String roomName = req.getParameter("roomName");
        String type = req.getParameter("type");
        int capacity = Integer.parseInt(req.getParameter("capacity"));
        String facilities = req.getParameter("facilities");

        Classroom c = new Classroom();
        c.setId(id);
        c.setRoomName(roomName);
        c.setType(type);
        c.setCapacity(capacity);
        c.setFacilities(facilities);

        dao.updateClassroom(c);
        resp.sendRedirect(req.getContextPath() + "/admin/dashboard?tab=classrooms");
    }
}
