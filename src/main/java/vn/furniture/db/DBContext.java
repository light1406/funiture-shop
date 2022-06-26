package vn.furniture.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    private static Connection connection;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/furniture_shop";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
        }
        return connection;
    }

    public static void main(String[] args) throws SQLException {
        DBContext db = new DBContext();
        if(db.getConnection() == null){
            System.out.println("That bai");
        }else{
            System.out.println("Thanh Cong");
        }
    }
}
