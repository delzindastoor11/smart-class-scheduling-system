<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<div class="container">
    <h3>Edit Timetable Slot</h3>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <c:set var="it" value="${item}" />
    <form method="post" action="${pageContext.request.contextPath}/admin/UpdateTimetableServlet">
        <input type="hidden" name="id" value="${it.id}" />
        <div class="form-group">
            <label>Day</label>
            <select name="day" class="form-control">
                <option ${it.day=='Monday' ? 'selected':''}>Monday</option>
                <option ${it.day=='Tuesday' ? 'selected':''}>Tuesday</option>
                <option ${it.day=='Wednesday' ? 'selected':''}>Wednesday</option>
                <option ${it.day=='Thursday' ? 'selected':''}>Thursday</option>
                <option ${it.day=='Friday' ? 'selected':''}>Friday</option>
                <option ${it.day=='Saturday' ? 'selected':''}>Saturday</option>
            </select>
        </div>

        <div class="form-group">
            <label>Start Time</label>
            <input type="time" name="start_time" value="${it.startTime}" class="form-control"/>
        </div>

        <div class="form-group">
            <label>End Time</label>
            <input type="time" name="end_time" value="${it.endTime}" class="form-control"/>
        </div>

        <div class="form-group">
            <label>Year</label>
            <select name="year" class="form-control">
                <option value="FY" ${it.year=='FY' ? 'selected':''}>FY</option>
                <option value="SY" ${it.year=='SY' ? 'selected':''}>SY</option>
                <option value="TY" ${it.year=='TY' ? 'selected':''}>TY</option>
            </select>
        </div>

        <div class="form-group">
            <label>Subject</label>
            <select name="subject_id" class="form-control">
                <c:forEach var="s" items="${subjects}">
                    <option value="${s.id}" ${s.id == it.subjectId ? 'selected':''}>${s.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Teacher</label>
            <select name="teacher_id" class="form-control">
                <option value="">(none)</option>
                <c:forEach var="r" items="${teachers}">
                    <option value="${r.id}" ${r.id == it.teacherId ? 'selected':''}>${r.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Classroom</label>
            <select name="classroom_id" class="form-control">
                <option value="">(none)</option>
                <c:forEach var="r" items="${rooms}">
                    <option value="${r.id}" ${r.id == it.classroomId ? 'selected':''}>${r.roomName}</option>
                </c:forEach>
            </select>
        </div>

        <input type="hidden" name="semester" value="${it.semester}" />

        <button class="btn btn-primary" type="submit">Save changes</button>
        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/dashboard?tab=timetable&year=${it.year}&semester=${it.semester}">Cancel</a>
    </form>
</div>

<%@ include file="footer.jsp" %>
