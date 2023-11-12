/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Account;
import Model.Cart;
import Model.Invoice;
import Model.Item;
import Model.Order;
import Model.OrderAccept;
import Model.OrderTracking;
import Model.OverviewFeedback;
import Model.Product;
import Model.ProductDetailOrder;
import Model.ReturnProduct;
import Model.Wishlist;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MILAMILO
 */
public class OrderDAO extends DBContext {

    public Product getProductById(String productId) {
        Product product = new Product();
        try {
            String query = "SELECT * FROM product WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, productId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                product = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10),
                        rs.getInt(11));
            }
        } catch (SQLException e) {
        }
        return product;
    }

    public void addOrder(Account a, Cart cart, String payment_method) {

        try {
            double total;
            if (a.getJoinYear() - 2022 >= 1) {
                total = cart.getTotalMoney() * 85 / 100 + 25;
            } else {
                total = cart.getTotalMoney() * 95 / 100 + 25;
            }
            String sql = "INSERT INTO orders(user_id, total, payment_method, status) VALUES (?,?,?,4)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getId());
            st.setDouble(2, total);
            st.setString(3, payment_method);
            st.executeUpdate();

            String sql1 = "SELECT order_id FROM orders ORDER BY order_id DESC LIMIT 1";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getItem()) {
                    String sql2 = "INSERT INTO order_detail VALUES(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.executeUpdate();
                }
            }

            String sql3 = "UPDATE product SET quantity = quantity - ? WHERE id = ?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItem()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProductQuantity(int quantity, int product_id) {
        try {
            String query = "UPDATE product SET quantity = quantity + ? WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, quantity);
            stm.setInt(2, product_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addWishlist(Product product, int user_id) {
        try {
            String query = "INSERT INTO wishlist(user_id, product_id, category_id, img, product_name, price, quantity) VALUES(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            stm.setInt(2, product.getId());
            stm.setInt(3, product.getCategory_id());
            stm.setString(4, product.getImg());
            stm.setString(5, product.getName());
            stm.setDouble(6, product.getPrice());
            stm.setInt(7, product.getQuantity());
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<Wishlist> getWishlist(int user_id) {
        List<Wishlist> listW = new ArrayList<>();
        try {
            String query = "SELECT * FROM wishlist WHERE user_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listW.add(new Wishlist(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getDouble(7), rs.getInt(8)));
            }
        } catch (SQLException e) {
        }
        return listW;
    }

    public int countWishlist(int user_id) {
        try {
            String query = "SELECT COUNT(*) FROM wishlist WHERE user_id = ?";
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

    public void deleteWishlist(int w_id) {
        try {
            String query = "DELETE FROM wishlist WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, w_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public boolean checkProductInWishList(int product_id, int user_id) {
        try {
            String query = "SELECT * FROM wishlist WHERE product_id = ? AND user_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, product_id);
            stm.setInt(2, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public int getOrderID(int user_id) {
        int id = 0;
        try {
            String query = "SELECT order_id FROM orders WHERE user_id= ? ORDER BY order_id DESC LIMIT 1";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return id;
    }

    public String getOrderDate(int user_id) {
        String order_date = "";
        try {
            String query = "SELECT order_date FROM orders WHERE user_id= ? ORDER BY order_date DESC LIMIT 1";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                order_date = rs.getString(1);
            }
        } catch (SQLException e) {
        }
        return order_date;
    }

    public ReturnProduct getReturnDetail(int order_id) {
        try {
            String query = "SELECT * FROM return_product WHERE order_id = ? ";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new ReturnProduct(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public int getQuantityProduct(int id) {
        int quantity = 0;
        try {
            String query = "SELECT quantity FROM product where id= ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                quantity = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return quantity;
    }

    public List<Order> getOrder(int user_id, int index) {
        List<Order> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM orders WHERE user_id = ? ORDER BY order_date DESC LIMIT 5 OFFSET ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            stm.setInt(2, (index - 1) * 5);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getOrderStatus(int order_id) {
        int status = 0;
        try {
            String query = "SELECT status FROM orders WHERE order_id= ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                status = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return status;
    }

    public void updateStatusOrder(int order_id) {
        try {
            String query = "UPDATE orders SET status = 1  WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateStatusOrder2(int order_id) {
        try {
            String query = "UPDATE orders SET status = -1  WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateStatusOrder3(int order_id) {
        try {
            String query = "UPDATE orders SET status = 2  WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateStatusOrder0(int order_id) {
        try {
            String query = "UPDATE orders SET status = 0  WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateStatusOrder4(int order_id) {
        try {
            String query = "UPDATE orders SET status = 3  WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateStatusOrder5(int order_id) {
        try {
            String query = "UPDATE orders SET status = 5  WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void insertOrderInfo(Invoice a) {
        try {
            String query = "INSERT INTO order_info VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, a.getOrderID());
            stm.setString(2, a.getBilling_name());
            stm.setString(3, a.getBilling_phone());
            stm.setString(4, a.getBilling_address());
            stm.setString(5, a.getBilling_mail());
            stm.setString(6, a.getCountry());
            stm.setString(7, a.getCity());
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addOrderTracking(int order_id) {
        try {
            String query = "INSERT INTO order_tracking(order_id) VALUES (?)";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int countProductSold(int product_id) {
        try {
            String query = "SELECT COUNT(id)\n"
                    + "FROM (\n"
                    + "  SELECT product.name, product.id, order_detail.quantity, product.price, orders.status\n"
                    + "  FROM order_detail\n"
                    + "  JOIN product ON order_detail.p_id = product.id\n"
                    + "  JOIN orders ON order_detail.order_id = orders.order_id\n"
                    + "  WHERE order_detail.p_id = ? AND orders.status != -1\n"
                    + ") AS subquery;";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, product_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<ProductDetailOrder> getAllProductByOrderID(int order_id) {
        List<ProductDetailOrder> list = new ArrayList<>();
        try {
            String query = "SELECT product.name, product.id, order_detail.quantity, product.price \n"
                    + "FROM order_detail\n"
                    + "JOIN product\n"
                    + "ON order_detail.p_id = product.id\n"
                    + "WHERE order_detail.order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new ProductDetailOrder(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Invoice getOrderInfoByOrderID(int order_id) {
        Invoice invoice = new Invoice();
        try {
            String query = "SELECT order_info.order_id, order_info.billing_name, order_info.billing_phone, order_info.billing_address, order_info.billing_email, order_info.country, order_info.city, orders.order_date, orders.total, orders.status\n"
                    + "FROM order_info\n"
                    + "JOIN orders ON order_info.order_id = orders.order_id\n"
                    + "WHERE order_info.order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                invoice = new Invoice(rs.getInt(1), rs.getString(8), rs.getInt(10), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getDouble(9));
            }
        } catch (SQLException e) {
        }
        return invoice;
    }

    public List<Order> searchOrder(int user_id, String search) {
        List<Order> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM orders WHERE user_id= ? AND (order_id LIKE ? OR order_date LIKE ? OR payment_method LIKE ? OR status = ? OR total BETWEEN ? AND ?)";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            stm.setString(2, "%" + search.trim() + "%");
            stm.setString(3, "%" + search.trim() + "%");
            stm.setString(4, "%" + search.trim() + "%");
            if ("completed".contains(search.toLowerCase().trim())) {
                int status = 1;
                stm.setInt(5, status);
            } else if ("inprogress".contains(search.toLowerCase().trim())) {
                int status = 0;
                stm.setInt(5, status);
            } else if ("canceled".contains(search.toLowerCase().trim())) {
                int status = -1;
                stm.setInt(5, status);
            } else {
                stm.setInt(5, 2);
            }
            try {
                double total_before = Double.parseDouble(search) - 1;
                double total_after = Double.parseDouble(search) + 1;
                stm.setDouble(6, total_before);
                stm.setDouble(7, total_after);
            } catch (NumberFormatException | SQLException e) {
                stm.setDouble(6, 0);
                stm.setDouble(7, 0);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public OrderTracking getOrderTrackingByOrderID(int order_id) {
        OrderTracking orderT = new OrderTracking();
        try {
            String query = "SELECT * FROM order_tracking WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                orderT = new OrderTracking(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (SQLException e) {
        }
        return orderT;
    }

    public void deleteTrackingByID(int tracking_id) {
        try {
            String query = "DELETE FROM order_tracking WHERE tracking_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, tracking_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void confirmOrder(int order_id) {
        try {
            String query = "UPDATE order_tracking SET order_confirm = now() WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void confirmReceived(int order_id) {
        try {
            String query = "UPDATE order_tracking SET received = now() WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void confirmRefundDemand(int order_id) {
        try {
            String query = "UPDATE order_tracking SET refund_demand = now() WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void confirmRefundFailed(int order_id) {
        try {
            String query = "UPDATE order_tracking SET refund_failed = now() WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteRefundDemand(int order_id, int tracking_id) {
        try {
            String query = "UPDATE order_tracking SET refund_demand = NULL WHERE order_id = ? AND tracking_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.setInt(2, tracking_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteReturnProduct(int order_id) {
        try {
            String query = "DELETE FROM return_product WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void confirmCompleted(int order_id) {
        try {
            String query = "UPDATE order_tracking SET completed = now() WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public String getPaymentMethod(int order_id) {
        String method = "";
        try {
            String query = "SELECT payment_method FROM orders WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                method = rs.getString(1);
            }
        } catch (SQLException e) {
        }
        return method;
    }

    public double getOrderTotal(int order_id) {
        double total = 0;
        try {
            String query = "SELECT total FROM orders WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                total = rs.getDouble(1);
            }
        } catch (SQLException e) {
        }
        return total;
    }

    public int countOrderByUserID(int user_id) {
        try {
            String query = " SELECT COUNT(*) FROM orders WHERE user_id = ?";
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

    public List<Integer> getAllProductIDByOrderID(int order_id) {
        List<Integer> productID = new ArrayList<>();
        try {
            String query = "SELECT p_id FROM order_detail WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, order_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                productID.add(rs.getInt(1));
            }
        } catch (SQLException e) {
        }
        return productID;
    }

    public boolean checkUserHasBoughtProductID(int user_id, int product_id) {
        try {
            String query = "SELECT *\n"
                    + "FROM orders \n"
                    + "JOIN order_detail ON orders.order_id = order_detail.order_id\n"
                    + "JOIN order_tracking ON order_tracking.order_id = order_detail.order_id\n"
                    + "WHERE user_id = ? AND p_id = ? AND received IS NOT NULL";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            stm.setInt(2, product_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public List<Integer> getOrderIDToCheckTracking1() {
        List<Integer> orderID = new ArrayList<>();
        try {
            String query = "SELECT order_id FROM order_tracking WHERE received IS NULL\n"
                    + "AND DATE_ADD(ready_for_picked_up, INTERVAL 3 DAY) <= NOW()";
            PreparedStatement stm = connection.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                orderID.add(rs.getInt(1));
            }
        } catch (SQLException e) {
        }
        return orderID;
    }

    public List<Integer> getOrderIDToCheckTracking2(int user_id) {
        List<Integer> orderID = new ArrayList<>();
        try {
            String query = "SELECT order_tracking.order_id\n"
                    + "FROM order_tracking\n"
                    + "JOIN orders ON order_tracking.order_id = orders.order_id\n"
                    + "WHERE order_tracking.refund_failed IS NULL AND order_tracking.completed IS NULL AND DATE_ADD(order_tracking.refund_demand, INTERVAL 3 DAY) <= NOW() AND orders.user_id=?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                orderID.add(rs.getInt(1));
            }
        } catch (SQLException e) {
        }
        return orderID;
    }

    public void doStatusTracking1() {
        if (!getOrderIDToCheckTracking1().isEmpty()) {
            List<Integer> orderID = new ArrayList<>();
            orderID = getOrderIDToCheckTracking1();
            for (Integer id : orderID) {
                updateStatusOrder(id);
                try {
                    String query = "UPDATE order_tracking\n"
                            + "SET received = NOW()\n"
                            + "WHERE order_id = ?";
                    PreparedStatement stm = connection.prepareStatement(query);
                    stm.setInt(1, id);
                    stm.executeUpdate();

                    String query2 = "UPDATE order_tracking\n"
                            + "SET completed = NOW()\n"
                            + "WHERE order_id = ? ";
                    PreparedStatement stm2 = connection.prepareStatement(query2);
                    stm2.setInt(1, id);
                    stm2.executeUpdate();
                } catch (SQLException e) {
                }
            }
        }
    }

    public List<OrderAccept> searchAllOrder(String search) {
        List<OrderAccept> list = new ArrayList<>();
        try {
            String query = "SELECT ord.order_id, oi.billing_name, payment_method, billing_address, order_date, ord.status\n"
                    + "FROM swp1.order_info oi\n"
                    + "RIGHT JOIN (\n"
                    + "    SELECT o.*, ot.order_confirm\n"
                    + "    FROM swp1.orders o\n"
                    + "    LEFT JOIN order_tracking ot ON o.order_id = ot.order_id\n"
                    + ") ord ON ord.order_id = oi.order_id\n"
                    + "WHERE ord.order_id = ? OR oi.billing_name LIKE ? OR payment_method LIKE ? OR billing_address LIKE ? OR order_date LIKE ? OR ord.status = ?\n"
                    + "ORDER BY ord.order_date DESC; \n"
                    + "";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, search);
            stm.setString(2, "%" + search.trim() + "%");
            stm.setString(3, "%" + search.trim() + "%");
            stm.setString(4, "%" + search.trim() + "%");
            stm.setString(5, "%" + search.trim() + "%");
            if ("canceled".contains(search.toLowerCase().trim())) {
                stm.setInt(6, -1);
            } else if ("returnfailed".contains(search.toLowerCase().trim())) {
                stm.setInt(6, 5);
            } else if ("returncompleted".contains(search.toLowerCase().trim())) {
                stm.setInt(6, 3);
            } else if ("inprogress".contains(search.toLowerCase().trim())) {
                stm.setInt(6, 0);
            } else if ("completed".contains(search.toLowerCase().trim())) {
                stm.setInt(6, 1);
            } else if ("pendingcofirmreturn".contains(search.toLowerCase().trim())) {
                stm.setInt(6, 2);
            } else if ("waitingforconfirmed".contains(search.toLowerCase().trim())) {
                stm.setInt(6, 4);
            } else {
                stm.setInt(6, 9);
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new OrderAccept(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Product getDealProduct() {
        try {
            String query = "SELECT * FROM product \n"
                    + "ORDER BY discount DESC\n"
                    + "LIMIT 1";
            PreparedStatement stm = connection.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getTimestamp(9), rs.getTimestamp(10), rs.getInt(11));
            }
        } catch (SQLException e) {
        }
        return null;
    }
}
