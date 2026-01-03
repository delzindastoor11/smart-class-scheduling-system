package com.smartscheduler.system.servlet;

import com.smartscheduler.system.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet("/TestDB")
public class TestDBConnectionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            Connection conn = DBUtil.getConnection();
            if (conn != null) {
                out.println("<h2 style='color:green;'>✅ Database connection successful!</h2>");
                conn.close(); // close after test
            } else {
                out.println("<h2 style='color:red;'>❌ Failed to connect to database!</h2>");
            }
        } catch (Exception e) {
            throw new ServletException("Error connecting to database", e);
        }
    }
}
