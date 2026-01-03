<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">
  <h2>Edit Notice</h2>
  <form action="${pageContext.request.contextPath}/NoticeEditServlet" method="post">
    <input type="hidden" name="id" value="${notice.id}" />

    <div class="mb-3">
      <label class="form-label">Title</label>
      <input type="text" name="title" class="form-control" value="${notice.title}" required />
    </div>

    <div class="mb-3">
      <label class="form-label">Description</label>
      <textarea name="description" class="form-control" rows="4" required>${notice.description}</textarea>
    </div>

    <div class="mb-3">
      <label class="form-label">Category</label>
      <select name="category" class="form-select" required>
        <option value="General" ${notice.category == 'General' ? 'selected' : ''}>General</option>
        <option value="Exam" ${notice.category == 'Exam' ? 'selected' : ''}>Exam</option>
        <option value="Holiday" ${notice.category == 'Holiday' ? 'selected' : ''}>Holiday</option>
      </select>
    </div>

    <div class="mb-3">
      <label class="form-label">Posted By</label>
      <input type="text" name="postedBy" class="form-control" value="${notice.postedBy}" required />
    </div>

    <button type="submit" class="btn btn-primary">Update</button>
    <a href="${pageContext.request.contextPath}/admin/dashboard?tab=notices" class="btn btn-secondary">Cancel</a>
  </form>
</div>

<%@ include file="footer.jsp" %>
