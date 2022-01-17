package Servlet;

import oop.backend.DBconnection;
import oop.backend.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet( value = "/Servlet_login")
public class Servlet_login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     request.getRequestDispatcher("login.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String student_id=request.getParameter("login");
     String password=request.getParameter("student_password");

     Student student=DBconnection.checkStudent(student_id);

        if(student!=null)
        {

            if(student.getStudent_password().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("current_student", student);
                response.sendRedirect("/page?id=1");
            }
            else
            {
                response.sendRedirect("Servlet_login?wrongPassword");
            }

        }
        else
        {
            response.sendRedirect("Servlet_login?wrongId");
        }
    }
}
