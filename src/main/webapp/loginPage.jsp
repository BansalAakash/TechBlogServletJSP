<%@ page import="com.techblog.techblogproject.entities.Message" %><%--
  Created by IntelliJ IDEA.
  User: aakash
  Date: 09/02/23
  Time: 10:38 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Login Page</title>
        <%--        CSS Libs--%>
        <%--        Bootstrap--%>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/myStyles.css"/>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background {
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 64% 88%, 25% 100%, 0 90%, 0 0);
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="d-flex align-items-center primary-background banner-background" style="height: 70vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <br/>
                                <span class="fa fa-user-plus fa-3x"></span>
                                Login here
                            </div>

                            <%
                                Message message = (Message) session.getAttribute("msg");
                                if (message != null) {
                            %>
                            <div class="alert <%=message.getCssClass()%>" role="alert">
                                <%= message.getContent() %>
                            </div>
                            <%
                                    session.removeAttribute("msg");
                                }
                            %>
                            <div class="card-body">
                                <form action="login" method="post" id="loginForm">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1"
                                               name="user_email"
                                               aria-describedby="emailHelp" placeholder="Enter email" required>
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email
                                            with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1"
                                               placeholder="Password" name="user_password" required>
                                    </div>
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>


        <%--        Javascripts--%>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js"
                integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/myJS.js"></script>

        <%--        Testing javascript--%>
        <%--        <script>--%>
        <%--            $(document).ready(function (){--%>
        <%--                alert("Document loaded!");--%>
        <%--            })--%>
        <%--        </script>--%>
    </body>
</html>
