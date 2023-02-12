package com.techblog.techblogproject.servlets;

import com.techblog.techblogproject.dao.UserDao;
import com.techblog.techblogproject.entities.Message;
import com.techblog.techblogproject.entities.User;
import com.techblog.techblogproject.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@MultipartConfig
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("currentuser");
        Message message = new Message("Logout Successfully!", "success", "alert-success");
        session.setAttribute("msg", message);
        response.sendRedirect("loginPage.jsp");
    }
}
