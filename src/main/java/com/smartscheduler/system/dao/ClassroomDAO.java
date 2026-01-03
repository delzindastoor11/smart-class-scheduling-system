package com.smartscheduler.system.dao;

import com.smartscheduler.system.model.Classroom;
import com.smartscheduler.system.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClassroomDAO {

    public List<Classroom> getAllClassrooms() {
        List<Classroom> list = new ArrayList<>();
        String sql = "SELECT * FROM classrooms ORDER BY id";
        try (Connection conn = DBUtil.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                Classroom c = new Classroom();
                c.setId(rs.getInt("id"));
                c.setRoomName(rs.getString("room_name"));
                c.setType(rs.getString("type"));
                c.setCapacity(rs.getInt("capacity"));
                c.setFacilities(rs.getString("facilities"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addClassroom(Classroom c) {
        String sql = "INSERT INTO classrooms (room_name, type, capacity, facilities) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, c.getRoomName());
            ps.setString(2, c.getType());
            ps.setInt(3, c.getCapacity());
            ps.setString(4, c.getFacilities());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateClassroom(Classroom c) {
        String sql = "UPDATE classrooms SET room_name=?, type=?, capacity=?, facilities=? WHERE id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, c.getRoomName());
            ps.setString(2, c.getType());
            ps.setInt(3, c.getCapacity());
            ps.setString(4, c.getFacilities());
            ps.setInt(5, c.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteClassroom(int id) {
        String sql = "DELETE FROM classrooms WHERE id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getClassroomCount() {
        String sql = "SELECT COUNT(*) FROM classrooms";
        try (Connection conn = DBUtil.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
