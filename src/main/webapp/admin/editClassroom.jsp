<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">
  <h2>Edit Classroom</h2>
  <form action="${pageContext.request.contextPath}/ClassroomEditServlet" method="post">
    <input type="hidden" name="id" value="${classroom.id}" />

    <div class="mb-3">
      <label class="form-label">Room Name</label>
      <input type="text" name="roomName" class="form-control" value="${classroom.roomName}" required />
    </div>

    <div class="mb-3">
      <label class="form-label">Type</label>
      <select name="type" class="form-select">
        <option value="Classroom" ${classroom.type == 'Classroom' ? 'selected' : ''}>Classroom</option>
        <option value="Computer Lab" ${classroom.type == 'Computer Lab' ? 'selected' : ''}>Computer Lab</option>
        <option value="Seminar Hall" ${classroom.type == 'Seminar Hall' ? 'selected' : ''}>Seminar Hall</option>
      </select>
    </div>

    <div class="mb-3">
      <label class="form-label">Capacity</label>
      <input type="number" name="capacity" class="form-control" value="${classroom.capacity}" required />
    </div>

    <div class="mb-3">
      <label class="form-label">Facilities</label>
      <input type="text" name="facilities" class="form-control" value="${classroom.facilities}" />
    </div>

    <button class="btn btn-primary">Update</button>
    <a href="${pageContext.request.contextPath}/admin/dashboard?tab=classrooms" class="btn btn-secondary">Cancel</a>
  </form>
</div>

<%@ include file="footer.jsp" %>
