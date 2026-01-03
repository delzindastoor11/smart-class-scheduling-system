<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">
  <h2>Add Subject</h2>

  <!-- show any validation / DB error forwarded by servlet -->
  <c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
  </c:if>

  <form action="${pageContext.request.contextPath}/SubjectAddServlet" method="post">
    <div class="mb-3">
      <label class="form-label">Code</label>
      <input name="code" class="form-control" required
             value="${fn:escapeXml(param.code)}" />
    </div>

    <div class="mb-3">
      <label class="form-label">Name</label>
      <input name="name" class="form-control" required
             value="${fn:escapeXml(param.name)}" />
    </div>

    <div class="mb-3">
      <label class="form-label">Semester</label>
      <input name="semester" type="number" min="1" class="form-control"
             value="${fn:escapeXml(param.semester)}" />
    </div>

    <div class="mb-3">
      <label class="form-label">Credits</label>
      <input name="credits" type="number" min="0" class="form-control"
             value="${fn:escapeXml(param.credits)}" />
    </div>

    <div class="mb-3">
      <label class="form-label">Teacher (optional)</label>
      <select name="teacherId" class="form-select">
        <option value="">Unassigned</option>

        <c:choose>
          <c:when test="${not empty teachers}">
            <c:forEach var="t" items="${teachers}">
              <option value="${t.id}"
                <c:if test="${param.teacherId != null && param.teacherId == t.id}">selected</c:if>>
                ${fn:escapeXml(t.name)}
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
