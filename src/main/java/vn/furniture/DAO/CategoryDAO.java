package vn.furniture.DAO;

import vn.furniture.db.DBContext;
import vn.furniture.entity.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO implements IObjectDAO<Category> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public String getId(String category){
        String query = "SELECT categoryId FROM category WHERE categoryName =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, category);
            rs = ps.executeQuery();
            return rs.next() ? rs.getString("categoryId") : null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Category> getList() {
        List<Category> list = new ArrayList<Category>();
        String query = "SELECT * FROM category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getString("categoryId"),
                        rs.getString("categoryName"),
                        rs.getBoolean("status"),
                        rs.getTimestamp("createAt"),
                        rs.getTimestamp("updateAt")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return list;
    }

    @Override
    public Category getRow(String cid) {
        String query = "SELECT * FROM category WHERE categoryId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getString("categoryId"),
                        rs.getString("categoryName"),
                        rs.getBoolean("status"),
                        rs.getTimestamp("createAt"),
                        rs.getTimestamp("updateAt"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public int add(Category entity) {
        String query = "INSERT INTO category(categoryId, categoryName,`status`,createAt)\n" +
                "VALUES(?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getCategoryId());
            ps.setString(2, entity.getCategoryName());
            ps.setBoolean(3, entity.isStatus());
            ps.setTimestamp(4, entity.getCreateAt());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int update(Category entity) {
        String query = "UPDATE category\n" +
                "SET categoryName =?,\n" +
                "`status` =?,\n" +
                "createAt =?,\n" +
                "updateAt =?,\n" +
                "WHERE categoryId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getCategoryName());
            ps.setBoolean(2, entity.isStatus());
            ps.setTimestamp(3, entity.getCreateAt());
            ps.setTimestamp(4, entity.getUpdateAt());
            ps.setString(5, entity.getCategoryId());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int delete(Category entity) {
        String query = "DELETE FROM category\n" +
                "WHERE categoryId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getCategoryId());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    public static void main(String[] args) {
        CategoryDAO categoryDAO = new CategoryDAO();
        System.out.println(categoryDAO.getId("Bedroom"));
    }
}
