package com.smartscheduler.system.model;

public class Teacher {
    private int id;
    private String name;
    private String designation;
    private String email;
    private String specialization;

    public Teacher() {}

    public Teacher(int id, String name, String designation, String email, String specialization) {
        this.id = id;
        this.name = name;
        this.designation = designation;
        this.email = email;
        this.specialization = specialization;
    }

    public Teacher(String name, String designation, String email, String specialization) {
        this.name = name;
        this.designation = designation;
        this.email = email;
        this.specialization = specialization;
    }

    // getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDesignation() { return designation; }
    public void setDesignation(String designation) { this.designation = designation; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }
}
