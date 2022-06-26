package vn.furniture.entity;


import java.sql.Timestamp;
import java.util.Date;

public class Category {
    private String categoryId;
    private String categoryName;
    private boolean status;
    private Timestamp createAt;
    private Timestamp updateAt;

    public Category() {
    }

    public Category(String categoryName){
        String categoryId = String.valueOf(System.currentTimeMillis());
        this.categoryId = categoryId.substring(categoryId.length() - 6, categoryId.length());
        this.categoryName = categoryName;
        this.status = true;
        this.createAt = new Timestamp(new Date().getTime());
        this.updateAt = new Timestamp(new Date().getTime());
    }

    public Category(String categoryId, String categoryName, boolean status, Timestamp createAt, Timestamp updateAt) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.status = status;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
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

    @Override
    public String toString() {
        return "Category{" +
                "categoryId='" + categoryId + '\'' +
                ", categoryName='" + categoryName + '\'' +
                ", status='" + status + '\'' +
                ", createAt=" + createAt +
                ", updateAt=" + updateAt +
                '}';
    }
}
