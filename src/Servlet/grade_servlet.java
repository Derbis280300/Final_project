package Servlet;

import oop.backend.DBconnection;
import oop.backend.Selected;
import oop.backend.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(value = "/grade")
public class grade_servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Student student=(Student)request.getSession().getAttribute("current_student");

        if(student!=null) {
            ArrayList<Selected>selecteds = DBconnection.getGrades(student);

            request.setAttribute("selected", selecteds);
            request.getRequestDispatcher("grade.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
