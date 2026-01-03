package com.smartscheduler.system.model;

import java.sql.Timestamp;

public class Notice {
    private int id;
    private String title;
    private String description;
    private String category;
    private String postedBy;
    private Timestamp createdAt;

    // --- Constructors ---
    public Notice() {}

    public Notice(int id, String title, String description, String category, String postedBy, Timestamp createdAt) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.category = category;
        this.postedBy = postedBy;
        this.createdAt = createdAt;
    }

    public Notice(String title, String description, String category, String postedBy) {
        this.title = title;
        this.description = description;
        this.category = category;
        this.postedBy = postedBy;
    }

    // --- Getters & Setters ---
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getPostedBy() { return postedBy; }
    public void setPostedBy(String postedBy) { this.postedBy = postedBy; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
