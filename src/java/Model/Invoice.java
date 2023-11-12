/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author MILAMILO
 */
public class Invoice {

    private int orderID;
    private String orderDate;
    private int status;
    private String billing_name;
    private String billing_phone;
    private String billing_address;
    private String billing_mail;
    private String country;
    private String city;
    private double total;

    public Invoice() {
    }

    public Invoice(int orderID, String orderDate, int status, String billing_name, String billing_phone, String billing_address, String billing_mail, String country, String city, double total) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.status = status;
        this.billing_name = billing_name;
        this.billing_phone = billing_phone;
        this.billing_address = billing_address;
        this.billing_mail = billing_mail;
        this.country = country;
        this.city = city;
        this.total = total;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getBilling_name() {
        return billing_name;
    }

    public void setBilling_name(String billing_name) {
        this.billing_name = billing_name;
    }

    public String getBilling_phone() {
        return billing_phone;
    }

    public void setBilling_phone(String billing_phone) {
        this.billing_phone = billing_phone;
    }

    public String getBilling_address() {
        return billing_address;
    }

    public void setBilling_address(String billing_address) {
        this.billing_address = billing_address;
    }

    public String getBilling_mail() {
        return billing_mail;
    }

    public void setBilling_mail(String billing_mail) {
        this.billing_mail = billing_mail;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Invoice{" + "orderID=" + orderID + ", orderDate=" + orderDate + ", status=" + status + ", billing_name=" + billing_name + ", billing_phone=" + billing_phone + ", billing_address=" + billing_address + ", billing_mail=" + billing_mail + ", country=" + country + ", city=" + city + ", total=" + total + '}';
    }

}
