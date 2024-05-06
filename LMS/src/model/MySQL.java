/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

/**
 *
 * @author ishar
 */
public class MySQL {
    private static Connection connection;
    static{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms_desktop_db", "root", "fight2kill");
            
        } catch (Exception e) {
        e.printStackTrace();
        }
    }
    
    public static ResultSet  execute(String query)throws Exception{

       Statement statement = connection.createStatement();
       
    if(query.startsWith("SELECT")){
        return statement.executeQuery(query);
    }else{
        statement.executeUpdate(query);
        return null; 
    }
    }
    
}
