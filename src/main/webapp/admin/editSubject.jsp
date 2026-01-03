<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">
  <h2>Edit Subject</h2>

  <c:if test="${empty subject}">
    <div class="alert alert-warning">No subject loaded. Please open this form via the Edit action.</div>
  </c:if>

  <form action="${pageContext.request.contextPath}/SubjectEditServlet" method="post">
    <input type="hidden" name="id" value="${subject.id}" />
    <div class="mb-3">
      <label class="form-label">Code</label>
      <input name="code" class="form-control" value="${subject.code}" required />
    </div>

    <div class="mb-3">
      <label class="form-label">Name</label>
      <input name="name" class="form-control" value="${subject.name}" required />
    </div>

    <div class="mb-3">
      <label class="form-label">Semester</label>
      <input name="semester" type="number" min="1" class="form-control" value="${subject.semester}" />
    </div>

    <div class="mb-3">
      <label class="form-label">Credits</label>
      <input name="credits" type="number" min="0" class="form-control" value="${subject.credits}" />
    </div>

    <div class="mb-3">
      <label class="form-label">Teacher (optional)</label>
      <select name="teacherId" class="form-select">
        <option value="">Unassigned</option>

        <c:choose>
          <c:when test="${not empty teachers}">
            <c:forEach var="t" items="${teachers}">
              <option value="${t.id}" <c:if test="${t.id == subject.teacherId}">selected</c:if> >
                ${t.name}
              </option>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <option disabled>No teachers available</option>
          </c:otherwise>
        </c:choose>

      </select>
    </div>

    <button class="btn btn-primary">Save</button>
    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/dashboard?tab=subjects">Cancel</a>
  </form>
</div>

<%@ include file="footer.jsp" %>
