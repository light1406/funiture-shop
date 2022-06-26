package vn.furniture.DAO;

import vn.furniture.db.DBContext;
import vn.furniture.entity.Cart;
import vn.furniture.entity.OrderDetail;
import vn.furniture.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int addDetail(int orderId, Cart cart) {
        String query = "INSERT INTO orderdetail(orderId, productId, quantity, price)\n" +
                "VALUES(?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            conn.setAutoCommit(false);
            for (Product p : cart.getData()) {
                ps.setInt(1, orderId);
                ps.setString(2, p.getProductId());
                ps.setInt(3, p.getQuantitySold());
                ps.setDouble(4, p.total());
                ps.addBatch();
            }

            int[] updateCounts = ps.executeBatch();
            conn.commit();
            conn.setAutoCommit(true);
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public List<OrderDetail> getList(int orderId) {
        List<OrderDetail> list = new ArrayList<OrderDetail>();
        String query = "SELECT * FROM orderdetail\n" +
                "WHERE orderId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(
                        rs.getInt("orderId"),
                        rs.getString("productId"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")
                ));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

}
