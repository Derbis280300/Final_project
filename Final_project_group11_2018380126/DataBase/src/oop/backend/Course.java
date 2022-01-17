package oop.backend;

import java.text.DecimalFormat;

public class Course {
    private String course_id;
    private String course_name;
    private Double credits;

    public Course(){}
    public Course(String course_id, String course_name, Double credits) {
        this.course_id = course_id;
        this.course_name = course_name;
        this.credits = credits;
    }

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public Double getCredits() {
        return credits;
    }

    public void setCredits(Double credits) {
        this.credits = credits;
    }
}
