<%@ page import="oop.backend.Student" %>
<nav class="navbar navbar-expand-lg navbar-dark " style="background-color: #870612; width: 1800px">
    <a class="navbar-brand" href="http://localhost:8080/page?id=1">
        <div class="logo-image">
            <img src="https://dittet.com/wp-content/uploads/2020/02/npu.png" class="img-fluid">
        </div>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <%
                Student student=(Student) session.getAttribute("current_student");
                if(student!=null)
                {
            %>
                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:8080/page?id=1"><b>HOME</b><span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="https://en.nwpu.edu.cn/">NORTHWESTERN POLYTECHNICAL UNIVERSITY</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Servlet_login">Log out</a>
                </li>


                <%
                    }else
                    {
                %>
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">NORTHWESTERN POLYTECHNICAL UNIVERSITY</a>
            </li>

            <%
                }
            %>

        </ul>

    </div>
</nav>

<style>
    .logo-image{
        width: 300px;
        height: 70px;
        overflow: hidden;
        margin-top: -6px;
    }
</style>
