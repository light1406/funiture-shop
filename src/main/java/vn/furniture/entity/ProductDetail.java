package vn.furniture.entity;

import java.util.Date;

public class ProductDetail {
    private String productId;
    private String width;
    private String height;
    private String depth;
    private String weight;
    private String description;
    private String origin;
    private String material;

    public ProductDetail() {
    }

    public ProductDetail(String productId, String width, String height, String depth, String weight, String description, String origin, String material) {
        this.productId = productId;
        this.width = width;
        this.height = height;
        this.depth = depth;
        this.weight = weight;
        this.description = description;
        this.origin = origin;
        this.material = material;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getDepth() {
        return depth;
    }

    public void setDepth(String depth) {
        this.depth = depth;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    @Override
    public String toString() {
        return "ProductDetail{" +
                "productId='" + productId + '\'' +
                ", width='" + width + '\'' +
                ", height='" + height + '\'' +
                ", depth='" + depth + '\'' +
                ", weight='" + weight + '\'' +
                ", description='" + description + '\'' +
                ", origin='" + origin + '\'' +
                ", material='" + material + '\'' +
                '}';
    }
}
