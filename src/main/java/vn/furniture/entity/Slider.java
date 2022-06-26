package vn.furniture.entity;

import java.util.List;

public class Slider {
    private String productId;
    private String productName;
    private String image;
    private String description;

    public Slider(String productId, String productName, String image, String description) {
        this.productId = productId;
        this.productName = productName;
        this.image = image;
        this.description = description;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
