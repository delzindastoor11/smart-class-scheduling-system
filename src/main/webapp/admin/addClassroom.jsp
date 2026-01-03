<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">
  <h2>Add Classroom</h2>
  <form action="${pageContext.request.contextPath}/ClassroomAddServlet" method="post">
    <div class="mb-3">
      <label class="form-label">Room Name</label>
      <input type="text" name="roomName" class="form-control" required />
    </div>

    <div class="mb-3">
      <label class="form-label">Type</label>
      <select name="type" class="form-select">
        <option value="Classroom">Classroom</option>
        <option value="Computer Lab">Computer Lab</option>
        <option value="Seminar Hall">Seminar Hall</option>
      </select>
    </div>

    <div class="mb-3">
      <label class="form-label">Capacity</label>
      <input type="number" name="capacity" class="form-control" required />
    </div>

    <div class="mb-3">
      <label class="form-label">Facilities</label>
      <input type="text" name="facilities" class="form-control" placeholder="Projector, AC, Whiteboard" />
    </div>

    <button class="btn btn-primary">Save</button>
    <a href="${pageContext.request.contextPath}/admin/dashboard?tab=classrooms" class="btn btn-secondary">Cancel</a>
  </form>
</div>

<%@ include file="footer.jsp" %>
