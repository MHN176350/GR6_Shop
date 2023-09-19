/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Minh
 */
public class User {
    public int uid;
    public String fname;
    public String lname;
    public String email;
    public String pass;
    public String phone;
    public String address;
    public String date;
    public double bal;

    public User() {
    }

    public User(int uid, String fname, String lname, String email, String pass, String phone, String address, String date, double bal) {
        this.uid = uid;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.pass = pass;
        this.phone = phone;
        this.address = address;
        this.date = date;
        this.bal = bal;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getBal() {
        return bal;
    }

    public void setBal(double bal) {
        this.bal = bal;
    }

    @Override
    public String toString() {
        return "User{" + "uid=" + uid + ", fname=" + fname + ", lname=" + lname + ", email=" + email + ", pass=" + pass + ", phone=" + phone + ", address=" + address + ", date=" + date + ", bal=" + bal + '}';
    }
}