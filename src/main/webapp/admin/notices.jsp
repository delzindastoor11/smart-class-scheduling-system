<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="manage-module">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Manage Notices</h2>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/NoticeAddServlet">+ Add Notice</a>
  </div>

  <c:if test="${empty notices}">
    <div class="alert alert-info mt-3">No notices available.</div>
  </c:if>

  <div class="row">
    <c:forEach var="n" items="${notices}">
      <div class="col-md-6 mb-4">
        <div class="card notice-card shadow-sm h-100">
          <div class="card-body">
            <h5 class="card-title">${n.title}</h5>
            <h6 class="card-subtitle mb-2">${n.category}</h6>
            <p class="card-text">${n.description}</p>
          </div>
          <div class="card-footer d-flex justify-content-between align-items-center">
            <small class="posted-by">Posted by: ${n.postedBy}</small>
            <div>
              <a href="${pageContext.request.contextPath}/NoticeEditServlet?id=${n.id}" class="btn btn-warning btn-sm">Edit</a>
              <a href="${pageContext.request.contextPath}/NoticeDeleteServlet?id=${n.id}" 
                 class="btn btn-danger btn-sm"
                 onclick="return confirm('Are you sure you want to delete this notice?');">
                Delete
              </a>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>

<style>
/* Custom dark-blue notice cards */
.notice-card {
  background-color: #1e2a38; /* deep bluish-dark */
  color: #e0f2ff;
  border: none;
  border-radius: 12px;
  transition: transform 0.2s ease-in-out;
}
.notice-card:hover {
  transform: translateY(-3px);
}
.notice-card .card-subtitle {
  color: #90caf9; /* lighter blue */
}
.notice-card .card-text {
  color: #cfd8dc;
}
.notice-card .posted-by {
  color: #b0bec5;
}
</style>
