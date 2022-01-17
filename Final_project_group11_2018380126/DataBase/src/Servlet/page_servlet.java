package Servlet;

import oop.backend.DBconnection;
import oop.backend.Selected;
import oop.backend.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;

@WebServlet(value = "/page")
public class page_servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Student student=(Student)request.getSession().getAttribute("current_student");

        if(student!=null) {
            Set<String> semesters = request.getParameterMap().keySet();
            int sem = 1;
            for (String semester : semesters) {
                sem = Integer.parseInt(request.getParameter(semester));
            }
            ArrayList<Selected>selecteds = DBconnection.getSubject(student,sem);

                request.setAttribute("selected", selecteds);
                request.getRequestDispatcher("page.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
