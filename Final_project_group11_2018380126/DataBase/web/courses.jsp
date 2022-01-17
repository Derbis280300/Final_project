<%@ page import="oop.backend.Lecture" %>
<%@ page import="oop.backend.Selected" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 30.04.2021
  Time: 17:34s
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Courses</title>
    <%@include file="head.jsp"%>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>
</div>

<div class="container mt-3">
    <div class="row">
        <div class="col-3">
            <div class="card" >
                <img src="/pics/default.png" class="card-img-top" style="width: 150px;height: 150px;">
                <div class="card-body">
                    <h5 class="card-title"><%=student.getStudent_name()%></h5>
                    <p class="card-text"><%=student.getStudent_school()%></p>
                    <p class="card-text"><%=student.getStudent_major()%></p>
                    <p class="card-text"><%=student.getStudent_id()%></p>

                </div>
            </div>
        </div>
        <div class="col-9">
            <%
                ArrayList<Lecture>notselected=(ArrayList<Lecture>)request.getAttribute("lecture");
            %>
            <form action="/check_servlet" method="post">
                <div class="form-group">
                    <label>Course ID:</label>
                    <input type="text" name="course_id"  class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Term:</label>
                    <input type="text" name="term" value="" class="form-control" required>
                </div>
                <div class="form-group">
                    <button class="btn btn-success">Select</button>
                </div>
            </form>

            <table id="grid14605134931" class="gridtable" style="text-align:center">
                <thead style="background-color:#DEEDF7;">
                <tr>
                    <th>Course Code</th>
                    <th>Course Name</th>
                    <th>Credits</th>
                    <th>Start-End Weeks</th>
                    <th>Start-End Unit</th>
                    <th>Week Days</th>
                    <th>Teacher Name</th>
                </tr>

                </thead>
                <%  for (Lecture s:notselected) {
                %>

                <tr class="griddata-odd">
                    <div class="form-group">
                        <td><%=s.getCourse().getCourse_id()%></td>
                    </div>
                    <td><b><%=s.getCourse().getCourse_name()%></b></td>
                    <td><%=s.getCourse().getCredits()%></td>
                    <td><b><%=s.getStart_week()%>-<%=s.getFinish_week()%></b></td>
                    <td><b><%=s.getStart_unit()%>-<%=s.getEnd_unit()%></b></td>
                    <td><b><%=s.getWeek_days()%></b></td>
                    <td><b><%=s.getTeacher().getTeacher_name()%></b></td>
                </tr>


                <%
                    }
                %>
            </table>
        </div>

    </div>

</div>


</body>
<style>
    .gridtable {
        width: 100%;
        border-collapse: collapse;
        border: solid;
        border-width: 1px;
        border-color: #006CB2;
        vertical-align: middle;
        table-layout: fixed;
    }
    .griddata-odd {
        text-align: center;
        text-decoration: none;
        letter-spacing: 0;
        background-color: #EBEBEB;
    }
</style>
</html>
