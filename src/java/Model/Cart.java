/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.List;

/**
 *
 * @author MILAMILO
 */
public class Cart {

    private int id;
    private Account customer;
    private List<Item> item;
    private int status;

    public Cart() {
    }

    public Cart(int id, Account customer, List<Item> item, int status) {
        this.id = id;
        this.customer = customer;
        this.item = item;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getCustomer() {
        return customer;
    }

    public void setCustomer(Account customer) {
        this.customer = customer;
    }

    public List<Item> getItem() {
        return item;
    }

    public void setItem(List<Item> item) {
        this.item = item;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Item getItemById(int id) {
        for (Item i : item) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            item.remove(getItemById(id));
        }
    }

    public void updateQuantity(int itemId, int newQuantity) {
        Item itemToUpdate = getItemById(itemId);
        if (itemToUpdate != null) {
            itemToUpdate.setQuantity(newQuantity);
        }
    }

    public double getTotalMoney() {
        double t = 0;
        for (Item i : item) {
            t += (i.getQuantity() * i.getPrice());
        }
        return t;
    }

}
