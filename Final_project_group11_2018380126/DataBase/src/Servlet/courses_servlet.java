package Servlet;

import oop.backend.DBconnection;
import oop.backend.Lecture;
import oop.backend.Selected;
import oop.backend.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;


@WebServlet(value = "/courses")
public class courses_servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Student student=(Student)request.getSession().getAttribute("current_student");

        if(student!=null) {
            ArrayList<Lecture>notselected = DBconnection.selectSubject(student);

            request.setAttribute("lecture", notselected);
            request.getRequestDispatcher("courses.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
