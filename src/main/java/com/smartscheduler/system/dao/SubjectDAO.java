package com.smartscheduler.system.dao;

import com.smartscheduler.system.model.Subject;
import com.smartscheduler.system.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@SuppressWarnings("CallToPrintStackTrace")
public class SubjectDAO {

    // Get all subjects
    public List<Subject> getAllSubjects() {
        List<Subject> result = new ArrayList<>();
        String sql = "SELECT * FROM subjects ORDER BY id";
        try (Connection conn = DBUtil.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                Subject s = new Subject();
                s.setId(rs.getInt("id"));
                s.setCode(rs.getString("code"));
                s.setName(rs.getString("name"));
                s.setSemester(rs.getInt("semester"));
                s.setCredits(rs.getInt("credits"));
                int t = rs.getInt("teacher_id");
                s.setTeacherId(rs.wasNull() ? null : t);
                result.add(s);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Get subject by id
    public Subject getSubjectById(int id) {
        String sql = "SELECT * FROM subjects WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Subject(
                        rs.getInt("id"),
                        rs.getString("code"),
                        rs.getString("name"),
                        rs.getInt("semester"),
                        rs.getInt("credits"),
                        rs.getObject("teacher_id") != null ? rs.getInt("teacher_id") : null
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Add subject
    public void addSubject(Subject subject) {
        String sql = "INSERT INTO subjects (code, name, semester, credits, teacher_id) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, subject.getCode());
            ps.setString(2, subject.getName());
            ps.setInt(3, subject.getSemester());
            ps.setInt(4, subject.getCredits());
            if (subject.getTeacherId() != null) {
                ps.setInt(5, subject.getTeacherId());
            } else {
                ps.setNull(5, Types.INTEGER);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update subject
    public void updateSubject(Subject subject) {
        String sql = "UPDATE subjects SET code=?, name=?, semester=?, credits=?, teacher_id=? WHERE id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, subject.getCode());
            ps.setString(2, subject.getName());
            ps.setInt(3, subject.getSemester());
            ps.setInt(4, subject.getCredits());
            if (subject.getTeacherId() != null) {
                ps.setInt(5, subject.getTeacherId());
            } else {
                ps.setNull(5, Types.INTEGER);
            }
            ps.setInt(6, subject.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete subject
    public void deleteSubject(int id) {
        String sql = "DELETE FROM subjects WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Count
    public int getSubjectCount() {
        String sql = "SELECT COUNT(*) FROM subjects";
        try (Connection conn = DBUtil.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Filter subjects by semester list
    public List<Subject> getSubjectsBySemesters(List<Integer> sems) {
        List<Subject> result = new ArrayList<>();
        boolean useSemesters = (sems != null && !sems.isEmpty());

        // Default query
        String sql = "SELECT * FROM subjects ORDER BY id";

        if (useSemesters) {
            String placeholders = sems.stream()
                                      .map(s -> "?")
                                      .collect(Collectors.joining(","));
            sql = "SELECT * FROM subjects WHERE semester IN (" + placeholders + ") ORDER BY id";
        }

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (useSemesters) {
                for (int i = 0; i < sems.size(); i++) {
                    ps.setInt(i + 1, sems.get(i));
                }
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Subject s = new Subject();
                    s.setId(rs.getInt("id"));
                    s.setCode(rs.getString("code"));
                    s.setName(rs.getString("name"));
                    s.setSemester(rs.getInt("semester"));
                    s.setCredits(rs.getInt("credits"));
                    int t = rs.getInt("teacher_id");
                    s.setTeacherId(rs.wasNull() ? null : t);
                    result.add(s);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Filter subjects by year (FY=1-2, SY=3-4, TY=5-6)
    public List<Subject> getSubjectsByYear(String year) {
        List<Integer> sems = new ArrayList<>();
        if (year == null || year.equalsIgnoreCase("ALL")) {
            return getAllSubjects();
        }
        switch (year.toUpperCase()) {
            case "FY":
                sems.add(1); sems.add(2);
                break;
            case "SY":
                sems.add(3); sems.add(4);
                break;
            case "TY":
                sems.add(5); sems.add(6);
                break;
        }
        return getSubjectsBySemesters(sems);
    }
}
