<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="manage-module">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Manage Subjects</h2>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/SubjectAddServlet">Add Subject</a>
  </div>

  <!-- Year filter buttons -->
  <div class="mb-3">
    <c:set var="sy" value="${not empty selectedYear ? selectedYear : 'ALL'}" />
    
    <a href="${pageContext.request.contextPath}/admin/dashboard?tab=subjects&year=ALL"
       class="btn btn-outline-secondary me-2 ${sy == 'ALL' ? 'active' : ''}">
       All Years
    </a>

    <a href="${pageContext.request.contextPath}/admin/dashboard?tab=subjects&year=FY"
       class="btn btn-outline-secondary me-2 ${sy == 'FY' ? 'active' : ''}">
       FY BSc IT
    </a>

    <a href="${pageContext.request.contextPath}/admin/dashboard?tab=subjects&year=SY"
       class="btn btn-outline-secondary me-2 ${sy == 'SY' ? 'active' : ''}">
       SY BSc IT
    </a>

    <a href="${pageContext.request.contextPath}/admin/dashboard?tab=subjects&year=TY"
       class="btn btn-outline-secondary ${sy == 'TY' ? 'active' : ''}">
       TY BSc IT
    </a>
  </div>

  <!-- Subjects table -->
  <table class="table table-dark table-hover mt-3">
    <thead>
      <tr>
        <th>Code</th>
        <th>Name</th>
        <th>Semester</th>
        <th>Credits</th>
        <th>Teacher</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="s" items="${subjects}">
        <tr>
          <td>${fn:escapeXml(s.code)}</td>
          <td>${fn:escapeXml(s.name)}</td>
          <td>${s.semester}</td>
          <td>${s.credits}</td>
          <td>
            <c:choose>
              <c:when test="${not empty s.teacherId}">
                <c:forEach var="t" items="${teachers}">
                  <c:if test="${t.id == s.teacherId}">${fn:escapeXml(t.name)}</c:if>
                </c:forEach>
              </c:when>
              <c:otherwise>Unassigned</c:otherwise>
            </c:choose>
          </td>
          <td>
            <a class="btn btn-warning btn-sm" 
               href="${pageContext.request.contextPath}/SubjectEditServlet?id=${s.id}">Edit</a>
            <a class="btn btn-danger btn-sm" 
               href="${pageContext.request.contextPath}/SubjectDeleteServlet?id=${s.id}"
               onclick="return confirm('Delete this subject?')">Delete</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
