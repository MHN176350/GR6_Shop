/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Model.Account;

/**
 *
 * @author MILAMILO
 */
public class AccountDAO extends DBContext {

    public Account login(String email, String password) {

        try {
            String query = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, email);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getDouble(9), rs.getString(8), rs.getInt(10), rs.getString(11), rs.getInt(12));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Account checkAccountExist(String email) {

        try {
            String query = "SELECT * FROM users WHERE email=?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getDouble(9), rs.getString(8), rs.getInt(10), rs.getString(11), rs.getInt(12));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void signUp(String fname, String lname, String email, String password, String phone, String address) {
        try {
            String query = "INSERT INTO users(first_name, last_name, email, password, phone, address) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, fname);
            stm.setString(2, lname);
            stm.setString(3, email);
            stm.setString(4, password);
            stm.setString(5, phone);
            stm.setString(6, address);
            stm.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void updateProfile(String email, String newFName, String newLName, String newPhone, String newAddress) {
        try {
            String query = "UPDATE users SET first_name=?, last_name=?, phone=?, address=? WHERE email=?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, newFName);
            stm.setString(2, newLName);
            stm.setString(3, newPhone);
            stm.setString(4, newAddress);
            stm.setString(5, email);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void changePassword(String email, String newPassword) {
        try {
            String query = "UPDATE users SET password=? WHERE email=? ";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, newPassword);
            stm.setString(2, email);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void imgPath(String email, String url) {
        try {
            String query = "UPDATE users SET avatar=? WHERE email=?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, url);
            stm.setString(2, email);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
