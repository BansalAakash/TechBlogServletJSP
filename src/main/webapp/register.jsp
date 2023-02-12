<%--
  Created by IntelliJ IDEA.
  User: aakash
  Date: 10/02/23
  Time: 8:45 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="primary-background banner-background" style="padding-bottom: 100px">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <br>
                            Register here
                        </div>
                        <div class="card-body">
                            <form action="register" method="post" id="regForm">
                                <div class="form-group">
                                    <label for="username">User name</label>
                                    <input type="text" class="form-control" id="username" name="user_name"
                                           aria-describedby="emailHelp" placeholder="Enter username">
                                </div>
                                <div class="form-group">
                                    <label for="useremail">Email address</label>
                                    <input type="email" class="form-control" id="useremail" name="user_email"
                                           aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with
                                        anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="userpassword">Password</label>
                                    <input type="password" class="form-control" id="userpassword" name="user_password"
                                           placeholder="Password">
                                </div>
                                <div class="form-group">
                                    Select Gender:
                                    <label for="usermale"><span
                                            class="fa fa-mars"></span></label>
                                    <input type="radio" id="usermale" name="user_gender" value="male">
                                    <label for="userfemale"><span
                                            class="fa fa-venus"></span></label>
                                    <input type="radio" id="userfemale" name="user_gender" value="female">
                                </div>
                                <div class="form-group">
                                    <label for="userabout">About you:</label>
                                    <textarea class="form-control" id="userabout" name="user_about"
                                              placeholder="Something about you?"></textarea>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="checked">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms and
                                        Conditions</label>
                                </div>
                                <br>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-2x"></span>
                                    <h4> Please wait... </h4>
                                </div>
                                <h5 class="text-center" id="alert_msg" style="display:none;"></h5>
                                <button type="submit" class="btn btn-primary" id="submit_button">Submit</button>
                            </form>
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

        <script>
            $(document).ready(function () {
                console.log("Register Page loaded!");
                $('#regForm').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $('#submit_button').hide();
                    $('#loader').show();
                    $.ajax({
                        url: 'register',
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, abcd) {
                            $('#submit_button').show();
                            $('#loader').hide();
                            if (data.trim() === 'Success') {
                                swal({
                                    title: data,
                                    text: "Redirecting you to login page in 2 seconds",
                                    type: "success",
                                    button: false,
                                    timer: 2000
                                }).then(function () {
                                    window.location = "loginPage.jsp";
                                });
                            } else {
                                swal(data);
                            }
                        },
                        error: function (abcd, textStatus, errorThrown) {
                            console.log(abcd);
                            $('#submit_button').hide();
                            $('#loader').show();
                            swal("Error");
                        },
                        processData: false,
                        contentType: false
                    });
                })
            })
        </script>
    </body>
</html>
