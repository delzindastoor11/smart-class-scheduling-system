package com.smartscheduler.system.dao;

import com.smartscheduler.system.model.Notice;
import com.smartscheduler.system.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NoticeDAO {

    // --- Add Notice ---
    public void addNotice(Notice notice) {
        String sql = "INSERT INTO notices (title, description, category, posted_by) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, notice.getTitle());
            ps.setString(2, notice.getDescription());
            ps.setString(3, notice.getCategory());
            ps.setString(4, notice.getPostedBy());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // --- Update Notice ---
    public void updateNotice(Notice notice) {
        String sql = "UPDATE notices SET title=?, description=?, category=?, posted_by=? WHERE id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, notice.getTitle());
            ps.setString(2, notice.getDescription());
            ps.setString(3, notice.getCategory());
            ps.setString(4, notice.getPostedBy());
            ps.setInt(5, notice.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // --- Delete Notice ---
    public void deleteNotice(int id) {
        String sql = "DELETE FROM notices WHERE id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // --- Get Notice by ID ---
    public Notice getNoticeById(int id) {
        String sql = "SELECT * FROM notices WHERE id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Notice(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("category"),
                        rs.getString("posted_by"),
                        rs.getTimestamp("created_at")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // --- Get All Notices ---
    public List<Notice> getAllNotices() {
        List<Notice> list = new ArrayList<>();
        String sql = "SELECT * FROM notices ORDER BY created_at DESC";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Notice n = new Notice(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getString("category"),
                    rs.getString("posted_by"),
                    rs.getTimestamp("created_at")
                );
                list.add(n);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // --- Get Notice Count ---
    public int getNoticeCount() {
        String sql = "SELECT COUNT(*) FROM notices";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
