<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">
  <h2>Add Teacher</h2>
  <form action="${pageContext.request.contextPath}/TeacherAddServlet" method="post">
    <div class="mb-3">
      <label class="form-label">Name</label>
      <input name="name" class="form-control" required />
    </div>
    <div class="mb-3">
      <label class="form-label">Designation</label>
      <input name="designation" class="form-control" />
    </div>
    <div class="mb-3">
      <label class="form-label">Email</label>
      <input name="email" type="email" class="form-control" />
    </div>
    <div class="mb-3">
      <label class="form-label">Specialization</label>
      <input name="specialization" class="form-control" />
    </div>
    <button class="btn btn-primary">Save</button>
    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/dashboard?tab=teachers">Cancel</a>
  </form>
</div>

<%@ include file="footer.jsp" %>
