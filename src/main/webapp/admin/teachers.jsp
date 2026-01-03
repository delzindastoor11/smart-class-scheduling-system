<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.smartscheduler.system.dao.TeacherDAO" %>
<%@ page import="com.smartscheduler.system.model.Teacher" %>
<%@ page import="java.util.List" %>

<%
    if (request.getAttribute("teachers") == null) {
        TeacherDAO dao = new TeacherDAO();
        List<Teacher> list = dao.getAllTeachers();
        request.setAttribute("teachers", list);
    }
%>

<div class="tab-pane fade show active" id="teachers">
    <h4>Manage Teachers</h4>
    <a href="addTeacher.jsp" class="btn btn-primary mb-3">Add Teacher</a>

    <table class="table table-dark table-striped">
        <thead>
        <tr>
            <th>Name & Designation</th>
            <th>Email</th>
            <th>Specialization</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="t" items="${teachers}">
            <tr>
                <td>${t.name} <br><small>${t.designation}</small></td>
                <td>${t.email}</td>
                <td>${t.specialization}</td>
                <td>
                    <a href="TeacherEditServlet?id=${t.id}" class="btn btn-warning btn-sm">Edit</a>
                    <a href="TeacherDeleteServlet?id=${t.id}" class="btn btn-danger btn-sm"
                       onclick="return confirm('Are you sure you want to delete this teacher?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
