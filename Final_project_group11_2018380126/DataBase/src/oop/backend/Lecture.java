package oop.backend;

public class Lecture {
    private int lecture_id;
    private Teacher teacher;
    private Course course;
    private int start_week;
    private int finish_week;
    private String building;
    private int start_unit;
    private int end_unit;
    private String week_days;

    public Lecture(){
    }

    public Lecture(int lecture_id, Teacher teacher, Course course, int start_week, int finish_week, String building, int start_unit, int end_unit, String week_days) {
        this.lecture_id = lecture_id;
        this.teacher = teacher;
        this.course = course;
        this.start_week = start_week;
        this.finish_week = finish_week;
        this.building = building;
        this.start_unit = start_unit;
        this.end_unit = end_unit;
        this.week_days = week_days;
    }

    public int getLecture_id() { return lecture_id; }

    public void setLecture_id(int lecture_id) { this.lecture_id = lecture_id; }

    public  Teacher getTeacher() {
        return teacher;
    }

    public  void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getStart_week() {
        return start_week;
    }

    public void setStart_week(int start_week) {
        this.start_week = start_week;
    }

    public int getFinish_week() {
        return finish_week;
    }

    public void setFinish_week(int finish_week) {
        this.finish_week = finish_week;
    }

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public int getStart_unit() {
        return start_unit;
    }

    public void setStart_unit(int start_unit) {
        this.start_unit = start_unit;
    }

    public int getEnd_unit() {
        return end_unit;
    }

    public void setEnd_unit(int end_unit) {
        this.end_unit = end_unit;
    }

    public String getWeek_days() {
        return week_days;
    }

    public void setWeek_days(String week_days) {
        this.week_days = week_days;
    }
}
