<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.time.LocalTime" %>
<%@ page import="com.smartscheduler.system.model.Timetable" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<style>
    .tt-grid { width:100%; border-collapse: collapse; margin-top:20px; }
    .tt-grid th, .tt-grid td { vertical-align: top; border: 1px solid rgba(255,255,255,0.08); padding: 12px; }
    .tt-grid th { background:#263b53; color:#fff; font-weight:600; text-align:center; }
    .tt-timeslot { width:150px; background:#0f1112; color:#fff; font-weight:700; padding:20px; text-align:center; }
    .tt-card {
        background: #154031;
        color: #e9f3ea;
        border-radius: 8px;
        padding: 14px;
        box-shadow: 0 2px 0 rgba(0,0,0,0.35);
        margin-bottom:8px;
    }
    .tt-card .title { font-weight:700; margin-bottom:8px; }
    .tt-card .meta { font-size: 0.9em; opacity:0.9; margin-bottom:4px; }
    .controls { display:flex; gap:10px; align-items:center; margin-bottom:14px; }
</style>

<div class="container">

    <!-- Flash message -->
    <c:if test="${not empty flash}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${flash}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div style="display:flex; justify-content:space-between; align-items:center; margin:18px 0;">
        <h3>Timetable Management
            <small style="color:#9aa2a6; font-weight:400;">
                (<span id="current-year-label"><c:out value="${selectedYear}"/></span> -
                 <span id="current-sem-label"><c:out value="${selectedSemester}"/></span>)
            </small>
        </h3>

        <div class="controls">
            <label for="yearSelect" style="color:#cbd5d9; margin-right:6px;">Year</label>
            <select id="yearSelect" class="form-select" style="width:120px;">
                <option value="FY" <c:if test="${selectedYear == 'FY'}">selected</c:if>>FY</option>
                <option value="SY" <c:if test="${selectedYear == 'SY'}">selected</c:if>>SY</option>
                <option value="TY" <c:if test="${selectedYear == 'TY'}">selected</c:if>>TY</option>
            </select>

            <form id="generateForm" method="post" action="${pageContext.request.contextPath}/admin/GenerateTimetableServlet" style="display:inline-block;">
                <input type="hidden" name="year" id="genYear" value="${selectedYear}"/>
                <input type="hidden" name="semester" id="genSemester" value="${selectedSemester}"/>
                <button type="submit" class="btn btn-info">Generate Timetable</button>
            </form>

            <a class="btn btn-dark" id="exportBtn"
               href="${pageContext.request.contextPath}/admin/exportTimetableCSV?year=${selectedYear}&semester=${selectedSemester}">
                Export CSV
            </a>
        </div>
    </div>

    <table class="tt-grid">
        <thead>
        <tr>
            <th class="tt-timeslot">Time/Day</th>
            <th>Monday</th><th>Tuesday</th><th>Wednesday</th>
            <th>Thursday</th><th>Friday</th><th>Saturday</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Timetable> rows = (List<Timetable>) request.getAttribute("timetable");
            if (rows == null) rows = Collections.emptyList();
            List<String> days = Arrays.asList("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");

            // Collect slots
            Set<String> slotSet = new TreeSet<>((a,b)->{
                try {
                    LocalTime sa = LocalTime.parse(a.split("-")[0]);
                    LocalTime sb = LocalTime.parse(b.split("-")[0]);
                    return sa.compareTo(sb);
                } catch(Exception e){ return a.compareTo(b); }
            });

            Map<String, Map<String, Timetable>> schedule = new LinkedHashMap<>();
            for (String d : days) schedule.put(d, new LinkedHashMap<>());
            for (Timetable t : rows) {
                String slot = t.getStartTime().toString().substring(0,5) + "-" + t.getEndTime().toString().substring(0,5);
                slotSet.add(slot);
                schedule.get(t.getDay()).put(slot, t);
            }
            if (slotSet.isEmpty()) {
                slotSet.addAll(Arrays.asList("08:00-09:00","09:00-10:00","10:00-11:00","11:30-12:30","12:30-13:30","13:30-14:30"));
            }
        %>
        <% for (String slot : slotSet) { %>
            <tr>
                <td class="tt-timeslot"><strong><%=slot%></strong></td>
                <% for (String d : days) {
                    Timetable cell = schedule.get(d).get(slot); %>
                    <td>
                        <% if (cell != null) { %>
                            <div class="tt-card">
                                <div class="title"><%=cell.getSubjectName()%></div>
                                <div class="meta"><%=cell.getTeacherName()%></div>
                                <div class="meta" style="opacity:0.85;"><%=cell.getClassroomName()%></div>
                                <div style="margin-top:8px; display:flex; gap:6px;">
                                    <a href="${pageContext.request.contextPath}/admin/UpdateTimetableServlet?id=<%=cell.getId()%>&year=${selectedYear}&semester=${selectedSemester}"
                                       class="btn btn-sm btn-outline-warning">Edit</a>
                                    <a href="${pageContext.request.contextPath}/admin/DeleteTimetableServlet?id=<%=cell.getId()%>&year=${selectedYear}&semester=${selectedSemester}"
                                       class="btn btn-sm btn-outline-danger"
                                       onclick="return confirm('Are you sure you want to delete this slot?');">
                                       Delete
                                    </a>
                                </div>
                            </div>
                        <% } %>
                    </td>
                <% } %>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>

<script>
function computeSemesterFor(yearCode) {
    const month = new Date().getMonth();
    const isOdd = (month >= 6 && month <= 11);
    switch (yearCode) {
        case 'FY': return isOdd ? 'Sem 1' : 'Sem 2';
        case 'SY': return isOdd ? 'Sem 3' : 'Sem 4';
        case 'TY': return isOdd ? 'Sem 5' : 'Sem 6';
        default: return 'Sem 1';
    }
}
document.getElementById('yearSelect').addEventListener('change', function() {
    const year = this.value;
    const sem = computeSemesterFor(year);
    window.location.href = '${pageContext.request.contextPath}/admin/dashboard?tab=timetable&year=' + year + '&semester=' + sem;
});
</script>

<%@ include file="footer.jsp" %>
