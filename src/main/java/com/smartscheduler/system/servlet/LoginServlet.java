package com.smartscheduler.system.servlet;

import com.smartscheduler.system.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM users WHERE username=? AND password=? AND role=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, role);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                // 👇 add this for SessionFilter
                session.setAttribute("userRole", role);

                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
                } else if ("student".equalsIgnoreCase(role)) {
                    response.sendRedirect(request.getContextPath() + "/student/studentDashboard.jsp");
                } else {
                    // fallback: logout if role not valid
                    response.sendRedirect(request.getContextPath() + "/login.jsp?error=invalidRole");
                }
            } else {
                request.setAttribute("error", "Invalid credentials!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException("Database error during login", e);
        }
    }
}
