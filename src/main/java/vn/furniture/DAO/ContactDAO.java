package vn.furniture.DAO;

import vn.furniture.db.DBContext;
import vn.furniture.entity.Contact;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ContactDAO implements IObjectDAO<Contact> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    @Override
    public List<Contact> getList() {
        List<Contact> list = new ArrayList<>();
        String query = "SELECT * FROM contact";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Contact(
                        rs.getInt("contactId"),
                        rs.getString("fullName"),
                        rs.getString("email"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getTimestamp("createAt")
                ));

            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Contact getRow(int id) {
        String query = "SELECT * FROM contact WHERE contactId=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Contact(
                        rs.getInt("contactId"),
                        rs.getString("fullName"),
                        rs.getString("email"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getTimestamp("createAt")
                );

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    @Override
    public int add(Contact entity) {
        String query = "INSERT INTO contact(fullName,email, subject, message, createAt)\n" + "VALUES(?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getFullName());
            ps.setString(2, entity.getEmail());
            ps.setString(3, entity.getSubject());
            ps.setString(4, entity.getMessage());
            ps.setTimestamp(5, entity.getCreatedAt());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int delete(Contact entity) {
        String query = "DELETE FROM contact WHERE contactId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, entity.getContactId());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
