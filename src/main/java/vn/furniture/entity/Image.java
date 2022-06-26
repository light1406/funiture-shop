package vn.furniture.entity;

public class Image {
    private int imageId;
    private String image;
    private String productId;

    public Image() {
    }

    public Image(int imageId, String image, String productId) {
        this.imageId = imageId;
        this.image = image;
        this.productId = productId;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "Image{" +
                "imageId='" + imageId + '\'' +
                ", image='" + image + '\'' +
                ", productId='" + productId + '\'' +
                '}';
    }
}
