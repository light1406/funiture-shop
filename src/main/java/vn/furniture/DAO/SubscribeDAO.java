package vn.furniture.DAO;

import vn.furniture.db.DBContext;
import vn.furniture.entity.Subscribe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SubscribeDAO implements IObjectDAO<Subscribe> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    @Override
    public List<Subscribe> getList() {
        String query = "SELECT * FROM subscribe";
        List<Subscribe> list = new ArrayList<Subscribe>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subscribe(
                        rs.getInt("subscribeId"),
                        rs.getString("email"),
                        rs.getTimestamp("createAt")));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Subscribe getRow(String email) {
        String query = "SELECT * FROM subscribe\n" + "WHERE email=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Subscribe(
                        rs.getInt("subscribeId"),
                        rs.getString("email"),
                        rs.getTimestamp("createAt"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int add(Subscribe entity) {
        String query = "INSERT INTO subscribe(email) VALUES(?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getEmail());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int delete(Subscribe entity) {
        String query = "DELETE FROM subscribe WHERE email =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getEmail());
            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

}
