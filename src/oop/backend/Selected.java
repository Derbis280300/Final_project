package oop.backend;

import java.util.ArrayList;

public class Selected {
    private int term;
    private Student student;
    private Course course;
    private  int grade;
    private  Lecture lecture;

    public Selected(){

    }

    public Selected(int term, Student student, Course course, int grade,Lecture lecture) {
        this.term = term;
        this.student = student;
        this.course = course;
        this.grade = grade;
        this.lecture=lecture;
    }

    public int getTerm() {
        return term;
    }

    public void setTerm(int term) {
        this.term = term;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public Lecture getLecture() {
        return lecture;
    }

    public void setLecture(Lecture lecture) {
        this.lecture = lecture;
    }
}

