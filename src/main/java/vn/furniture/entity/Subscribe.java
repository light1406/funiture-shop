package vn.furniture.entity;

import java.sql.Timestamp;

public class Subscribe {
    private int subscribeId;
    private String email;
    private Timestamp createAt;

    public Subscribe(int subscribeId, String email, Timestamp createAt) {
        this.subscribeId = subscribeId;
        this.email = email;
        this.createAt = createAt;
    }

    public Subscribe() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getSubscribeId() {
        return subscribeId;
    }

    public void setSubscribeId(int subscribeId) {
        this.subscribeId = subscribeId;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }
}
