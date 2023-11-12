/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Model.Account;
import Model.AllTransaction;
import Model.Transcation;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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

    public Account getAccountByID(int user_id) {

        try {
            String query = "SELECT * FROM users WHERE user_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getDouble(9), rs.getString(8), rs.getInt(10), rs.getString(11), rs.getInt(12));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public List<AllTransaction> getAllTransaction() {
        List<AllTransaction> allTransactions = new ArrayList<>();
        try {
            String query = "SELECT transcation.* , users.first_name, users.last_name\n"
                    + "FROM transcation\n"
                    + "JOIN users\n"
                    + "ON transcation.user_id = users.user_id\n"
                    + "ORDER BY issue_date DESC";
            PreparedStatement stm = connection.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                allTransactions.add(new AllTransaction(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException e) {
        }
        return allTransactions;
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

    public double getAccountBalance(Account a) {
        double account_balance = 0;
        try {
            String query = "SELECT Balance FROM users WHERE user_id= ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, a.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                account_balance = rs.getDouble(1);
            }
        } catch (SQLException e) {
        }
        return account_balance;
    }

    public void updateBalance(Account a, double total) {
        try {
            String query = "UPDATE users SET Balance = Balance - ? WHERE user_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setDouble(1, total);
            stm.setInt(2, a.getId());
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateBalance2(Account a, double total) {
        try {
            String query = "UPDATE users SET Balance = Balance + ? WHERE user_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setDouble(1, total);
            stm.setInt(2, a.getId());
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateBalance3(int user_id, double total) {
        try {
            String query = "UPDATE users SET Balance = Balance + ? WHERE user_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setDouble(1, total);
            stm.setInt(2, user_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int getPasswordAttempts(String email) {
        int count = 0;
        try {
            String query = "SELECT password_attempts FROM users WHERE email=?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return count;
    }

    public void updatePasswordAttempts(String email) {
        try {
            String query = "UPDATE users SET password_attempts = password_attempts +1 WHERE email =?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, email);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void decreasePasswordAttempts(String email) {
        try {
            String query = "UPDATE users SET password_attempts = password_attempts -2 WHERE email =?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, email);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void resetPasswordAttempts(String email) {
        try {
            String query = "UPDATE users SET password_attempts = 0 WHERE email =?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, email);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void resetUnlockTime(String email) {
        try {
            String query = "UPDATE users SET unlock_time = NULL WHERE email = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, email);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addUnlockTime(String email) {
        try {
            String query = "UPDATE users SET unlock_time= now()+ INTERVAL 1 MINUTE WHERE email = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, email);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Timestamp getUnlockTime(String email) {
        Timestamp stamp = new Timestamp(System.currentTimeMillis());
        try {

            String query = "SELECT unlock_time FROM users WHERE email =?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                stamp = rs.getTimestamp(1);
            }
        } catch (SQLException e) {
        }
        return stamp;
    }

    public int getAccountStatus(String email) {
        int status = 0;
        try {
            String query = "SELECT status FROM users WHERE email=?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                status = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return status;
    }

    public void addTranscation(int user_id, double action, double after_action, String note) {
        try {
            String query = "INSERT INTO transcation(user_id, action, after_action, note) VALUES (?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            stm.setDouble(2, action);
            stm.setDouble(3, after_action);
            stm.setString(4, note);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int countTrasactionByUserID(int user_id) {
        try {
            String query = "SELECT COUNT(*) FROM transcation WHERE user_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Transcation> getTranscation(int user_id, int index) {
        List<Transcation> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM transcation WHERE user_id = ? ORDER BY issue_date DESC LIMIT 5 OFFSET ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            stm.setInt(2, (index - 1) * 5);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Transcation(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDouble(4), rs.getString(5), rs.getString(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public double getTotalCost(int user_id) {
        double cost = 0;
        try {
            String query = "SELECT SUM(total) FROM orders WHERE user_id = ? && status != -1";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                cost = rs.getDouble(1);
            }
        } catch (SQLException e) {
        }
        return cost;
    }

    public List<Transcation> searchTransaction(Account a, String search) {
        List<Transcation> listTr = new ArrayList<>();
        try {
            String query = "SELECT * FROM transcation WHERE user_id= ? AND (id LIKE ? OR issue_date LIKE ? OR note LIKE ? OR action BETWEEN ? AND ?)";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, a.getId());
            stm.setString(2, "%" + search.trim() + "%");
            stm.setString(3, "%" + search.trim() + "%");
            stm.setString(4, "%" + search.trim() + "%");
            try {
                double action_before = Double.parseDouble(search) - 1;
                double action_after = Double.parseDouble(search) + 1;
                stm.setDouble(5, action_before);
                stm.setDouble(6, action_after);
            } catch (NumberFormatException | SQLException e) {
                stm.setDouble(5, 0);
                stm.setDouble(6, 0);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listTr.add(new Transcation(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDouble(4), rs.getString(5), rs.getString(6)));
            }
        } catch (SQLException e) {
        }
        return listTr;
    }

    public List<AllTransaction> searchAllTransaction(String search) {
        List<AllTransaction> listTr = new ArrayList<>();
        try {
            String query = "SELECT transcation.* , users.first_name, users.last_name\n"
                    + "FROM transcation\n"
                    + "JOIN users\n"
                    + "ON transcation.user_id = users.user_id\n"
                    + "WHERE transcation.id = ? OR users.first_name LIKE ? OR users.last_name LIKE ? OR transcation.action BETWEEN ? AND ? OR transcation.issue_date LIKE ? OR transcation.note LIKE ?\n"
                    + "ORDER BY issue_date DESC";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, search);
            stm.setString(2, "%" + search.trim() + "%");
            stm.setString(3, "%" + search.trim() + "%");
            try {
                double action_before = Double.parseDouble(search) - 1;
                double action_after = Double.parseDouble(search) + 1;
                stm.setDouble(4, action_before);
                stm.setDouble(5, action_after);
            } catch (NumberFormatException | SQLException e) {
                stm.setDouble(4, 0);
                stm.setDouble(5, 0);
            }
            stm.setString(6, "%" + search.trim() + "%");
            stm.setString(7, "%" + search.trim() + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listTr.add(new AllTransaction(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException e) {
        }
        return listTr;
    }
}
