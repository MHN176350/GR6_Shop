/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author MILAMILO
 */
public class ADBAccount {

    private int id;
    private String username;
    private String password;
    private String email;
    private String created_date;

    public ADBAccount() {
    }

    public ADBAccount(int id, String username, String password, String email, String created_date) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.created_date = created_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreated_date() {
        return created_date;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    @Override
    public String toString() {
        return "ADBAccount{" + "id=" + id + ", username=" + username + ", password=" + password + ", email=" + email + ", created_date=" + created_date + '}';
    }

}
