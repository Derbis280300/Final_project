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


@WebServlet(value = "/check_servlet")
public class check_servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Student student=(Student)request.getSession().getAttribute("current_student");
        String course_id=request.getParameter("course_id");
        String term=request.getParameter("term");
        int sem = Integer.parseInt(request.getParameter("term"));


        DBconnection.insertToSelected(student, course_id, sem);

        response.sendRedirect("/page?id="+term);
    }

}
