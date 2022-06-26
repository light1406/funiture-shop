package vn.furniture.DAO;

import vn.furniture.db.DBContext;
import vn.furniture.entity.Origin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OriginDAO implements IObjectDAO<Origin> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public String getId(String origin){
        String query = "SELECT originId FROM origin WHERE originName =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, origin);
            rs = ps.executeQuery();
            return rs.next() ? rs.getString("originId") : null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Origin> getList() {
        List<Origin> list = new ArrayList<Origin>();
        String query = "SELECT * FROM origin";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Origin(rs.getString("originId"),
                        rs.getString("originName"),
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
    public Origin getRow(String id) {
        String query = "SELECT * FROM origin\n" +
                "WHERE originId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Origin(
                        rs.getString("originId"),
                        rs.getString("originName"),
                        rs.getBoolean("status"),
                        rs.getTimestamp("createAt"),
                        rs.getTimestamp("updateAt")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int add(Origin entity) {
        String query = "INSERT INTO origin(originId, originName,`status`,createAt)\n" +
                "VALUES(?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getOriginId());
            ps.setString(2, entity.getOriginName());
            ps.setBoolean(3, entity.isStatus());
            ps.setTimestamp(4, entity.getCreateAt());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int update(Origin entity) {
        String query = "UPDATE origin\n" +
                "SET originName =?,\n" +
                "`status` =?,\n" +
                "createAt =?,\n" +
                "updateAt =?,\n" +
                "WHERE originId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getOriginName());
            ps.setBoolean(2, entity.isStatus());
            ps.setTimestamp(3, entity.getCreateAt());
            ps.setTimestamp(4, entity.getUpdateAt());
            ps.setString(5, entity.getOriginId());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int delete(Origin entity) {
        String query = "DELETE FROM origin\n" +
                "WHERE originId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getOriginId());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static void main(String[] args) {

    }
}
