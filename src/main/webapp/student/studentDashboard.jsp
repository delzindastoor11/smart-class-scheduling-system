<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.time.LocalTime" %>
<%@ page import="com.smartscheduler.system.model.Timetable" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color:#111; color:#fff; }
        .tt-grid { width:100%; border-collapse: collapse; margin-top:20px; }
        .tt-grid th, .tt-grid td { border: 1px solid rgba(255,255,255,0.1); padding:12px; vertical-align: top; }
        .tt-grid th { background:#263b53; color:#fff; }
        .tt-timeslot { width:150px; font-weight:700; background:#0f1112; }
        .tt-card {
            background: #154031; color: #e9f3ea;
            border-radius: 8px; padding: 12px; box-shadow: 0 2px 0 rgba(0,0,0,0.35);
        }
        .tt-card .title { font-weight:700; }
        .tt-card .meta { font-size:0.9em; opacity:0.9; }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2>Student Dashboard</h2>
    <p class="text-muted">Welcome, <strong>Student</strong></p>

    <h4>Notices</h4>
    <ul class="list-group mb-4">
        <c:forEach var="n" items="${notices}">
            <li class="list-group-item bg-dark text-white">
                <strong>${n.title}</strong> - ${n.description}
            </li>
        </c:forEach>
    </ul>

    <h4>Timetable (${selectedYear} - ${selectedSemester})</h4>
    <table class="tt-grid">
        <thead>
        <tr>
            <th>Time/Day</th>
            <th>Monday</th>
            <th>Tuesday</th>
            <th>Wednesday</th>
            <th>Thursday</th>
            <th>Friday</th>
            <th>Saturday</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Timetable> rows = (List<Timetable>) request.getAttribute("timetable");
            if (rows == null) rows = Collections.emptyList();

            List<String> days = Arrays.asList("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");

            TreeSet<String> slotSet = new TreeSet<>(new Comparator<String>() {
                public int compare(String a, String b) {
                    try {
                        LocalTime sa = LocalTime.parse(a.split("-")[0]);
                        LocalTime sb = LocalTime.parse(b.split("-")[0]);
                        int c = sa.compareTo(sb);
                        if (c != 0) return c;
                    } catch (Exception e) {}
                    return a.compareTo(b);
                }
            });

            Map<String, Map<String, Timetable>> schedule = new LinkedHashMap<>();
            for (String d : days) schedule.put(d, new LinkedHashMap<>());

            for (Timetable t : rows) {
                String start = t.getStartTime().toString().substring(0,5);
                String end = t.getEndTime().toString().substring(0,5);
                String slot = start + "-" + end;
                slotSet.add(slot);
                schedule.get(t.getDay()).put(slot, t);
            }

            if (slotSet.isEmpty()) {
                String[] defaults = {"08:00-09:00","09:00-10:00","10:00-11:00","11:30-12:30","12:30-13:30","13:30-14:30"};
                slotSet.addAll(Arrays.asList(defaults));
            }

            for (String slot : slotSet) {
        %>
        <tr>
            <td class="tt-timeslot"><%=slot%></td>
            <% for (String d : days) {
                Timetable cell = schedule.get(d).get(slot);
            %>
            <td>
                <% if (cell != null) { %>
                <div class="tt-card">
                    <div class="title"><%=cell.getSubjectName()%></div>
                    <div class="meta"><%=cell.getTeacherName()%></div>
                    <div class="meta"><%=cell.getClassroomName()%></div>
                </div>
                <% } %>
            </td>
            <% } %>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
