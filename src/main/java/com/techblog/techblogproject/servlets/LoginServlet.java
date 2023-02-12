package com.techblog.techblogproject.servlets;

import com.techblog.techblogproject.dao.UserDao;
import com.techblog.techblogproject.entities.Message;
import com.techblog.techblogproject.entities.User;
import com.techblog.techblogproject.helper.ConnectionProvider;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;


@MultipartConfig
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("user_email");
        String password = request.getParameter("user_password");
        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        User user = userDao.getUserByEmailAndPassword(email, password);
        HttpSession session = request.getSession();
        if(user == null){
            Message message = new Message("Invalid details, try again!", "error", "alert-danger");
            session.setAttribute("msg", message);
            response.sendRedirect("loginPage.jsp");
        } else {
            session.setAttribute("currentuser", user);
            response.sendRedirect("profile.jsp");
        }
    }
}
