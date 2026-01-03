<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="manage-module">
  <h2>Manage Classrooms</h2>
  <a class="btn btn-primary float-end" href="${pageContext.request.contextPath}/ClassroomAddServlet">Add Classroom</a>

  <table class="table table-dark table-hover mt-3">
    <thead>
      <tr>
        <th>Room Name</th>
        <th>Type</th>
        <th>Capacity</th>
        <th>Facilities</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="c" items="${classrooms}">
        <tr>
          <td>${c.roomName}</td>
          <td>
            <span class="badge bg-info text-dark">${c.type}</span>
          </td>
          <td>${c.capacity}</td>
          <td>${c.facilities}</td>
          <td>
            <a class="btn btn-warning btn-sm" href="${pageContext.request.contextPath}/ClassroomEditServlet?id=${c.id}">Edit</a>
            <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/ClassroomDeleteServlet?id=${c.id}"
               onclick="return confirm('Delete this classroom?')">Delete</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
