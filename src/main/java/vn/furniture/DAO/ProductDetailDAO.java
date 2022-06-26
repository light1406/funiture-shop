package vn.furniture.DAO;

import vn.furniture.db.DBContext;
import vn.furniture.entity.ProductDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDetailDAO implements IObjectDAO<ProductDetail> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public ProductDetail getRow(String pid) {
        String query = "SELECT * FROM productDetail WHERE productId = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new ProductDetail(rs.getString("productId"),
                        rs.getString("width"),
                        rs.getString("height"),
                        rs.getString("depth"),
                        rs.getString("weight"),
                        rs.getString("description"),
                        rs.getString("originId"),
                        rs.getString("materialId")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<ProductDetail> getSlider() {
        List<ProductDetail> list = new ArrayList<ProductDetail>();
        String query = "SELECT * FROM productDetail pd \n" +
                "JOIN product p ON p.productId = pd.productId\n" +
                "ORDER BY dateImport desc\n" +
                "LIMIT 5";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductDetail(rs.getString("productId"),
                        rs.getString("width"),
                        rs.getString("height"),
                        rs.getString("depth"),
                        rs.getString("weight"),
                        rs.getString("description"),
                        rs.getString("originId"),
                        rs.getString("materialId")
                ));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int add(ProductDetail entity) {
        String query = "INSERT INTO productdetail(productId, width,height,depth,weight,description,originId,materialId)\n" +
                "VALUES(?,?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getProductId());
            ps.setString(2, entity.getWidth());
            ps.setString(3, entity.getHeight());
            ps.setString(4, entity.getDepth());
            ps.setString(5, entity.getWeight());
            ps.setString(6, entity.getDescription());
            ps.setString(7, entity.getOrigin());
            ps.setString(8, entity.getMaterial());
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

}
