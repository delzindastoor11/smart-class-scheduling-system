<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">
  <h2>Edit Teacher</h2>
  <form action="${pageContext.request.contextPath}/TeacherEditServlet" method="post">
    <input type="hidden" name="id" value="${teacher.id}" />
    <div class="mb-3">
      <label class="form-label">Name</label>
      <input name="name" class="form-control" value="${teacher.name}" required />
    </div>
    <div class="mb-3">
      <label class="form-label">Designation</label>
      <input name="designation" class="form-control" value="${teacher.designation}" />
    </div>
    <div class="mb-3">
      <label class="form-label">Email</label>
      <input name="email" type="email" class="form-control" value="${teacher.email}" />
    </div>
    <div class="mb-3">
      <label class="form-label">Specialization</label>
      <input name="specialization" class="form-control" value="${teacher.specialization}" />
    </div>
    <button class="btn btn-primary">Save</button>
    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/dashboard?tab=teachers">Cancel</a>
  </form>
</div>

<%@ include file="footer.jsp" %>
