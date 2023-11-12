    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.ADBAccount;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author MILAMILO
 */
public class ADBAccountDAO extends DBContext {

    public ADBAccount login(String username, String password) {

        try {
            String query = "SELECT * FROM admin WHERE username = ? AND password = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new ADBAccount(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public boolean checkAccountExist(String username, String email) {

        try {
            String query = "SELECT * FROM admin WHERE username = ? AND email = ? ";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, username);
            stm.setString(2, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {

        }
        return false;
    }

    public void changePassword(String username, String newPassword) {
        try {
            String query = "UPDATE admin SET password = ? WHERE username = ? ";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, newPassword);
            stm.setString(2, username);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int getPasswordAttempts(String username) {
        int count = 0;
        try {
            String query = "SELECT password_attempts FROM admin WHERE username = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return count;
    }

    public void updatePasswordAttempts(String username) {
        try {
            String query = "UPDATE admin SET password_attempts = password_attempts +1 WHERE username =?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, username);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void resetPasswordAttempts(String username) {
        try {
            String query = "UPDATE admin SET password_attempts = 0 WHERE username =?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, username);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    
}
