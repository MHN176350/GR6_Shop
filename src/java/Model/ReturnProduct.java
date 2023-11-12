/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author MILAMILO
 */
public class ReturnProduct {

    private int id;
    private int order_id;
    private int user_id;
    private String reason;
    private String detail_reason;
    private String img;

    public ReturnProduct() {
    }

    public ReturnProduct(int id, int order_id, int user_id, String reason, String detail_reason, String img) {
        this.id = id;
        this.order_id = order_id;
        this.user_id = user_id;
        this.reason = reason;
        this.detail_reason = detail_reason;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getDetail_reason() {
        return detail_reason;
    }

    public void setDetail_reason(String detail_reason) {
        this.detail_reason = detail_reason;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "ReturnProduct{" + "id=" + id + ", order_id=" + order_id + ", user_id=" + user_id + ", reason=" + reason + ", detail_reason=" + detail_reason + ", img=" + img + '}';
    }

}
