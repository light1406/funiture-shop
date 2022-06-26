package vn.furniture.DAO;

import vn.furniture.db.DBContext;
import vn.furniture.entity.Cart;
import vn.furniture.entity.Order;
import vn.furniture.entity.OrderDetail;
import vn.furniture.entity.Product;

import java.sql.*;
import java.util.ArrayList;

import java.util.Date;
import java.util.List;

public class OrderDAO implements IObjectDAO<Order> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    @Override
    public List<Order> getList() {
        List<Order> list = new ArrayList<>();
        String query = "SELECT * FROM `order`";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(
                        rs.getInt("orderId"),
                        rs.getString("payMethod"),
                        rs.getDouble("vat"),
                        rs.getDouble("price"),
                        rs.getString("note"),
                        rs.getBoolean("status"),
                        rs.getTimestamp("createAt"),
                        rs.getTimestamp("updateAt"),
                        rs.getInt("userId")
                ));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Order getRow(int oid) {
        String query = "SELECT * FROM `order` WHERE orderId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, oid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Order(
                        rs.getInt("orderId"),
                        rs.getString("payMethod"),
                        rs.getDouble("vat"),
                        rs.getDouble("price"),
                        rs.getString("note"),
                        rs.getBoolean("status"),
                        rs.getTimestamp("createAt"),
                        rs.getTimestamp("updateAt"),
                        rs.getInt("userId"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int add(Order entity) {
        String query = "INSERT INTO `order`(payMethod, vat, price,note,`status`,userId)\n" + "VALUES(?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, entity.getPayMethod());
            ps.setDouble(2, entity.getVat());
            ps.setDouble(3, entity.getPrice());
            ps.setString(4, entity.getNote());
            ps.setBoolean(5, entity.isStatus());
            ps.setInt(6, entity.getUserId());
            ps.executeUpdate();

            rs = ps.getGeneratedKeys();
            int key = rs.next() ? rs.getInt(1) : 0;
            return key;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int update(Order entity) {
        String query = "UPDATE `order`\n" +
                "SET payMethod = ?,\n" +
                "vat =?,\n" +
                "price=?,\n" +
                "note=?,\n" +
                "`status`=?,\n" +
                "createAt=?,\n" +
                "updateAt=?\n" +
                "userId=?\n" +
                "WHERE orderId =?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getPayMethod());
            ps.setDouble(2, entity.getVat());
            ps.setDouble(3, entity.getPrice());
            ps.setString(4, entity.getNote());
            ps.setBoolean(5, entity.isStatus());
            ps.setTimestamp(6, entity.getCreatedAt());
            ps.setTimestamp(7, new Timestamp(new Date().getTime()));
            ps.setInt(8, entity.getUserId());
            ps.setInt(9, entity.getOrderId());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int delete(Order entity) {
        String query = "DELETE FROM `order`\n" +
                "WHERE orderId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, entity.getOrderId());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }


}
