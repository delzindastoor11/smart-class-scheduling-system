<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">
  <!-- Top cards -->
  <div class="row g-3 mb-4">
    <div class="col-md-3"><div class="metric-card"><h5>Teachers</h5><div class="num">${teacherCount}</div></div></div>
    <div class="col-md-3"><div class="metric-card"><h5>Subjects</h5><div class="num">${subjectCount}</div></div></div>
    <div class="col-md-3"><div class="metric-card"><h5>Classrooms</h5><div class="num">${classroomCount}</div></div></div>
    <div class="col-md-3"><div class="metric-card"><h5>Active Notices</h5><div class="num">${noticeCount}</div></div></div>
  </div>

  <!-- Tabs -->
  <ul class="nav nav-tabs mb-4">
    <li class="nav-item"><a class="nav-link ${param.tab=='teachers'?'active':''}" href="${pageContext.request.contextPath}/admin/dashboard?tab=teachers">Teachers</a></li>
    <li class="nav-item"><a class="nav-link ${param.tab=='subjects'?'active':''}" href="${pageContext.request.contextPath}/admin/dashboard?tab=subjects">Subjects</a></li>
    <li class="nav-item"><a class="nav-link ${param.tab=='classrooms'?'active':''}" href="${pageContext.request.contextPath}/admin/dashboard?tab=classrooms">Classrooms</a></li>
    <li class="nav-item"><a class="nav-link ${param.tab=='timetable'?'active':''}" href="${pageContext.request.contextPath}/admin/dashboard?tab=timetable">Timetable</a></li>
    <li class="nav-item"><a class="nav-link ${param.tab=='notices'?'active':''}" href="${pageContext.request.contextPath}/admin/dashboard?tab=notices">Notices</a></li>
  </ul>

  <!-- Dynamic include -->
  <c:choose>
    <c:when test="${param.tab == 'subjects'}">
      <jsp:include page="subjects.jsp"/>
    </c:when>

    <c:when test="${param.tab == 'classrooms'}">
      <jsp:include page="classrooms.jsp"/>
    </c:when>

    <c:when test="${param.tab == 'timetable'}">
      <jsp:include page="timetable.jsp"/>
    </c:when>

    <c:when test="${param.tab == 'notices'}">
      <jsp:include page="notices.jsp"/>
    </c:when>

    <c:otherwise>
      <jsp:include page="teachers.jsp"/>
    </c:otherwise>
  </c:choose>
</div>

<%@ include file="footer.jsp" %>
