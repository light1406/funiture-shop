package vn.furniture.entity;


import java.sql.Timestamp;

public class Order {
    private int orderId;
    private String payMethod;
    private double vat;
    private double price;
    private String note;
    private boolean status;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private int userId;

    public Order() {
    }

    public Order(int orderId, String payMethod, double vat, double price, String note, boolean status, Timestamp createdAt, Timestamp updatedAt, int userId) {
        this.orderId = orderId;
        this.payMethod = payMethod;
        this.vat = vat;
        this.price = price;
        this.note = note;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.userId = userId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    public double getVat() {
        return vat;
    }

    public void setVat(double vat) {
        this.vat = vat;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }
}
