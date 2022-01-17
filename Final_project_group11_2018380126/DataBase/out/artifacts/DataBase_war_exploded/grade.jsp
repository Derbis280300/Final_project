<%@ page import="oop.backend.Lecture" %>
<%@ page import="oop.backend.Selected" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 30.04.2021
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Grades</title>
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
                ArrayList<Selected>selecteds=(ArrayList<Selected>)request.getAttribute("selected");

            %>
            <table id="grid14605134931" class="gridtable" style="text-align:center">
                <thead style="background-color:#DEEDF7;">
                <tr>
                    <th width="15%">Semester</th>
                    <th width="15%">Course Code</th>
                    <th width="40%" >Course Name</th>
                    <th width="15%">Credits</th>
                    <th width="15%">Grade</th>
                </tr>

                </thead>
                <%  for (Selected s:selecteds) {
                %>
                <tr class="griddata-odd">
                    <td><%=s.getTerm()%></td>
                    <td><%=s.getCourse().getCourse_id()%></td>
                    <td><b><%=s.getCourse().getCourse_name()%></b></td>
                    <td><%=s.getCourse().getCredits()%></td>
                    <td><b><%=s.getGrade()%></b></td>
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
