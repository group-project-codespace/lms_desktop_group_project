package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class connection {

    public static ResultSet execute(String query) {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms_desktop_db", "root", "Abcd!234");
            Statement statement = connection.createStatement();

            if (query.startsWith("SELECT") | query.startsWith("select")) {
                ResultSet resultSet = statement.executeQuery(query);
                return resultSet;
            } else {

                int result = statement.executeUpdate(query);
                return null;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
