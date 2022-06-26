package vn.furniture.entity;

import java.sql.Timestamp;
import java.util.Date;

public class Product {

    private String productId;
    private String productName;
    private String linkImage;
    private double price;
    private double salePrice;
    private int quantityStock;
    private int quantityImport;
    private Timestamp dateImport;
    private boolean status;
    private Timestamp createAt;
    private Timestamp updateAt;
    private String categoryId;
    private int quantitySold;

    public Product() {
    }

    public Product(String productName, String linkImage,
                   double price, double salePrice, int quantityStock,
                   int quantityImport, String categoryId){
        String productId = String.valueOf(System.currentTimeMillis());
        this.productId = productId.substring(productId.length() - 6, productId.length());
        this.productName = productName;
        this.linkImage = linkImage;
        this.price = price;
        this.salePrice = salePrice;
        this.quantityStock = quantityStock;
        this.quantityImport = quantityImport;
        this.dateImport = new Timestamp(new Date().getTime());
        this.status = false;
        this.categoryId = categoryId;
        this.createAt = new Timestamp(new Date().getTime());
        this.updateAt = new Timestamp(new Date().getTime());
        this.quantitySold = 0;
    }

    public Product(String productId, String productName, String linkImage, double price, double salePrice, int quantityStock, int quantityImport, Timestamp dateImport, boolean status, Timestamp createAt, Timestamp updateAt, String categoryId) {
        this.productId = productId;
        this.productName = productName;
        this.linkImage = linkImage;
        this.price = price;
        this.salePrice = salePrice;
        this.quantityStock = quantityStock;
        this.quantityImport = quantityImport;
        this.dateImport = dateImport;
        this.status = status;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId='" + productId + '\'' +
                ", productName='" + productName + '\'' +
                ", linkImage='" + linkImage + '\'' +
                ", price=" + price +
                ", salePrice=" + salePrice +
                ", quantityStock=" + quantityStock +
                ", quantityImport=" + quantityImport +
                ", dateImport=" + dateImport +
                ", status=" + status +
                ", createAt=" + createAt +
                ", updateAt=" + updateAt +
                ", categoryId='" + categoryId + '\'' +
                ", quantitySold=" + quantitySold +
                "}";
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getLinkImage() {
        return linkImage;
    }

    public void setLinkImage(String linkImage) {
        this.linkImage = linkImage;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public int getQuantityStock() {
        return quantityStock;
    }

    public void setQuantityStock(int quantityStock) {
        this.quantityStock = quantityStock;
    }

    public int getQuantityImport() {
        return quantityImport;
    }

    public void setQuantityImport(int quantityImport) {
        this.quantityImport = quantityImport;
    }

    public Timestamp getDateImport() {
        return dateImport;
    }

    public void setDateImport(Timestamp dateImport) {
        this.dateImport = dateImport;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public Timestamp getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Timestamp updateAt) {
        this.updateAt = updateAt;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        if (quantitySold <= this.quantityStock && quantitySold > 0)
            this.quantitySold = quantitySold;
    }

    public void quantityUp() {
        this.quantitySold++;
    }

    public void quantityUp(int quantity) {
        setQuantitySold(this.getQuantitySold() + quantity);
    }

    public double total() {
        return this.getSalePrice() * this.getQuantitySold();
    }
}
