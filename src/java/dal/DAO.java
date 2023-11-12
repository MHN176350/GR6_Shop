package dal;

import Model.Blog;
import Model.BlogCategory;
import Model.Brand;
import Model.Category;
import Model.LaptopDetail;
import Model.OrderAccept;
import Model.PieChart;
import Model.Product;
import Model.SmartphoneDetail;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Select * from Product order by p_id OFFSET " + (i - 1) * 8 + " Row Fetch next
 * 8 ROWS ONLY
 *
 * @author Minh
 */
public class DAO extends DBContext {

    public List<User> getAllU(String param) {
        List<User> list = new ArrayList<>();
        int i = Integer.parseInt(param);

        try {

            String com = "Select * from users order by user_id Limit " + (i - 1) * 8 + " ,8";
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDouble(9), rs.getInt(10), rs.getString(11), rs.getInt(12));
                list.add(u);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getPage() {
        try {
            int c = 0;
            String com = "Select count(user_id) from users";
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                c = rs.getInt(1);
            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public User getU(String id) {
        try {
            String com = "Select * from users where user_id=" + id;
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDouble(9), rs.getInt(10), rs.getString(11), rs.getInt(12));
                return u;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getAllProductByCategory(String categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM product p left join swp1.categories c on p.category_id=c.id WHERE c.id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, categoryId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10),
                        rs.getInt(11)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Product getProductById(String productId) {
        Product product = new Product();
        try {
            String query = "SELECT * FROM product WHERE id = ?;";
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

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM swp1.categories;";
        try {
            PreparedStatement stm = connection.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Brand> getAllBrands() {
        List<Brand> list = new ArrayList<>();
        String query = "SELECT * FROM swp1.brands;";
        try {
            PreparedStatement stm = connection.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Brand> list = dao.getAllBrands();
        System.out.println(list);
    }

    public List<Product> getProductByName(String productName) {
        List<Product> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM product WHERE name LIKE ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, "%" + productName + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10),
                        rs.getInt(11)));
            }

            // Đóng ResultSet, PreparedStatement và Connection sau khi sử dụng.
            rs.close();
            stm.close();
            connection.close();

        } catch (SQLException e) {
        }

        return list;
    }

    public List<Product> getProductByFilter(String category_id, String minPrice, String maxPrice, String brand_id) {
        List<Product> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM product WHERE 1=1";
            List<Object> parameters = new ArrayList<>();

            if (category_id != null) {
                query += " AND category_id = ?";
                parameters.add(category_id);
            }
            if (minPrice != null && maxPrice != null) {
                query += " AND price BETWEEN ? AND ?";
                parameters.add(minPrice);
                parameters.add(maxPrice);
            }
            if (brand_id != null) {
                query += " AND brand_id = ?";
                parameters.add(brand_id);
            }

            PreparedStatement stm = connection.prepareStatement(query);
            int parameterIndex = 1;
            for (Object parameter : parameters) {
                stm.setObject(parameterIndex, parameter);
                parameterIndex++;
            }

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10),
                        rs.getInt(11)));
            }

            // Đóng ResultSet, PreparedStatement và Connection sau khi sử dụng.
            rs.close();
            stm.close();
            connection.close();

        } catch (SQLException e) {
        }

        return list;
    }

    public void addB(String title, String cont, int a_id, int cate, String thumb) {
        try {
            String com;
            if (thumb.equals("")) {
                com = "Insert into blog(title, main, author_id, b_cate) values(?,?,?,?)";
                PreparedStatement st = connection.prepareStatement(com);
                st.setString(1, title);
                st.setString(2, cont);
                st.setInt(3, a_id);
                st.setInt(4, cate);
                st.executeUpdate();
            } else {
                com = "Insert into blog(title, main, author_id, b_cate,thumnail) values(?,?,?,?,?)";
                PreparedStatement st = connection.prepareStatement(com);
                st.setString(1, title);
                st.setString(2, cont);
                st.setInt(3, a_id);
                st.setInt(4, cate);
                st.setString(5, thumb);
                st.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<BlogCategory> getAllBC() {
        List<BlogCategory> list = new ArrayList<>();
        try {
            String com = "SELECT * FROM b_cate";
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                BlogCategory b = new BlogCategory(rs.getInt(1), rs.getString(2));
                list.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void user_cont(String id, String stt) {
        try {
            String com = "Update users set status=" + stt + " where user_id=" + id;
            PreparedStatement st = connection.prepareStatement(com);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<User> Search(String param) {
        List<User> list = new ArrayList<>();

        try {

            String com = "SELECT * FROM users where lower(first_name) like '%" + param + "%' or lower(last_name) like  '%" + param + "%' ";
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDouble(9), rs.getInt(10), rs.getString(11), rs.getInt(12));
                list.add(u);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Blog> getBlist(int cate, int od, int idx, String kw) {
        List<Blog> list = new ArrayList<>();
        try {
            String com = "select * from (Select * from blog b left join b_cate c on b.b_cate=c.c_id) x left join users u on u.user_id=x.author_id  where x.status=1";

            if (cate != 0) {
                com += " and x.b_cate=" + cate;
            }
            String order = " order by x.add_date desc";
            if (od != 0) {
                order = " order by title";
            }
            if (kw.length() > 0) {
                com += " and title like \"%" + kw + "%\" or x.add_date like \"%" + kw + "%\" or u.first_name like \"%" + kw + "%\" or u.last_name like\"%" + kw + "%\"";
            }
            com += order + " Limit " + (idx - 1) * 8 + " ,8";
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(10), rs.getString(7), rs.getString(5), rs.getInt(8));
                list.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int cBlog(int cate) {
        int c = -1;
        try {
            String com = "select count(*) from blog b left join b_cate c on b.b_cate=c.c_id where b.status=1 ";
            if (cate != 0) {
                com += "and b_cate=" + cate;
            }
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                c = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public Blog getB(String id) {
        try {
            String com = "select * from blog b left join b_cate c on b.b_cate=c.c_id where blog_id=" + id;
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(10), rs.getString(7), rs.getString(5), rs.getInt(8));
                return b;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Blog> getBbyU() {
        List<Blog> list = new ArrayList<>();
        try {
            String com = "select * from blog b left join b_cate c on b.b_cate=c.c_id";

            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(10), rs.getString(7), rs.getString(5), rs.getInt(8));
                list.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void setB(int id, int stt) {
        try {
            String com = "UPDATE blog SET status =" + stt + " WHERE blog_id=" + id;
            PreparedStatement st = connection.prepareStatement(com);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void up_B(String tit, int cate, String thumb, String cont, int id) {
        try {
            String com = "update blog set title=?, b_cate=?,thumnail=?,main=?, add_date=now() where blog_id=?";
            PreparedStatement st = connection.prepareStatement(com);
            st.setString(1, tit);
            st.setInt(2, cate);
            st.setString(3, thumb);
            st.setString(4, cont);
            st.setInt(5, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int countProductsByFilter(String selectedCategories, String minPrice, String maxPrice, String brand, String sort, String productName) {
        int count = 0;
        try {
            // Tạo truy vấn SQL sử dụng PreparedStatement và thêm điều kiện tìm kiếm theo tên sản phẩm
            StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM swp1.product WHERE 1=1"); // Starting with 1=1 allows for easy condition appending

            if (!"all".equals(selectedCategories)) {
                sql.append(" AND category_id = ?");
            }

            if (!"all".equals(brand)) {
                sql.append(" AND brand_id = ?");
            }

            sql.append(" AND price BETWEEN ? AND ?");

            if (productName != null && !productName.isEmpty()) {
                // Phân tách productName thành các từ khóa riêng biệt
                String[] keywords = productName.split(" ");
                for (String keyword : keywords) {
                    sql.append(" AND name LIKE ?");
                }
            }

            PreparedStatement ps = connection.prepareStatement(sql.toString());
            int parameterIndex = 1;

            if (!"all".equals(selectedCategories)) {
                ps.setString(parameterIndex++, selectedCategories);
            }

            if (!"all".equals(brand)) {
                ps.setString(parameterIndex++, brand);
            }

            ps.setString(parameterIndex++, minPrice);
            ps.setString(parameterIndex++, maxPrice);

            if (productName != null && !productName.isEmpty()) {
                // Phân tách và thêm điều kiện cho từng từ khóa
                String[] keywords = productName.split(" ");
                for (String keyword : keywords) {
                    ps.setString(parameterIndex++, "%" + keyword + "%");
                }
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý các trường hợp lỗi khác ở đây
        }
        return count;
    }

    public List<Product> getProductByFilter(String categoryId, String minPrice, String maxPrice, String brandId, String sort, int limit, int offset, String productName) {
        List<Product> list = new ArrayList<>();
        try {
            // Tạo truy vấn SQL sử dụng PreparedStatement và thêm điều kiện tìm kiếm theo tên sản phẩm
            StringBuilder sql = new StringBuilder("SELECT * FROM swp1.product WHERE 1=1"); // Starting with 1=1 allows for easy condition appending

            if (!"all".equals(categoryId)) {
                sql.append(" AND category_id = ?");
            }

            if (!"all".equals(brandId)) {
                sql.append(" AND brand_id = ?");
            }

            sql.append(" AND price BETWEEN ? AND ?");

            if (productName != null && !productName.isEmpty()) {
                // Phân tách productName thành các từ khóa riêng biệt
                String[] keywords = productName.split(" ");
                for (String keyword : keywords) {
                    sql.append(" AND name LIKE ?");
                }
            }

            sql.append(" ORDER BY price ").append(sort).append(" LIMIT ? OFFSET ?");

            PreparedStatement ps = connection.prepareStatement(sql.toString());
            int parameterIndex = 1;

            if (!"all".equals(categoryId)) {
                ps.setString(parameterIndex++, categoryId);
            }

            if (!"all".equals(brandId)) {
                ps.setString(parameterIndex++, brandId);
            }

            ps.setString(parameterIndex++, minPrice);
            ps.setString(parameterIndex++, maxPrice);

            if (productName != null && !productName.isEmpty()) {
                // Phân tách và thêm điều kiện cho từng từ khóa
                String[] keywords = productName.split(" ");
                for (String keyword : keywords) {
                    ps.setString(parameterIndex++, "%" + keyword + "%");
                }
            }

            ps.setInt(parameterIndex++, limit);
            ps.setInt(parameterIndex, (offset - 1) * limit);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getInt(8), rs.getTimestamp(9), rs.getTimestamp(10), rs.getInt(11)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý các trường hợp lỗi khác ở đây
        }
        return list;
    }

    public LaptopDetail getLaptopDetail(String productId) {
        try {
            String com = "SELECT * FROM swp1.detail_laptop where product_id = " + productId;
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                LaptopDetail laptopDetail = new LaptopDetail(rs.getInt(1), rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16),
                        rs.getString(17),
                        rs.getString(18),
                        rs.getString(19),
                        rs.getString(20),
                        rs.getString(21));
                return laptopDetail;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getCategoryByProductID(String productId) {
        int cate_id = -1;
        String sql = "SELECT * FROM swp1.product where id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                cate_id = resultSet.getInt("category_id");
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ nếu có.
        }
        return cate_id;
    }

    public Double getPie(String id, int type) {
        double data = 0;

        try {

            String com = "";
            if (type == 1) {
                com = "Select sum(total)as total from swp1.product p right join(Select od.p_id, o.order_date ,o.total, o.status from swp1.orders o left join swp1.order_detail od on o.order_id=od.order_id where o.status=1 or o.status=0 or o.status=4 and month(order_date)=month(now()))as ord on ord.p_id=p.id where p.category_id=" + id;
            } else {
                com = "Select sum(total)as total from swp1.product p right join(Select od.p_id, o.order_date ,o.total, o.status from swp1.orders o left join swp1.order_detail od on o.order_id=od.order_id where o.status=1 or o.status=0 or o.status=4 and Year(order_date)=2023) as ord on ord.p_id=p.id where p.category_id=" + id;
            }
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getDouble(1) > -1) {
                    data = rs.getDouble(1);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public List<PieChart> getLine(int cat, int type) {
        List<PieChart> ls = new ArrayList<>();
        LocalDate now = LocalDate.now();
        LocalDate then = now.minusMonths(1);

        String start = then.toString();
        String end = now.toString();
        try {
            String com = "";
            if (type == 1) {
                com = "call SelectDayByDay('" + start + "','" + end + "',+" + cat + ")";
                PreparedStatement st = connection.prepareStatement(com);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    if (Integer.parseInt(rs.getString(1).substring(rs.getString(1).length() - 2, rs.getString(1).length())) % 5 == 0) {
                        PieChart p = new PieChart(rs.getString(1), rs.getDouble(3));
                        if (!ls.isEmpty() && ls.get(ls.size() - 1).data.equals(p.data)) {
                            ls.get(ls.size() - 1).value = p.value;
                        } else {
                            ls.add(p);
                        }
                    }
                }
            } else {
                com = "call SelectYear(2023," + cat + ")";
                PreparedStatement st = connection.prepareStatement(com);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    PieChart p = new PieChart(rs.getString(1), rs.getDouble(3));
                    if (!ls.isEmpty() && ls.get(ls.size() - 1).data.equals(p.data)) {
                        ls.get(ls.size() - 1).value = p.value;
                    } else {
                        ls.add(p);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }

    public List<OrderAccept> getPending() {
        List<OrderAccept> ls = new ArrayList<>();
        try {
            String com = "Select ord.order_id, oi.billing_name, payment_method, billing_address, order_date from swp1.order_info oi right join (Select o.*, ot.order_confirm  from swp1.orders o left join order_tracking ot on o.order_id=ot.order_id where ot.order_confirm is null and o.status !=-1) ord on ord.order_id=oi.order_id";
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderAccept o = new OrderAccept(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
                ls.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }

    public List<OrderAccept> getAllOrders() {
        List<OrderAccept> ls = new ArrayList<>();
        try {
            String com = "SELECT ord.order_id, oi.billing_name, payment_method, billing_address, order_date, ord.status\n"
                    + "FROM swp1.order_info oi\n"
                    + "RIGHT JOIN (\n"
                    + "    SELECT o.*, ot.order_confirm\n"
                    + "    FROM swp1.orders o\n"
                    + "    LEFT JOIN order_tracking ot ON o.order_id = ot.order_id\n"
                    + ") ord ON ord.order_id = oi.order_id\n"
                    + "ORDER BY ord.order_date DESC\n"
                    + "";
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderAccept o = new OrderAccept(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
                ls.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }

    public List<PieChart> getCol() {
        List<PieChart> ls = new ArrayList<>();
        try {
            String com = "SELECT date(p.updated_at) as dat, sum(p.price*p.quantity*0.7) as expense FROM swp1.product p group by date(updated_at)  order by dat;";
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PieChart p = new PieChart(rs.getString(1), rs.getDouble(2));
                ls.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }

    public List<Product> getNewLapProduct() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM product\n"
                    + "where category_id = 1\n"
                    + "ORDER BY created_at DESC\n"
                    + "LIMIT 5;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getInt(8), rs.getTimestamp(9), rs.getTimestamp(10), rs.getInt(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getNewPhoneProduct() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM product\n"
                    + "where category_id = 2\n"
                    + "ORDER BY created_at DESC\n"
                    + "LIMIT 5;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getInt(8), rs.getTimestamp(9), rs.getTimestamp(10), rs.getInt(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getNewCamProduct() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM product\n"
                    + "where category_id = 3\n"
                    + "ORDER BY created_at DESC\n"
                    + "LIMIT 5;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getInt(8), rs.getTimestamp(9), rs.getTimestamp(10), rs.getInt(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<String> getNewLapProductID() {
        List<String> list = new ArrayList<>();
        try {
            String sql = "SELECT id FROM product\n"
                    + "where category_id = 1\n"
                    + "ORDER BY created_at DESC\n"
                    + "LIMIT 5;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<String> getNewPhoneProductID() {
        List<String> list = new ArrayList<>();
        try {
            String sql = "SELECT id FROM product\n"
                    + "where category_id = 2\n"
                    + "ORDER BY created_at DESC\n"
                    + "LIMIT 5;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<String> getNewCamProductID() {
        List<String> list = new ArrayList<>();
        try {
            String sql = "SELECT id FROM product\n"
                    + "where category_id = 3\n"
                    + "ORDER BY created_at DESC\n"
                    + "LIMIT 5;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getDealLapProduct() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM swp1.product\n"
                    + "where category_id = 1\n"
                    + "ORDER BY discount DESC\n"
                    + "LIMIT 5;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getInt(8), rs.getTimestamp(9), rs.getTimestamp(10), rs.getInt(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getDealPhoneProduct() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM swp1.product\n"
                    + "where category_id = 2\n"
                    + "ORDER BY discount DESC\n"
                    + "LIMIT 5;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getInt(8), rs.getTimestamp(9), rs.getTimestamp(10), rs.getInt(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getDealCamProduct() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM swp1.product\n"
                    + "where category_id = 3\n"
                    + "ORDER BY discount DESC\n"
                    + "LIMIT 5;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getInt(8), rs.getTimestamp(9), rs.getTimestamp(10), rs.getInt(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getHotSelling() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT product.*, SUM(order_detail.quantity) AS total_quantity\n"
                    + "FROM order_detail\n"
                    + "JOIN product ON order_detail.p_id = product.id\n"
                    + "JOIN orders ON order_detail.order_id = orders.order_id\n"
                    + "WHERE orders.status != -1\n"
                    + "GROUP BY product.id\n"
                    + "ORDER BY total_quantity DESC\n"
                    + "LIMIT 3;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getInt(8), rs.getTimestamp(9), rs.getTimestamp(10), rs.getInt(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getHotLap() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT product.*, SUM(order_detail.quantity) AS total_quantity\n"
                    + "FROM order_detail\n"
                    + "JOIN product ON order_detail.p_id = product.id\n"
                    + "JOIN orders ON order_detail.order_id = orders.order_id\n"
                    + "WHERE orders.status != -1\n"
                    + "and category_id = 1\n"
                    + "GROUP BY product.id\n"
                    + "ORDER BY total_quantity DESC\n"
                    + "LIMIT 5;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getInt(8), rs.getTimestamp(9), rs.getTimestamp(10), rs.getInt(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getHotPhone() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT product.*, SUM(order_detail.quantity) AS total_quantity\n"
                    + "FROM order_detail\n"
                    + "JOIN product ON order_detail.p_id = product.id\n"
                    + "JOIN orders ON order_detail.order_id = orders.order_id\n"
                    + "WHERE orders.status != -1\n"
                    + "and category_id = 2\n"
                    + "GROUP BY product.id\n"
                    + "ORDER BY total_quantity DESC\n"
                    + "LIMIT 5;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getInt(8), rs.getTimestamp(9), rs.getTimestamp(10), rs.getInt(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getHotCam() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT product.*, SUM(order_detail.quantity) AS total_quantity\n"
                    + "FROM order_detail\n"
                    + "JOIN product ON order_detail.p_id = product.id\n"
                    + "JOIN orders ON order_detail.order_id = orders.order_id\n"
                    + "WHERE orders.status != -1\n"
                    + "and category_id = 3\n"
                    + "GROUP BY product.id\n"
                    + "ORDER BY total_quantity DESC\n"
                    + "LIMIT 5;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getInt(8), rs.getTimestamp(9), rs.getTimestamp(10), rs.getInt(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public SmartphoneDetail getSmartphoneDetail(String productId) {
        try {
            String com = "SELECT * FROM swp1.detail_smartphone where product_id =" + productId;
            PreparedStatement st = connection.prepareStatement(com);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SmartphoneDetail smartphoneDetail = new SmartphoneDetail(rs.getInt(1), rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16),
                        rs.getString(17),
                        rs.getString(18),
                        rs.getString(19),
                        rs.getString(20),
                        rs.getString(21),
                        rs.getString(22),
                        rs.getString(23),
                        rs.getString(24),
                        rs.getString(25),
                        rs.getString(26),
                        rs.getString(27)
                );
                return smartphoneDetail;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public int getNC(int type){
       int client=0;
       try {
            String com="SELECT count(user_id) FROM swp1.users";
            if(type==1){
                com+=" where month(join_date)=11;";
            }else{
                com+=" where year(join_date)=2023;";
            }
            PreparedStatement st=connection.prepareStatement(com);
            ResultSet rs=st.executeQuery();
            while(rs.next()&&rs.getInt(1)>0){
                client=rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return client;
    }
   public int countP(){
         int c=0;
       try {
            String com="SELECT count(*) FROM swp1.product ";
            
            PreparedStatement st=connection.prepareStatement(com);
            ResultSet rs=st.executeQuery();
            while(rs.next()&&rs.getInt(1)>0){
                c=rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
   }
   public int countnNP(int type){
         int c=0;
       try {
            String com="SELECT count(*) FROM swp1.product ";
              if(type==1){
                com+=" where month(created_at)=11;";
            }else{
                com+=" where year(created_at)=2023;";
            }
            PreparedStatement st=connection.prepareStatement(com);
            ResultSet rs=st.executeQuery();
            while(rs.next()&&rs.getInt(1)>0){
                c=rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
   }
   public double Earning(int type){
        double c=0;
       try {
            String com="Select sum(total) from swp1.orders o left join(select od.order_id from swp1.order_detail od left join swp1.product p on p.id=od.p_id where category_id=1)ord on ord.order_id=o.order_id where (o.status=0 or o.status=1 or o.status=4)  ";
              if(type==1){
                com+="and month(order_date)=11;";
            }else{
                com+=" and year(order_date)=2023;";
            }
            PreparedStatement st=connection.prepareStatement(com);
            ResultSet rs=st.executeQuery();
            while(rs.next()&&rs.getInt(1)>0){
                c=rs.getDouble(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
   }
   
   public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM swp1.product";
            PreparedStatement stm = connection.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDouble(6), rs.getString(7), rs.getInt(8), rs.getTimestamp(9), rs.getTimestamp(10), rs.getInt(11)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public boolean addProduct(String img, String name, String cate, String brand, String price, String descrip, String quantity, String discount) {
        boolean success = false;
        try {
            String sql = "INSERT INTO swp1.product (img, name, category_id, brand_id, price, description, quantity, discount) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, img);
            stm.setString(2, name);
            stm.setString(3, cate);
            stm.setString(4, brand);
            stm.setDouble(5, Double.parseDouble(price)); // Assuming price is a numeric value
            stm.setString(6, descrip);
            stm.setInt(7, Integer.parseInt(quantity)); // Assuming quantity is an integer value
            stm.setInt(8, Integer.parseInt(discount));
            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                success = true; // Set to true if the insertion was successful
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
    
    public void deleteProduct(String ids) {
        String[] idArray = ids.split(";");
        for (String id : idArray) {
            try {
                String sql = "DELETE FROM swp1.product WHERE id = ?";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, id);
                stm.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public void update(String productId, String name, String description, String category, String brand, String price, String discount, String quantity) {
        String sql = "UPDATE product SET name=?, description=?, category_id=?, brand_id=?, price=?, discount=?, quantity=? WHERE id=?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, description);
            stm.setString(3, category);
            stm.setString(4, brand);
            stm.setString(5, price);
            stm.setString(6, discount);
            stm.setString(7, quantity);
            stm.setString(8, productId); 
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
