package com.smartscheduler.system.dao;

import com.smartscheduler.system.model.Timetable;
import com.smartscheduler.system.model.Subject;
import com.smartscheduler.system.util.DBUtil;

import java.sql.*;
import java.util.*;

public class TimetableDAO {

    // --- Basic CRUD ---

    public void addTimetable(Timetable t) throws SQLException {
        String sql = "INSERT INTO timetable (day, start_time, end_time, subject_id, teacher_id, classroom_id, year, semester) VALUES (?,?,?,?,?,?,?,?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, t.getDay());
            ps.setTime(2, t.getStartTime());
            ps.setTime(3, t.getEndTime());
            ps.setInt(4, t.getSubjectId());
            if (t.getTeacherId() != null) ps.setInt(5, t.getTeacherId()); else ps.setNull(5, Types.INTEGER);
            if (t.getClassroomId() != null) ps.setInt(6, t.getClassroomId()); else ps.setNull(6, Types.INTEGER);
            ps.setString(7, t.getYear());
            ps.setString(8, t.getSemester());
            ps.executeUpdate();
        }
    }

    public void updateTimetable(Timetable t) throws SQLException {
        String sql = "UPDATE timetable SET day=?, start_time=?, end_time=?, subject_id=?, teacher_id=?, classroom_id=?, year=?, semester=? WHERE id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, t.getDay());
            ps.setTime(2, t.getStartTime());
            ps.setTime(3, t.getEndTime());
            ps.setInt(4, t.getSubjectId());
            if (t.getTeacherId() != null) ps.setInt(5, t.getTeacherId()); else ps.setNull(5, Types.INTEGER);
            if (t.getClassroomId() != null) ps.setInt(6, t.getClassroomId()); else ps.setNull(6, Types.INTEGER);
            ps.setString(7, t.getYear());
            ps.setString(8, t.getSemester());
            ps.setInt(9, t.getId());
            ps.executeUpdate();
        }
    }

    public void deleteByYearSemester(String year, String semester) throws SQLException {
        String sql = "DELETE FROM timetable WHERE year = ? AND semester = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, year);
            ps.setString(2, semester);
            ps.executeUpdate();
        }
    }

    public void deleteById(int id) throws SQLException {
        String sql = "DELETE FROM timetable WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    public Timetable getById(int id) {
        String sql = "SELECT t.*, s.name AS subject_name, te.name AS teacher_name, c.room_name AS classroom_name " +
                     "FROM timetable t " +
                     "LEFT JOIN subjects s ON t.subject_id = s.id " +
                     "LEFT JOIN teachers te ON t.teacher_id = te.id " +
                     "LEFT JOIN classrooms c ON t.classroom_id = c.id " +
                     "WHERE t.id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Timetable t = new Timetable();
                    t.setId(rs.getInt("id"));
                    t.setDay(rs.getString("day"));
                    t.setStartTime(rs.getTime("start_time"));
                    t.setEndTime(rs.getTime("end_time"));
                    t.setSubjectId(rs.getInt("subject_id"));
                    int tea = rs.getInt("teacher_id");
                    t.setTeacherId(rs.wasNull() ? null : tea);
                    int cls = rs.getInt("classroom_id");
                    t.setClassroomId(rs.wasNull() ? null : cls);
                    t.setYear(rs.getString("year"));
                    t.setSemester(rs.getString("semester"));
                    t.setCreatedAt(rs.getTimestamp("created_at"));
                    t.setSubjectName(rs.getString("subject_name"));
                    t.setTeacherName(rs.getString("teacher_name"));
                    t.setClassroomName(rs.getString("classroom_name"));
                    return t;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Timetable> getTimetableDetailed(String year, String semester) {
        List<Timetable> list = new ArrayList<>();
        String sql =
            "SELECT t.*, s.name AS subject_name, te.name AS teacher_name, c.room_name AS classroom_name " +
            "FROM timetable t " +
            "LEFT JOIN subjects s ON t.subject_id = s.id " +
            "LEFT JOIN teachers te ON t.teacher_id = te.id " +
            "LEFT JOIN classrooms c ON t.classroom_id = c.id " +
            "WHERE t.year = ? AND t.semester = ? " +
            "ORDER BY FIELD(t.day,'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'), t.start_time";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, year);
            ps.setString(2, semester);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Timetable t = new Timetable();
                    t.setId(rs.getInt("id"));
                    t.setDay(rs.getString("day"));
                    t.setStartTime(rs.getTime("start_time"));
                    t.setEndTime(rs.getTime("end_time"));
                    t.setSubjectId(rs.getInt("subject_id"));
                    int tea = rs.getInt("teacher_id");
                    t.setTeacherId(rs.wasNull() ? null : tea);
                    int cls = rs.getInt("classroom_id");
                    t.setClassroomId(rs.wasNull() ? null : cls);
                    t.setYear(rs.getString("year"));
                    t.setSemester(rs.getString("semester"));
                    t.setCreatedAt(rs.getTimestamp("created_at"));
                    t.setSubjectName(rs.getString("subject_name"));
                    t.setTeacherName(rs.getString("teacher_name"));
                    t.setClassroomName(rs.getString("classroom_name"));
                    list.add(t);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    // --- Availability checks ---

    public boolean isTeacherAvailable(String day, Time start, Time end, Integer teacherId, String year, String semester, Integer excludeId) {
        if (teacherId == null) return true;
        String sql = "SELECT COUNT(*) FROM timetable WHERE teacher_id = ? AND day = ? AND year = ? AND semester = ? AND NOT (end_time <= ? OR start_time >= ?)";
        if (excludeId != null) sql += " AND id <> ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, teacherId);
            ps.setString(2, day);
            ps.setString(3, year);
            ps.setString(4, semester);
            ps.setTime(5, start);
            ps.setTime(6, end);
            if (excludeId != null) ps.setInt(7, excludeId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1) == 0;
            }
        } catch (SQLException ex) { ex.printStackTrace(); }
        return false;
    }

    public boolean isClassroomAvailable(String day, Time start, Time end, Integer classroomId, String year, String semester, Integer excludeId) {
        if (classroomId == null) return true;
        String sql = "SELECT COUNT(*) FROM timetable WHERE classroom_id = ? AND day = ? AND year = ? AND semester = ? AND NOT (end_time <= ? OR start_time >= ?)";
        if (excludeId != null) sql += " AND id <> ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, classroomId);
            ps.setString(2, day);
            ps.setString(3, year);
            ps.setString(4, semester);
            ps.setTime(5, start);
            ps.setTime(6, end);
            if (excludeId != null) ps.setInt(7, excludeId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1) == 0;
            }
        } catch (SQLException ex) { ex.printStackTrace(); }
        return false;
    }

    // --- Generator logic (fixed) ---

    public void generateForYearSemester(String year, String semester, List<Subject> subjects, List<Integer> classroomIds) throws SQLException {
        deleteByYearSemester(year, semester);

        String[] days = {"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
        String[] slotTimes = {"08:00:00-09:00:00","09:00:00-10:00:00","10:00:00-11:00:00",
                              "11:30:00-12:30:00","12:30:00-13:30:00","13:30:00-14:30:00"};

        List<Subject> subjectsCopy = new ArrayList<>(subjects);
        Collections.shuffle(subjectsCopy, new Random());

        int dayIndex = 0, slotIndex = 0;

        for (Subject s : subjectsCopy) {
            boolean placed = false;
            int attempts = 0;
            while (!placed && attempts < days.length * slotTimes.length) {
                String day = days[dayIndex % days.length];
                String[] parts = slotTimes[slotIndex % slotTimes.length].split("-");
                Time start = Time.valueOf(parts[0]);
                Time end = Time.valueOf(parts[1]);

                Integer preferredTeacher = s.getTeacherId();
                Integer foundTeacher = null, foundRoom = null;

                if (preferredTeacher != null && isTeacherAvailable(day, start, end, preferredTeacher, year, semester, null)) {
                    for (Integer rid : classroomIds) {
                        if (isClassroomAvailable(day, start, end, rid, year, semester, null)) {
                            foundTeacher = preferredTeacher; foundRoom = rid; break;
                        }
                    }
                } else {
                    List<Integer> teacherIds = fetchAllTeacherIds();
                    for (Integer tid : teacherIds) {
                        if (isTeacherAvailable(day, start, end, tid, year, semester, null)) {
                            for (Integer rid : classroomIds) {
                                if (isClassroomAvailable(day, start, end, rid, year, semester, null)) {
                                    foundTeacher = tid; foundRoom = rid; break;
                                }
                            }
                            if (foundTeacher != null) break;
                        }
                    }
                }

                if (foundTeacher != null && foundRoom != null) {
                    Timetable t = new Timetable();
                    t.setDay(day);
                    t.setStartTime(start);
                    t.setEndTime(end);
                    t.setSubjectId(s.getId());
                    t.setTeacherId(foundTeacher);
                    t.setClassroomId(foundRoom);
                    t.setYear(year);
                    t.setSemester(semester);
                    addTimetable(t);
                    placed = true;
                }

                dayIndex++;
                if (dayIndex % days.length == 0) slotIndex++;
                attempts++;
            }
        }
    }

    private List<Integer> fetchAllTeacherIds() {
        List<Integer> res = new ArrayList<>();
        String sql = "SELECT id FROM teachers";
        try (Connection conn = DBUtil.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) res.add(rs.getInt("id"));
        } catch (SQLException ex) { ex.printStackTrace(); }
        return res;
    }
}
