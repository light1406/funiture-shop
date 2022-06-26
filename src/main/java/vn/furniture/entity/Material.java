package vn.furniture.entity;

import java.sql.Timestamp;
import java.util.Date;

public class Material {
    private String materialId;
    private String materialName;
    private boolean status;
    private Timestamp createAt;
    private Timestamp updateAt;

    public Material() {
    }

    public Material(String materialName){
        String materialId = String.valueOf(System.currentTimeMillis());
        this.materialId = materialId.substring(materialId.length() - 6, materialId.length());
        this.materialName = materialName;
        this.status = true;
        this.createAt = new Timestamp(new Date().getTime());
        this.updateAt = new Timestamp(new Date().getTime());
    }


    public Material(String materialId, String materialName, boolean status, Timestamp createAt, Timestamp updateAt) {
        this.materialId = materialId;
        this.materialName = materialName;
        this.status = status;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

    public String getMaterialId() {
        return materialId;
    }

    public void setMaterialId(String materialId) {
        this.materialId = materialId;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
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
        return "Material{" +
                "materialId='" + materialId + '\'' +
                ", materialName='" + materialName + '\'' +
                ", status='" + status + '\'' +
                ", createAt=" + createAt +
                ", updateAt=" + updateAt +
                '}';
    }
}
