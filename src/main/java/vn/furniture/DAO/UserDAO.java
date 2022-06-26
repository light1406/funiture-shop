package vn.furniture.DAO;

import vn.furniture.db.DBContext;
import vn.furniture.entity.User;
import vn.furniture.service.Mailer;
import vn.furniture.service.RandomTxt;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDAO implements IObjectDAO<User> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    @Override
    public List<User> getList() {
        List<User> list = new ArrayList<User>();
        String query = "SELECT * FROM user";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(
                        rs.getInt("userId"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getBoolean("role"),
                        rs.getBoolean("status"),
                        rs.getTimestamp("createdAt"),
                        rs.getTimestamp("updatedAt"),
                        rs.getString("code")
                ));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public User getRow(String email) {
        String query = "SELECT * FROM `user` WHERE email = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt("userId"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getBoolean("role"),
                        rs.getBoolean("status"),
                        rs.getTimestamp("createAt"),
                        rs.getTimestamp("updateAt"),
                        rs.getString("code"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public int add(User entity) {
        String query = "INSERT INTO `user`(email, `password`, userName, phone, address, `role`, status,createAt,code)\n" +
                "VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getEmail());
            ps.setString(2, entity.getPassword());
            ps.setString(3, entity.getUserName());
            ps.setString(4, entity.getPhone());
            ps.setString(5, entity.getAddress());
            ps.setBoolean(6, entity.isRole());
            ps.setBoolean(7, entity.isStatus());
            ps.setTimestamp(8, entity.getCreatedAt());
            ps.setString(9, entity.getCode());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int update(User entity) {
        String query = "UPDATE `user`\n" +
                "SET `password`=?,\n" +
                "userName=?,\n" +
                "phone=?, \n" +
                "address =?,\n" +
                "`role`=?,\n" +
                "status=?,\n" +
                "createAt=?,\n" +
                "updateAt=?,\n" +
                "code =?\n" +
                "WHERE email =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getPassword());
            ps.setString(2, entity.getUserName());
            ps.setString(3, entity.getPhone());
            ps.setString(4, entity.getAddress());
            ps.setBoolean(5, entity.isRole());
            ps.setBoolean(6, entity.isStatus());
            ps.setTimestamp(7, new Timestamp(entity.getCreatedAt().getTime()));
            ps.setTimestamp(8, new Timestamp(new Date().getTime()));
            ps.setString(9, entity.getCode());
            ps.setString(10, entity.getEmail());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


    @Override
    public int delete(User entity) {
        String query = "DELETE FROM `user`\n" +
                "WHERE userId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, entity.getUserId());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


    public String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            byte[] hash = md.digest();
            BigInteger number = new BigInteger(1, hash);
            return number.toString(16);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
    }

}
