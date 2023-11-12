/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Feedback;
import Model.OverviewFeedback;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MILAMILO
 */
public class FeedbackDAO extends DBContext {

    public void addFeedback(int user_id, int p_id, String name, int star_vote, String comment, String img) {
        try {
            String query = "INSERT INTO feedback(user_id, p_id, name, star, comment, img) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            stm.setInt(2, p_id);
            stm.setString(3, name);
            stm.setInt(4, star_vote);
            stm.setString(5, comment);
            stm.setString(6, img);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteFeedback(int feedback_id) {
        try {
            String query = "DELETE FROM feedback WHERE f_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, feedback_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<Feedback> getFeedbackByProductID(int p_id, int index) {
        List<Feedback> listfb = new ArrayList<>();
        try {
            String query = "SELECT * FROM feedback WHERE p_id = ? ORDER BY issue_date DESC LIMIT 5 OFFSET ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(2, (index - 1) * 5);
            stm.setInt(1, p_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listfb.add(new Feedback(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException e) {
        }
        return listfb;
    }

    public List<Feedback> getFeedbackByStar(int p_id, int star, int index) {
        List<Feedback> listfb = new ArrayList<>();
        try {
            String query = "SELECT * FROM feedback WHERE p_id = ? AND star =? ORDER BY issue_date DESC LIMIT 2 OFFSET ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, p_id);
            stm.setInt(2, star);
            stm.setInt(3, (index - 1) * 2);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listfb.add(new Feedback(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException e) {
        }
        return listfb;
    }

    public void addOverviewFeedback(int user_id, int order_id, String name, int star_vote, String comment, String img) {
        try {
            String query = "INSERT INTO overview_feedback(user_id, order_id, name, star, comment, img) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            stm.setInt(2, order_id);
            stm.setString(3, name);
            stm.setInt(4, star_vote);
            stm.setString(5, comment);
            stm.setString(6, img);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public OverviewFeedback getOverviewFeedback(int user_id, int order_id) {
        try {
            String query = "SELECT * FROM overview_feedback WHERE user_id = ? AND order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            stm.setInt(2, order_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new OverviewFeedback(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void deleteOverviewFeedback(int user_id, int order_id) {
        try {
            String query = "DELETE FROM overview_feedback WHERE user_id = ? AND order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            stm.setInt(2, order_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int getTotalStarByProductID(int product_id) {
        int total = 0;
        try {
            String query = "SELECT SUM(star)FROM feedback WHERE p_id = ? ";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, product_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return total;
    }

    public int countFeedbackByProductID(int product_id) {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) FROM Feedback WHERE p_id = ? ";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, product_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return count;
    }

    public int countFeedbackByStar(int product_id, int star) {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) FROM Feedback WHERE p_id = ? and star = ? ";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, product_id);
            stm.setInt(2, star);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return count;
    }

    public void addSuggestBox(String text) {
        try {
            String query = "INSERT INTO faq(question) VALUES(?)";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, text);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addReturnProduct(int order_id, int user_id, String reason, String detail_reason, String img) {
        try {
            String query = "INSERT INTO return_product(order_id, user_id, reason, detail_reason, img) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.setInt(2, user_id);
            stm.setString(3, reason);
            stm.setString(4, detail_reason);
            stm.setString(5, img);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<OverviewFeedback> getOverviewFeedback() {
        List<OverviewFeedback> feedbacks = new ArrayList<>();
        try {
            String query = "SELECT * FROM overview_feedback ORDER BY issue_date DESC";
            PreparedStatement stm = connection.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                feedbacks.add(new OverviewFeedback(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException e) {
        }
        return feedbacks;
    }

    public List<OverviewFeedback> searchAllOverviewFeedback(String search) {
        List<OverviewFeedback> listFb = new ArrayList<>();
        try {
            String query = "SELECT * FROM overview_feedback\n"
                    + "WHERE f_id = ? OR order_id = ? OR user_id = ? OR name LIKE ? OR issue_date LIKE ? OR star = ? OR comment LIKE ?\n"
                    + "ORDER BY issue_date DESC";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, search);
            stm.setString(2, search);
            stm.setString(3, search);
            stm.setString(4, "%" + search.trim().toLowerCase() + "%");
            stm.setString(5, "%" + search.trim() + "%");
            stm.setString(6, search);
            stm.setString(7, search);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listFb.add(new OverviewFeedback(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException e) {
        }
        return listFb;
    }
}
