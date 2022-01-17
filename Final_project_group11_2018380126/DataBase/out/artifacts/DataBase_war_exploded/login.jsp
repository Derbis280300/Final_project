<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 30.04.2021
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%@include file="head.jsp"%>
</head>
<body>
<div class="container">
<%@include file="navbar.jsp"%>
</div>
<div class="container mt-3">
    <div class="row">
        <div class="col-6 mx-auto">
            <%
                String wrong_login=request.getParameter("wrongId");
                String wrong_password=request.getParameter("wrongPassword");


            %>
            <%
                if(wrong_login!=null)
                {
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Incorrect student id!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <%
                if(wrong_password!=null)
                {
            %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Incorrect password!
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
            <%
                }
            %>


            <form action="/Servlet_login" method="post">
                <div class="form-group">
                    <label>Student id:</label>
                    <input type="text" name="login" value="" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>PASSWORD:</label>
                    <input type="password" name="student_password"  class="form-control" required>
                </div>
                <div class="form-group">
                    <button class="btn btn-success">SIGN IN</button>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>
