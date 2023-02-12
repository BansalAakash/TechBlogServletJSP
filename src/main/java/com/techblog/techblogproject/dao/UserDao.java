package com.techblog.techblogproject.dao;

import com.techblog.techblogproject.entities.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    private final Connection connection;

    public UserDao(Connection connection) {
        this.connection = connection;
    }

    //Insert data to DB
    public String saveUser(User user) {
        try {
            Thread.sleep(1000);
            String query = "insert into user(name, email, password, gender, about) values(?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getGender());
            preparedStatement.setString(5, user.getAboutMe());
            System.out.println(preparedStatement.toString());
            preparedStatement.executeUpdate();
            return "Success";
        } catch (Exception e) {
            return e.getMessage();
        }
    }
    public User getUserByEmailAndPassword (String email, String password) {
        User user = null;
        try {
            String query = "select * from user where email=? and password=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            System.out.println(preparedStatement.toString());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                user = new User();
                user.setName(resultSet.getString("name"));
                user.setId(resultSet.getInt("id"));
                user.setEmail(email);
                user.setPassword(password);
                user.setGender(resultSet.getString("gender"));
                user.setAboutMe(resultSet.getString("about"));
                user.setRegDate(resultSet.getTimestamp("regdate"));
                user.setProfile(resultSet.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User user) {
        String query = "update user set name = ?, email = ?, password = ?, about = ?, profile = ? where id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getAboutMe());
            preparedStatement.setString(5, user.getProfile().length() > 0 ? user.getProfile() : "default.png");
            preparedStatement.setInt(6, user.getId());
            preparedStatement.executeUpdate();
            System.out.println(preparedStatement.toString());
            return true;
        }catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
