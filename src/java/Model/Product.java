/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author ngnqu
 */
public class Product {

    private int id;
    private String img;
    private String name;
    private int category_id;
    private int brand_id;
    private double price;
    private String description;
    private int quantity;
    private Timestamp created_at;
    private Timestamp updated_at;
    private int discount;

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public Product() {
    }

    public Product(int id, String img, String name, int category_id, int brand_id, double price, String description, int quantity, Timestamp created_at, Timestamp updated_at, int discount) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.category_id = category_id;
        this.brand_id = brand_id;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.discount = discount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", img=" + img + ", name=" + name + ", category_id=" + category_id + ", brand_id=" + brand_id + ", price=" + price + ", description=" + description + ", quantity=" + quantity + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }

}
