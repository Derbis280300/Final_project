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
    <title>Page</title>
    <%@include file="head.jsp"%>

    <style>
        table.fixed { table-layout:fixed; }
        table.fixed td { overflow: hidden; }
    </style>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>
</div>

<div class="container mt-3">
    <div class="row">
        <div class="col-2">
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
        <div class="col-10">
            <%
                ArrayList<Selected>selecteds=(ArrayList<Selected>)request.getAttribute("selected");
                if(selecteds.isEmpty() == false) {
            %>
            <label class="title">Current semester is <b><%=selecteds.get(0).getTerm()%></b></label>
            <%
                }
            %>
            <br><lablel fro="semester">Select Semester:</lablel>
            <select onchange="location = this.value;">
                <option value="http://localhost:8080/page?id=1">1</option>
                <option value="http://localhost:8080/page?id=2">2</option>
                <option value="http://localhost:8080/page?id=3">3</option>
                <option value="http://localhost:8080/page?id=4">4</option>
                <option value="http://localhost:8080/page?id=5">5</option>
                <option value="http://localhost:8080/page?id=6">6</option>
                <option value="http://localhost:8080/page?id=7">7</option>
                <option value="http://localhost:8080/page?id=8">8</option>
            </select>
            <div>
                <button type="button" onclick="location.href = 'http://localhost:8080/grade';" class="btn btn-primary btn-sm btn-lg">Grades</button>
                <button type="button" onclick="location.href = 'http://localhost:8080/courses';" class="btn btn-primary btn-sm btn-lg">Available Courses</button>
            </div>
            <table id="manualArrangeCourseTable" align="center" class="grid-container" style="text-align:center" cellpadding="20px" border="1" width="100%" class="fixed">
                <thead>
                <tr>
                    <th style="background-color:#DEEDF7; width: 15px" width="9%">Units/Weeks
                    </th>
                    <th style="background-color:#DEEDF7;" width="13%">
                        <font size="2px" width="15px%">Mon</font>
                    </th>
                    <th style="background-color:#DEEDF7;" width="13%">
                        <font size="2px" width="15px%">Tue</font>
                    </th>
                    <th style="background-color:#DEEDF7;" width="13%">
                        <font size="2px" width="15px%">Wed</font>
                    </th>
                    <th style="background-color:#DEEDF7;" width="13%">
                        <font size="2px" width="15px">Thur</font>
                    </th>
                    <th style="background-color:#DEEDF7;" width="13%">
                        <font size="2px" width="15px">Fri</font>
                    </th>
                    <th style="background-color:#DEEDF7;" width="13%">
                        <font size="2px" width="15px">Sat</font>
                    </th>
                    <th style="background-color:#DEEDF7;" width="13%">
                        <font size="2px" width="15px">Sun</font>
                    </th>
                </tr>
                </thead>
                <tbody><tr>

                    <td style="background-color:lightgreen" width="13%">
                        <font size="2px"><b>1</b><br>08:30-09:15</font>
                    </td>
                    <%
                        int[][] arr = new int[14][8];
                        for (Selected s:selecteds) {
                            if(s.getLecture().getWeek_days().contains("Mon")) {
                                arr[s.getLecture().getStart_unit()][1] = 1;
                            }
                            if(s.getLecture().getWeek_days().contains("Mon")) {
                                arr[s.getLecture().getEnd_unit()][1] = 1;
                            }
                            if(s.getLecture().getWeek_days().contains("Tue")) {
                                arr[s.getLecture().getStart_unit()][2] = 1;
                            }
                            if(s.getLecture().getWeek_days().contains("Tue")) {
                                arr[s.getLecture().getEnd_unit()][2] = 1;
                            }
                            if(s.getLecture().getWeek_days().contains("Wed")) {
                                arr[s.getLecture().getStart_unit()][3] = 1;
                            }
                            if(s.getLecture().getWeek_days().contains("Wed")) {
                                arr[s.getLecture().getEnd_unit()][3] = 1;
                            }
                            if(s.getLecture().getWeek_days().contains("Thur")) {
                                arr[s.getLecture().getStart_unit()][4] = 1;
                            }
                            if(s.getLecture().getWeek_days().contains("Thur")) {
                                arr[s.getLecture().getEnd_unit()][4] = 1;
                            }
                            if(s.getLecture().getWeek_days().contains("Fri")) {
                                arr[s.getLecture().getStart_unit()][5] = 1;
                            }
                            if(s.getLecture().getWeek_days().contains("Fri")) {
                                arr[s.getLecture().getEnd_unit()][5] = 1;
                            }
                            if(s.getLecture().getWeek_days().contains("Sat")) {
                                arr[s.getLecture().getStart_unit()][6] = 1;
                            }
                            if(s.getLecture().getWeek_days().contains("Sat")) {
                                arr[s.getLecture().getEnd_unit()][6] = 1;
                            }
                            if(s.getLecture().getWeek_days().contains("Sun")) {
                                arr[s.getLecture().getStart_unit()][7] = 1;
                            }
                            if(s.getLecture().getWeek_days().contains("Sun")) {
                                arr[s.getLecture().getEnd_unit()][7] = 1;
                            }
                        }
                    %>


                    <%if (arr[1][1] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 1 && s.getLecture().getEnd_unit() == 2 && s.getLecture().getWeek_days().contains("Mon")) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle"><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[1][2] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 1 && s.getLecture().getEnd_unit() == 2 && s.getLecture().getWeek_days().contains("Tue")) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[1][3] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 1 && s.getLecture().getEnd_unit() == 2 && s.getLecture().getWeek_days().contains("Wed")) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[1][4] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 1 && s.getLecture().getEnd_unit() == 2 && s.getLecture().getWeek_days().contains("Thur")) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[1][5] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 1 && s.getLecture().getEnd_unit() == 2 && s.getLecture().getWeek_days().contains("Fri") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[1][6] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 1 && s.getLecture().getEnd_unit() == 2 && s.getLecture().getWeek_days().contains("Sat") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[1][7] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 1 && s.getLecture().getEnd_unit() == 2 && s.getLecture().getWeek_days().contains("Sun") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                </tr>
                <tr>
                    <td style="background-color:lightgreen">
                        <font size="2px"><b>2</b><br>09:25-10:10</font>
                    </td>
                    <%--<td id="TD1_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                    <td id="TD14_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                    <td id="TD27_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                    <td id="TD40_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                    <td id="TD53_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                    <td id="TD66_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                    <td id="TD79_0" style="backGround-Color:#ffffff;font-size:12px"></td>
  --%>                </tr>
                <tr>
                    <td style="background-color:lightgreen">
                        <font size="2px"><b>3</b><br>10:30-11:15</font>
                    </td>
                    <%
                        if (arr[3][1] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 3 && s.getLecture().getEnd_unit() == 4 && s.getLecture().getWeek_days().contains("Mon") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[3][2] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 3 && s.getLecture().getEnd_unit() == 4 && s.getLecture().getWeek_days().contains("Tue") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[3][3] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 3 && s.getLecture().getEnd_unit() == 4 && s.getLecture().getWeek_days().contains("Wed") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[3][4] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 3 && s.getLecture().getEnd_unit() == 4 && s.getLecture().getWeek_days().contains("Thur") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[3][5] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 3 && s.getLecture().getEnd_unit() == 4 && s.getLecture().getWeek_days().contains("Fri") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[3][6] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 3 && s.getLecture().getEnd_unit() == 4 && s.getLecture().getWeek_days().contains("Sat") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[3][7] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 3 && s.getLecture().getEnd_unit() == 4 && s.getLecture().getWeek_days().contains("Sun") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                </tr>
                <tr>
                    <td style="background-color:lightgreen">
                        <font size="2px"><b>4</b><br>11:25-12:10</font>
                    </td>
                    <%-- <td id="TD3_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                     <td id="TD16_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                     <td id="TD29_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                     <td id="TD42_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                       <td id="TD55_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                       <td id="TD68_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                       <td id="TD81_0" style="backGround-Color:#ffffff;font-size:12px"></td>
 --%>                </tr>
                <tr>
                    <td style="background-color:pink">
                        <font size="2px"><b>5</b><br>12:20-13:05</font>
                    </td>
                    <%
                        if (arr[5][1] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 5 && s.getLecture().getEnd_unit() == 6 && s.getLecture().getWeek_days().contains("Mon") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[5][2] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 5 && s.getLecture().getEnd_unit() == 6 && s.getLecture().getWeek_days().contains("Tue") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[5][3] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 5 && s.getLecture().getEnd_unit() == 6 && s.getLecture().getWeek_days().contains("Wed") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[5][4] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 5 && s.getLecture().getEnd_unit() == 6 && s.getLecture().getWeek_days().contains("Thur") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[5][5] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 5 && s.getLecture().getEnd_unit() == 6 && s.getLecture().getWeek_days().contains("Fri") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[5][6] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 5 && s.getLecture().getEnd_unit() == 6 && s.getLecture().getWeek_days().contains("Sat") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[5][7] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 5 && s.getLecture().getEnd_unit() == 6 && s.getLecture().getWeek_days().contains("Sun") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                </tr>
                <tr>
                    <td style="background-color:pink">
                        <font size="2px"><b>6</b><br>13:05-13:50</font>
                    </td>
                    <%--   <td id="TD5_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                       <td id="TD18_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                       <td id="TD31_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                       <td id="TD44_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                       <td id="TD57_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                       <td id="TD70_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                       <td id="TD83_0" style="backGround-Color:#ffffff;font-size:12px"></td>
     --%>                </tr>
                <tr>
                    <td style="background-color:lightblue">
                        <font size="2px"><b>7</b><br>14:00-14:45</font>
                    </td>
                    <%
                        if (arr[7][1] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 7 && s.getLecture().getEnd_unit() == 8 && s.getLecture().getWeek_days().contains("Mon") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[7][2] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 7 && s.getLecture().getEnd_unit() == 8 && s.getLecture().getWeek_days().contains("Tue") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[7][3] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 7 && s.getLecture().getEnd_unit() == 8 && s.getLecture().getWeek_days().contains("Wed") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[7][4] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 7 && s.getLecture().getEnd_unit() == 8 && s.getLecture().getWeek_days().contains("Thur") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[7][5] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 7 && s.getLecture().getEnd_unit() == 8 && s.getLecture().getWeek_days().contains("Fri") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[7][6] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 7 && s.getLecture().getEnd_unit() == 8 && s.getLecture().getWeek_days().contains("Sat") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[7][7] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 7 && s.getLecture().getEnd_unit() == 8 && s.getLecture().getWeek_days().contains("Sun") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                </tr>
                <tr>
                    <td style="background-color:lightblue">
                        <font size="2px"><b>8</b><br>14:55-15:40</font>
                    </td>
                    <%--<td id="TD7_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                    <td id="TD20_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                    <td id="TD33_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                    <td id="TD46_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                    <td id="TD59_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                    <td id="TD72_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                  <td id="TD85_0" style="backGround-Color:#ffffff;font-size:12px"></td>
--%>                </tr>
                <tr>
                    <td style="background-color:lightblue">
                        <font size="2px"><b>9</b><br>16:00-16:45</font>
                    </td>
                    <%
                        if (arr[9][1] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 9 && s.getLecture().getEnd_unit() == 10 && s.getLecture().getWeek_days().contains("Mon") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[9][2] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 9 && s.getLecture().getEnd_unit() == 10 && s.getLecture().getWeek_days().contains("Tue") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[9][3] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 9 && s.getLecture().getEnd_unit() == 10 && s.getLecture().getWeek_days().contains("Wed") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[9][4] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 9 && s.getLecture().getEnd_unit() == 10 && s.getLecture().getWeek_days().contains("Thur") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[9][5] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 9 && s.getLecture().getEnd_unit() == 10 && s.getLecture().getWeek_days().contains("Fri") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[9][6] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 9 && s.getLecture().getEnd_unit() == 10 && s.getLecture().getWeek_days().contains("Sat") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[9][7] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 9 && s.getLecture().getEnd_unit() == 10 && s.getLecture().getWeek_days().contains("Sun") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                </tr>
                <tr>
                    <td style="background-color:lightblue">
                        <font size="2px"><b>10</b><br>16:55-17:40</font>
                    </td>
                    <%--<td id="TD9_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                      <td id="TD22_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                      <td id="TD35_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                      <td id="TD48_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                      <td id="TD61_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                    <td id="TD74_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                    <td id="TD87_0" style="backGround-Color:#ffffff;font-size:12px"></td>
  --%>                </tr>
                <tr>
                    <td style="background-color:#EEFF00">
                        <font size="2px"><b>11</b><br>19:00-19:45</font>
                    </td>
                    <%
                        if (arr[11][1] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 11 && s.getLecture().getEnd_unit() == 12 && s.getLecture().getWeek_days().contains("Mon") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[11][2] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 11 && s.getLecture().getEnd_unit() == 12 && s.getLecture().getWeek_days().contains("Tue") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[11][3] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 11 && s.getLecture().getEnd_unit() == 12 && s.getLecture().getWeek_days().contains("Wed") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[11][4] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 11 && s.getLecture().getEnd_unit() == 12 && s.getLecture().getWeek_days().contains("Thur") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[11][5] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 11 && s.getLecture().getEnd_unit() == 12 && s.getLecture().getWeek_days().contains("Fri") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[11][6] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 11 && s.getLecture().getEnd_unit() == 12 && s.getLecture().getWeek_days().contains("Sat") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[11][7] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 11 && s.getLecture().getEnd_unit() == 12 && s.getLecture().getWeek_days().contains("Sun") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                </tr>
                <tr>
                    <td style="background-color:#EEFF00">
                        <font size="2px"><b>12</b><br>19:55-20:40</font>
                    </td>
                    <%--    <td id="TD11_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                        <td id="TD24_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                        <td id="TD37_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                        <td id="TD50_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                        <td id="TD63_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                        <td id="TD76_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                      <td id="TD89_0" style="backGround-Color:#ffffff;font-size:12px"></td>
    --%>                </tr>
                <tr>
                    <td style="background-color:#EEFF00">
                        <font size="2px"><b>13</b><br>20:40-21:25</font>
                    </td>
                    <%
                        if (arr[13][1] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 13 && s.getLecture().getWeek_days().contains("Mon") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[13][2] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                    %>
                    <%if (arr[13][3] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 13 && s.getLecture().getWeek_days().contains("Wed") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[13][4] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 13 && s.getLecture().getWeek_days().contains("Thur") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[13][5] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 13 && s.getLecture().getWeek_days().contains("Fri") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[13][6] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 13 && s.getLecture().getWeek_days().contains("Sat") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                    <%if (arr[13][7] == 0){ %>
                    <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px;" rowspan="2" width="13%"></td>
                    <% } else {
                        for (Selected s:selecteds) {
                            if(s.getLecture().getStart_unit() == 13 && s.getLecture().getWeek_days().contains("Sun") ) {
                    %>
                    <td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" width="13%" class="infoTitle" ><b><%=s.getCourse().getCourse_name()%></b>(<%=s.getCourse().getCourse_id()%>)[<%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>,<%=s.getLecture().getBuilding()%>]</td>
                    <%
                                }
                            }
                        }
                    %>
                </tr>
                </tbody>
            </table>
            <table class="gridtable">
                <thead class="gridhead">


                <tr>
                    <th width="5%">No.</th>
                    <th width="10%">Number</th>
                    <th width="20%">Course Name</th>
                    <th width="20%">Teacher</th>
                    <th width="5%">Credit</th>
                    <th width="20%">Schedule</th>
                    <th width="10%">Start-Stop Weeks</th>
                </tr>

                </thead>

                <tbody ><tr>
                    <%
                        int num = 1;
                        for (Selected s:selecteds) {
                        %>
                        <td><%=num%></td>
                        <td><%=s.getCourse().getCourse_id()%></td>
                        <td><%=s.getCourse().getCourse_name()%></td>
                        <td><%=s.getLecture().getTeacher().getTeacher_name()%></td>
                        <td><%=s.getCourse().getCredits()%></td>
                        <td><%=s.getLecture().getWeek_days()%>. <%=s.getLecture().getStart_unit()%>-<%=s.getLecture().getEnd_unit()%></td>
                        <td><%=s.getLecture().getStart_week()%>-<%=s.getLecture().getFinish_week()%>
                        </td></tr>
                    <%
                        num = num + 1;
                        } %>



                    </tbody>
            </table>

        </div>

    </div>

</div>


</body>

</html>
