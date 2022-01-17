package oop.backend;

import java.sql.Date;

public class Student {
    private String student_id;
    private String student_name;
    private String student_gender;
    private Date student_date;
    private String student_major;
    private String student_school;
    private String student_password;

    public Student(){
    }

    public Student(String student_id, String student_name, String student_gender, Date student_date, String student_major, String student_school, String student_password) {
        this.student_id = student_id;
        this.student_name = student_name;
        this.student_gender = student_gender;
        this.student_date = student_date;
        this.student_major = student_major;
        this.student_school = student_school;
        this.student_password=student_password;
    }


    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getStudent_gender() {
        return student_gender;
    }

    public void setStudent_gender(String student_gender) {
        this.student_gender = student_gender;
    }

    public Date getStudent_date() {
        return student_date;
    }

    public void setStudent_date(Date student_date) {
        this.student_date = student_date;
    }

    public String getStudent_major() {
        return student_major;
    }

    public void setStudent_major(String student_major) {
        this.student_major = student_major;
    }

    public String getStudent_school() {
        return student_school;
    }

    public void setStudent_school(String student_school) {
        this.student_school = student_school;
    }

    public String getStudent_password() {
        return student_password;
    }

    public void setStudent_password(String student_password) {
        this.student_password = student_password;
    }
}
