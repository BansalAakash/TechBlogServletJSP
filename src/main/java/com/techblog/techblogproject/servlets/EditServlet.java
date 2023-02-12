package com.techblog.techblogproject.servlets;

import com.techblog.techblogproject.dao.UserDao;
import com.techblog.techblogproject.entities.Message;
import com.techblog.techblogproject.entities.User;
import com.techblog.techblogproject.helper.ConnectionProvider;
import com.techblog.techblogproject.helper.Helper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;


@MultipartConfig
public class EditServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Edit servlet opened up");
        User user = (User) request.getSession().getAttribute("currentuser");
        String oldProfile = user.getProfile();
        user.setName(request.getParameter("user_name"));
        user.setEmail(request.getParameter("user_email"));
        user.setPassword(request.getParameter("user_password"));
        user.setAboutMe(request.getParameter("user_about"));
        Part part = request.getPart("user_profile");
        user.setProfile(part.getSubmittedFileName());
        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        boolean result = userDao.updateUser(user);
        PrintWriter out = response.getWriter();
        out.println(" <!DOCTYPE html>");
        out.println("<head>");
        out.println("<meta charset='UTF - 8'>");
        out.println("<title>Title</title>");
        out.println("</head>");
        out.println("<body>");
        HttpSession session = request.getSession();
        if (result) {
            String path = request.getRealPath("/") + "img/profilePics" + File.separator;
            String oldFile = path + oldProfile;
            String newFile = path + user.getProfile();
            if(!oldFile.equals("default.png"))
                Helper.deleteFile(oldFile);
            if (Helper.saveFile(part.getInputStream(), newFile)) {
                Message message = new Message("Profile details Updated..", "success", "alert-success");
                session.setAttribute("msg", message);
            } else {
                Message message = new Message("Something went wrong", "error", "alert-danger");
                session.setAttribute("msg", message);
            }
        } else {
            Message message = new Message("Something went wrong", "error", "alert-danger");
            session.setAttribute("msg", message);
        }
        response.sendRedirect("profile.jsp");
        out.println("</body>");
        out.println("</html>");


    }
}
