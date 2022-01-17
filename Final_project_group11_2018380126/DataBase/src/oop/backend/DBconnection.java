package oop.backend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
//need to import ability to use insert into statement

public class DBconnection{
    private static Connection connection;
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/oop?serverTimezone=UTC", "root", "123456");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static Student checkStudent(String student_id) //check student
    {
        Student student=null;

          try{
              PreparedStatement statement= connection.prepareStatement("SELECT *FROM students WHERE student_id=?");
              statement.setString(1,student_id);
              ResultSet resultSet=statement.executeQuery();
              if(resultSet.next())
              {
                 student =new Student(
                         resultSet.getString("student_id"),
                          resultSet.getString("student_name"),
                          resultSet.getString("student_gender"),
                          resultSet.getDate("student_date"),
                         resultSet.getString("student_major"),
                         resultSet.getString("student_school"),
                         resultSet.getString("student_password")
                  );
              }

              statement.close();

          }catch (Exception e)
          {
              e.printStackTrace();
          }
          return student;
    }
    public static ArrayList<Selected> getSubject(Student student, int term)  //create time table
    {
        ArrayList<Selected>selecteds=new ArrayList<>();
        try{

            PreparedStatement statement= connection.prepareStatement("select L.lecture_id, S.course_id, C.course_name, C.credits, L.start_week, L.finish_week, L.building, L.week_days, L.start_unit, L.end_unit, S.term, T.teacher_name,S.grade,T.teacher_id " +
                    "FROM ((selected S natural join lectures L) natural join teachers T) natural join courses C " +
                    "WHERE S.student_id = ? AND S.term = ? "
            );

            statement.setString(1,student.getStudent_id());
            statement.setInt(2,term);
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next())
            {
                selecteds.add(new Selected(resultSet.getInt("term"),
                        null,
                        new Course(
                                resultSet.getString("course_id"),
                                resultSet.getString("course_name"),
                                resultSet.getDouble("credits")
                        ),
                        resultSet.getInt("grade"),
                        new Lecture(resultSet.getInt("lecture_id"),
                                new Teacher(
                                        resultSet.getString("teacher_id"), resultSet.getString("teacher_name")
                                ),null,
                                resultSet.getInt("start_week"),
                                resultSet.getInt("finish_week"),
                                resultSet.getString("building"),
                                resultSet.getInt("start_unit"),
                                resultSet.getInt("end_unit"),
                                resultSet.getString("week_days")
                        )
                )
                );

            }

        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return selecteds;
    }

    public static ArrayList<Selected> getGrades(Student student) // get grades
    {
        ArrayList<Selected>selecteds=new ArrayList<>();
        try{

            PreparedStatement statement= connection.prepareStatement("select S.student_id, S.course_id, C.course_name, C.credits, S.term, S.grade " +
                    "FROM selected S natural join courses C " +
                    "WHERE S.student_id = ? " +
                    "ORDER BY S.grade ASC "
            );

            statement.setString(1,student.getStudent_id());
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next())
            {
                selecteds.add(new Selected(resultSet.getInt("term"),
                        new Student(
                                resultSet.getString("student_id"), null, null, null, null, null, null
                        ),
                                new Course(
                                        resultSet.getString("course_id"),
                                        resultSet.getString("course_name"),
                                        resultSet.getDouble("credits")
                                ),
                                resultSet.getInt("grade"),
                                null
                        )
                );

            }

        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return selecteds;
    }

    public static ArrayList<Lecture> selectSubject(Student student) //Available courses
    {
        ArrayList<Lecture>notselected=new ArrayList<>();
        try{
            PreparedStatement statement= connection.prepareStatement("SELECT L.lecture_id, C.course_id, C.course_name, C.credits, L.start_week, L.finish_week, L.start_unit, L.end_unit, L.week_days, L.building, T.teacher_name, L.teacher_id " +
                    "FROM (courses C natural join lectures L) natural join teachers T " +
                    "WHERE C.course_id NOT IN (SELECT S.course_id FROM selected S WHERE S.student_id = ?) "
            );

            statement.setString(1,student.getStudent_id());
            ResultSet resultSet=statement.executeQuery();

            while (resultSet.next())
            {
                notselected.add(new Lecture(resultSet.getInt("lecture_id"),
                        new Teacher(
                                resultSet.getString("teacher_id"), resultSet.getString("teacher_name")
                        ),
                        new Course(
                                resultSet.getString("course_id"),
                                resultSet.getString("course_name"),
                                resultSet.getDouble("credits")
                        ),  resultSet.getInt("start_week"),
                            resultSet.getInt("finish_week"),
                            resultSet.getString("building"),
                            resultSet.getInt("start_unit"),
                            resultSet.getInt("end_unit"),
                            resultSet.getString("week_days")
                            )
                );
            }
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return notselected;
    }

    public static void insertToSelected(Student student, String course_id, int term)
    {
        try{
            PreparedStatement statement = connection.prepareStatement("INSERT INTO selected  VALUES (?, ?, ?, null)"
            );

            statement.setInt(1, term);
            statement.setString(2, student.getStudent_id());
            statement.setString(3,  course_id);
            int row = statement.executeUpdate();

        }catch (Exception e)
        {
            e.printStackTrace();
        }

    }

}
