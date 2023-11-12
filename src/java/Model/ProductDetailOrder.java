/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author MILAMILO
 */
public class ProductDetailOrder {

    private String name;
    private int id;
    private int quantity;
    private double unit_price;

    public ProductDetailOrder() {
    }

    public ProductDetailOrder(String name, int id, int quantity, double unit_price) {
        this.name = name;
        this.id = id;
        this.quantity = quantity;
        this.unit_price = unit_price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(double unit_price) {
        this.unit_price = unit_price;
    }

    @Override
    public String toString() {
        return "ProductDetailOrder{" + "name=" + name + ", id=" + id + ", quantity=" + quantity + ", unit_price=" + unit_price + '}';
    }

}
