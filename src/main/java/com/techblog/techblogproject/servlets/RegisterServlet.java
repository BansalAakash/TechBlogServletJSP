package com.techblog.techblogproject.servlets;

import com.techblog.techblogproject.dao.UserDao;
import com.techblog.techblogproject.entities.User;
import com.techblog.techblogproject.helper.ConnectionProvider;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean checked = request.getParameter("checked") != null;
        PrintWriter out = response.getWriter();

        if (checked) {
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String gender = request.getParameter("user_gender");
            String about = request.getParameter("user_about");
            User user = new User(name, email, password, gender, about);
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            String result = userDao.saveUser(user);
            if (result.equals("Success")) {
                out.println("Success");
            } else {
                out.println(result);
            }
        } else {
            out.println("Terms and conditions not accepted!");
        }
    }
}
