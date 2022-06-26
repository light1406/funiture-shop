package vn.furniture.DAO;

import vn.furniture.db.DBContext;
import vn.furniture.entity.Material;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MaterialDAO implements IObjectDAO<Material> {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public String getId(String materialName){
        String query = "SELECT materialId FROM material WHERE materialName =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, materialName);
            rs = ps.executeQuery();
            return rs.next() ? rs.getString("materialId") : null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Material> getList() {
        List<Material> list = new ArrayList<Material>();
        String query = "SELECT * FROM material";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Material(rs.getString("materialId"),
                        rs.getString("materialName"),
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
    public Material getRow(String id) {
        String query = "SELECT * FROM material\n" +
                "WHERE materialId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Material(
                        rs.getString("materialId"),
                        rs.getString("materialName"),
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
    public int add(Material entity) {
        String query = "INSERT INTO material(materialId, materialName,`status`,createAt)\n" +
                "VALUES(?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getMaterialId());
            ps.setString(2, entity.getMaterialName());
            ps.setBoolean(3, entity.isStatus());
            ps.setTimestamp(4, entity.getCreateAt());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int update(Material entity) {
        String query = "UPDATE material\n" +
                "SET materialName =?,\n" +
                "`status` =?,\n" +
                "createAt =?,\n" +
                "updateAt =?,\n" +
                "WHERE materialId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getMaterialName());
            ps.setBoolean(2, entity.isStatus());
            ps.setTimestamp(3, entity.getCreateAt());
            ps.setTimestamp(4, entity.getUpdateAt());
            ps.setString(5, entity.getMaterialId());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int delete(Material entity) {
        String query = "DELETE FROM material\n" +
                "WHERE materialId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getMaterialId());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static void main(String[] args) {

    }
}
