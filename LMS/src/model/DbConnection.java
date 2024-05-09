package model;

import java.sql.*;

public class DbConnection {

    private static DbConnection dbConnection = null;
    private Connection connection;
  private static final String DB_HOST = System.getenv("DB_HOST");
  private static final String DB_NAME = System.getenv("DB_NAME");
  private static final String DB_USER = System.getenv("DB_USER");
  private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");
  
    private DbConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        //2 step
        connection = DriverManager.getConnection("jdbc:mysql://"+DB_HOST+":3306/"+DB_NAME,
                DB_USER, DB_PASSWORD);
    }

    public static DbConnection getInstance() throws SQLException, ClassNotFoundException {
        if (dbConnection == null) {
            dbConnection = new DbConnection();
        }
        return dbConnection;
    }

    public ResultSet executeQuery(String query, Object... params) throws SQLException {
        PreparedStatement statement = connection.prepareStatement(query);
        for (int i = 0; i < params.length; i++) {
            statement.setObject(i + 1, params[i]);
        }
        return statement.executeQuery();
    }
}
// getInstance().getConnection();
