<%@ page import="com.techblog.techblogproject.entities.User" %>
<%@ page import="com.techblog.techblogproject.entities.Message" %><%--
  Created by IntelliJ IDEA.
  User: aakash
  Date: 11/02/23
  Time: 10:01 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="ErrorPage.jsp" %>
<%
    User user = session != null ? (session.getAttribute("currentuser") != null ? (User) session.getAttribute("currentuser") : null) : null;
    if (user == null)
        response.sendRedirect("loginPage.jsp");
    assert user != null;%>
<html>
    <head>
        <title>Title</title>
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
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/technology.png">
    </head>
    <body>

        <%--        Navbar--%>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><span class="fa fa-bell"></span>Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Java</a>
                            <a class="dropdown-item" href="#">Kotlin</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">DS</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span> Contact us</a>
                    </li>
                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="logout"><span class="fa fa-user-plus"></span>Logout</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profileModal"><span
                                class="fa fa-user-circle"></span><%=user.getName()%>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- End of navbar -->

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

        <!-- Profile Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="img/profilePics/<%=user.getProfile()%>" class="img-fluid"
                                 style="border-radius: 50%; max-width: 150px"/>
                            <h5 class="mt-3"><%=user.getName()%>
                            </h5>
                        </div>
                        <div id="profile_detail">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th scope="row">ID:</th>
                                        <td><%=user.getId()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email:</th>
                                        <td><%=user.getEmail()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Gender:</th>
                                        <td><%=user.getGender()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Status:</th>
                                        <td><%=user.getAboutMe()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Registered on:</th>
                                        <td><%=user.getRegDate()%>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="profile_edit" style="display: none;" class="text-center">
                            <form method="post" action="edit" enctype="multipart/form-data">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%=user.getId()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Name:</th>
                                            <td><input class="form-control" type="text" name="user_name"
                                                       value="<%=user.getName()%>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Profile pic:</th>
                                            <td><input class="form-control" type="file" name="user_profile"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><input class="form-control" type="email" name="user_email"
                                                       value="<%=user.getEmail()%>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%=user.getGender().toUpperCase()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Status:</th>
                                            <td><textarea class="form-control"
                                                          name="user_about"><%=user.getAboutMe()%></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Password:</th>
                                            <td><input class="form-control" type="password" name="user_password"
                                                       value="<%=user.getPassword()%>"/>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="container">
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>
                            </form>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="editProfileButton">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <%--            End of modal--%>

        <%--        Javascripts--%>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js"
                integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                crossorigin="anonymous"></script>
        <script src="js/myJS.js"></script>
        <script>
            $(document).ready(function () {
                let editMode = true;
                $('#editProfileButton').click(function () {
                    if (editMode) {
                        $("#profile_detail").hide();
                        $("#profile_edit").show();
                        $(this).text("Back");
                    } else {
                        $("#profile_detail").show();
                        $("#profile_edit").hide();
                        $(this).text("Edit");
                    }
                    editMode = !editMode;
                });
            });
        </script>

        <%--        Testing javascript--%>
        <%--        <script>--%>
        <%--            $(document).ready(function (){--%>
        <%--                alert("Document loaded!");--%>
        <%--            })--%>
        <%--        </script>--%>
    </body>
</html>
