/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author MILAMILO
 */
public class Wishlist {

    private int id;
    private int user_id;
    private int product_id;
    private int category_id;
    private String img;
    private String product_name;
    private Double price;
    private int quantity;

    public Wishlist() {
    }

    public Wishlist(int id, int user_id, int product_id, int category_id, String img, String product_name, Double price, int quantity) {
        this.id = id;
        this.user_id = user_id;
        this.product_id = product_id;
        this.category_id = category_id;
        this.img = img;
        this.product_name = product_name;
        this.price = price;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Wishlist{" + "id=" + id + ", user_id=" + user_id + ", product_id=" + product_id + ", category_id=" + category_id + ", img=" + img + ", product_name=" + product_name + ", price=" + price + ", quantity=" + quantity + '}';
    }

}
