package com.techblog.techblogproject.helper;

import java.sql.*;

public class ConnectionProvider {
    private static Connection connection;
    private static final String url = "jdbc:mysql://localhost:3306/techblogprojectjspservlet";
    private static final String user = "root";
    private static final String password = "welcome123";

    public static Connection getConnection() {
        if(connection == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url, user, password);
                if(connection.isClosed())
                    throw new Exception("Connection is closed");
                else System.out.println("Connection is open");
            } catch (Exception e){
                e.printStackTrace();
            }
        }
        return connection;
    }
}
