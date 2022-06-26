package vn.furniture.DAO;

import vn.furniture.db.DBContext;
import vn.furniture.entity.Product;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class ProductDAO implements IObjectDAO<Product> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    @Override
    public List<Product> getList() {
        List<Product> list = new ArrayList<Product>();
        String query = "SELECT * FROM product";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("productId"),
                        rs.getString("productName"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getDouble("salePrice"),
                        rs.getInt("quantityStock"),
                        rs.getInt("quantityImport"),
                        rs.getTimestamp("dateImport"),
                        rs.getBoolean("status"),
                        rs.getTimestamp("createAt"),
                        rs.getTimestamp("updateAt"),
                        rs.getString("categoryId")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Product getRow(String pid) {
        String query = "SELECT * FROM product WHERE productId = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getString("productId"),
                        rs.getString("productName"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getDouble("salePrice"),
                        rs.getInt("quantityStock"),
                        rs.getInt("quantityImport"),
                        rs.getTimestamp("dateImport"),
                        rs.getBoolean("status"),
                        rs.getTimestamp("createAt"),
                        rs.getTimestamp("updateAt"),
                        rs.getString("categoryId"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int add(Product entity) {
        String query = "INSERT INTO product(productId,productName,image,price,salePrice,quantityStock,quantityImport,dateImport,createAt,categoryId,`status`)" +
                "VALUES( ?, ?, ?, ? , ? , ? , ?, ?, ?, ?, ?)";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getProductId());
            ps.setString(2, entity.getProductName());
            ps.setString(3, entity.getLinkImage());
            ps.setDouble(4, entity.getPrice());
            ps.setDouble(5, entity.getSalePrice());
            ps.setInt(6, entity.getQuantityStock());
            ps.setInt(7, entity.getQuantityImport());
            ps.setTimestamp(8, entity.getCreateAt());
            ps.setTimestamp(9, entity.getUpdateAt());
            ps.setString(10, entity.getCategoryId());
            ps.setBoolean(11, entity.isStatus());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int update(Product entity) {
        String query = "UPDATE product\n" +
                "SET productName=?, image=?, price=? , salePrice=? , quantityStock=? , quantityImport=?, dateImport=?,createAt=?, updateAt=?, categoryId=?, `status`=?\n" +
                "WHERE productId=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getProductName());
            ps.setString(2, entity.getLinkImage());
            ps.setDouble(3, entity.getPrice());
            ps.setDouble(4, entity.getSalePrice());
            ps.setInt(5, entity.getQuantityStock());
            ps.setInt(6, entity.getQuantityImport());
            ps.setTimestamp(7, new Timestamp(entity.getDateImport().getTime()));
            ps.setTimestamp(8, new Timestamp(entity.getCreateAt().getTime()));
            ps.setTimestamp(9, new Timestamp(new Date().getTime()));
            ps.setString(10, entity.getCategoryId());
            ps.setBoolean(11, entity.isStatus());
            ps.setString(12, entity.getProductId());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;

    }

    @Override
    public int delete(Product entity) {
        String query = "DELETE FROM product WHERE productId=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getProductId());
            int i = ps.executeUpdate();
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public List<Product> getList(int index, int limit) {
        List<Product> list = new ArrayList<Product>();
        String query = "SELECT * FROM product\n" + "LIMIT ?,?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * limit);
            ps.setInt(2, limit);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("productId"),
                        rs.getString("productName"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getDouble("salePrice"),
                        rs.getInt("quantityStock"),
                        rs.getInt("quantityImport"),
                        rs.getTimestamp("dateImport"),
                        rs.getBoolean("status"),
                        rs.getTimestamp("createAt"),
                        rs.getTimestamp("updateAt"),
                        rs.getString("categoryId")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getAmount() {
        String query = "SELECT COUNT(*) FROM product";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Product> getListWithCategoryId(String categoryId, int index, int limit) {
        List<Product> list = new ArrayList<Product>();
        String query = "SELECT * FROM product \n" + "WHERE categoryId = ?\n" + "LIMIT ?,?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, categoryId);
            ps.setInt(2, (index - 1) * limit);
            ps.setInt(3, limit);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("productId"),
                        rs.getString("productName"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getDouble("salePrice"),
                        rs.getInt("quantityStock"),
                        rs.getInt("quantityImport"),
                        rs.getTimestamp("dateImport"),
                        rs.getBoolean("status"),
                        rs.getTimestamp("createAt"),
                        rs.getTimestamp("updateAt"),
                        rs.getString("categoryId")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getAmountWithCategoryId(String categoryId) {
        String query = "SELECT COUNT(*) FROM product\n" + "WHERE categoryId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, categoryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Product> getListWithOriginId(String originId, int index, int limit) {
        List<Product> list = new ArrayList<Product>();
        String query = "SELECT * FROM product p\n" + "JOIN productdetail pd\n" + "ON p.productId = pd.productId\n" + "WHERE pd.originId = ?\n" + "LIMIT ?,?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, originId);
            ps.setInt(2, (index - 1) * limit);
            ps.setInt(3, limit);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("productId"),
                        rs.getString("productName"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getDouble("salePrice"),
                        rs.getInt("quantityStock"),
                        rs.getInt("quantityImport"),
                        rs.getTimestamp("dateImport"),
                        rs.getBoolean("status"),
                        rs.getTimestamp("createAt"),
                        rs.getTimestamp("updateAt"),
                        rs.getString("categoryId")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getAmountOriginId(String originId) {
        String query = "SELECT COUNT(*) FROM product p\n" + "JOIN productdetail pd ON pd.productId = p.productId\n" + "WHERE originId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, originId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Product> getListWithMaterialId(String materialId, int index, int limit) {
        List<Product> list = new ArrayList<Product>();
        String query = "SELECT * FROM product p\n" + "JOIN productdetail pd\n" + "ON p.productId = pd.productId\n" + "WHERE pd.materialId = ?\n" + "LIMIT ?,?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, materialId);
            ps.setInt(2, (index - 1) * limit);
            ps.setInt(3, limit);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("productId"),
                        rs.getString("productName"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getDouble("salePrice"),
                        rs.getInt("quantityStock"),
                        rs.getInt("quantityImport"),
                        rs.getTimestamp("dateImport"),
                        rs.getBoolean("status"),
                        rs.getTimestamp("createAt"),
                        rs.getTimestamp("updateAt"),
                        rs.getString("categoryId")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getAmountMaterialId(String materialId) {
        String query = "SELECT COUNT(*) FROM product p\n" + "JOIN productdetail pd ON pd.productId = p.productId\n" + "WHERE materialId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, materialId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Product> getListByName(String name, int index, int limit) {
        List<Product> list = new ArrayList<Product>();
        String query = "SELECT * FROM product\n" + "WHERE productName LIKE ? " + "LIMIT ?,?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            ps.setInt(2, (index - 1) * limit);
            ps.setInt(3, limit);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(rs.getString("productId"),
                        rs.getString("productName"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getDouble("salePrice"),
                        rs.getInt("quantityStock"),
                        rs.getInt("quantityImport"),
                        rs.getTimestamp("dateImport"),
                        rs.getBoolean("status"),
                        rs.getTimestamp("createAt"),
                        rs.getTimestamp("updateAt"),
                        rs.getString("categoryId")));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return list;
    }

    public int getAmountWithName(String name) {
        String query = "SELECT COUNT(*) FROM product\n" + "WHERE productName LIKE ? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return 0;
    }

    public List<Product> getSlider() {
        List<Product> list = new ArrayList<Product>();
        String query = "SELECT * FROM product\n" + "ORDER BY dateImport DESC\n" + "LIMIT 5";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("productId"), rs.getString("productName"), rs.getString("image"), rs.getDouble("price"), rs.getDouble("salePrice"), rs.getInt("quantityStock"), rs.getInt("quantityImport"), rs.getTimestamp("dateImport"), rs.getBoolean("status"), rs.getTimestamp("createAt"), rs.getTimestamp("updateAt"), rs.getString("categoryId")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getSeller() {
        List<Product> list = new ArrayList<Product>();
        String query = "SELECT  * from product p\n" + "ORDER BY (quantityImport - quantityStock) desc \n" + "LIMIT 10";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("productId"), rs.getString("productName"), rs.getString("image"), rs.getDouble("price"), rs.getDouble("salePrice"), rs.getInt("quantityStock"), rs.getInt("quantityImport"), rs.getTimestamp("dateImport"), rs.getBoolean("status"), rs.getTimestamp("createAt"), rs.getTimestamp("updateAt"), rs.getString("categoryId")));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public Product getFeatured(String categoryId) {
        String query = "SELECT * FROM product\n" + "WHERE categoryId= ?\n" + "ORDER BY (quantityImport - quantityStock) DESC\n" + "LIMIT 1";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, categoryId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(rs.getString("productId"), rs.getString("productName"), rs.getString("image"), rs.getDouble("price"), rs.getDouble("salePrice"), rs.getInt("quantityStock"), rs.getInt("quantityImport"), rs.getTimestamp("dateImport"), rs.getBoolean("status"), rs.getTimestamp("createAt"), rs.getTimestamp("updateAt"), rs.getString("categoryId"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();

    }
}
