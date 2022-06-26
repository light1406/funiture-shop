package vn.furniture.DAO;

import vn.furniture.db.DBContext;
import vn.furniture.entity.Image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ImageDAO implements IObjectDAO<Image> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<Image> getList(String id) {
        List<Image> list = new ArrayList<>();
        String query = "SELECT * FROM image WHERE productId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Image(
                        rs.getInt("imageId"),
                        rs.getString("image"),
                        rs.getString("productId")));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public int add(Image entity) {
        String query = "INSERT INTO image(image,productId)\n" + "VALUES(?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getImage());
            ps.setString(2, entity.getProductId());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }

    }

    @Override
    public int update(Image entity) {
        String query = "UPDATE image\n" + "SET image =?, productId=?\n" + "WHERE imageId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getImage());
            ps.setString(2, entity.getProductId());
            ps.setInt(3, entity.getImageId());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int delete(Image entity) {
        String query = "DELETE FROM image WHERE imageId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, entity.getImageId());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
