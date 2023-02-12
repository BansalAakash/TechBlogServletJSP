<%--
  Created by IntelliJ IDEA.
  User: aakash
  Date: 11/02/23
  Time: 4:07 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isErrorPage="true" %>
<html>
    <head>
        <title>Error!</title>
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
        <div class="container text-center">
            <img src="img/error.png" class="img-fluid"/>
            <h3 class="display-3">Sorry, Something went wrong</h3>
<%--            <h5> <%= exception %></h5>--%>
            <h5><%= session.getAttribute("error") %></h5>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
        </div>

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

        <%--        Testing javascript--%>
        <%--        <script>--%>
        <%--            $(document).ready(function (){--%>
        <%--                alert("Document loaded!");--%>
        <%--            })--%>
        <%--        </script>--%>
    </body>
</html>
