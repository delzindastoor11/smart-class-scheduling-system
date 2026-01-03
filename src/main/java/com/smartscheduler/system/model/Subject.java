package com.smartscheduler.system.model;

public class Subject {
    private int id;
    private String code;
    private String name;
    private int semester;
    private int credits;
    private Integer teacherId; // Nullable

    // ✅ No-args constructor
    public Subject() {}

    // ✅ All-args constructor
    public Subject(int id, String code, String name, int semester, int credits, Integer teacherId) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.semester = semester;
        this.credits = credits;
        this.teacherId = teacherId;
    }

    // ✅ Constructor without ID (for inserts before DB generates ID)
    public Subject(String code, String name, int semester, int credits, Integer teacherId) {
        this.code = code;
        this.name = name;
        this.semester = semester;
        this.credits = credits;
        this.teacherId = teacherId;
    }

    // ---------- Getters & Setters ----------
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public int getSemester() {
        return semester;
    }
    public void setSemester(int semester) {
        this.semester = semester;
    }

    public int getCredits() {
        return credits;
    }
    public void setCredits(int credits) {
        this.credits = credits;
    }

    public Integer getTeacherId() {
        return teacherId;
    }
    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }
}
