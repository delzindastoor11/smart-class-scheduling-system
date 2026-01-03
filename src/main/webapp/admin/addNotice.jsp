<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">
  <h2>Add Notice</h2>
  <form action="${pageContext.request.contextPath}/NoticeAddServlet" method="post">

    <div class="mb-3">
      <label class="form-label">Title</label>
      <input type="text" name="title" class="form-control" placeholder="Enter notice title" required />
    </div>

    <div class="mb-3">
      <label class="form-label">Description</label>
      <textarea name="description" class="form-control" rows="4" placeholder="Enter full notice details" required></textarea>
    </div>

    <div class="mb-3">
      <label class="form-label">Category</label>
      <select name="category" class="form-select" required>
        <option value="General">General</option>
        <option value="Exam">Exam</option>
        <option value="Holiday">Holiday</option>
      </select>
    </div>

    <div class="mb-3">
      <label class="form-label">Posted By</label>
      <input type="text" name="postedBy" class="form-control" placeholder="e.g. IT Department / Dr. Sharma" required />
    </div>

    <button type="submit" class="btn btn-primary">Save</button>
    <a href="${pageContext.request.contextPath}/admin/dashboard?tab=notices" class="btn btn-secondary">Cancel</a>
  </form>
</div>

<%@ include file="footer.jsp" %>
