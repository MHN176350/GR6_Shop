/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.Feedback;
import Model.LaptopDetail;
import Model.Product;
import Model.SmartphoneDetail;
import dal.DAO;
import dal.FeedbackDAO;
import dal.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author ngnqu
 */
public class ProductDetailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String productId = request.getParameter("productid");
        DAO dao = new DAO();
        Product product = dao.getProductById(productId);
        FeedbackDAO fdao = new FeedbackDAO();
        OrderDAO odao = new OrderDAO();
        Account account = (Account) session.getAttribute("USER");
        LaptopDetail laptopDetail = dao.getLaptopDetail(productId);
        SmartphoneDetail smartphoneDetail = dao.getSmartphoneDetail(productId);
        List<String> gateList;
        if (laptopDetail != null && laptopDetail.getGate() != null) {
            gateList = Arrays.asList(laptopDetail.getGate().split("#"));
        } else {
            gateList = new ArrayList<>();
        }
        List<String> feature;
        if (smartphoneDetail != null && smartphoneDetail.getFeature() != null) {
            feature = Arrays.asList(smartphoneDetail.getFeature().split("#"));
            // Tiếp tục xử lý với gateList
        } else {
            // Xử lý trường hợp khi laptopDetail hoặc getGate() là null
            feature = new ArrayList<>(); // Khởi tạo một danh sách rỗng
            // Hoặc có thể hiển thị thông báo lỗi
        }

        List<String> feature_front_cam;
        if (smartphoneDetail != null && smartphoneDetail.getFeature_front_cam() != null) {
            feature_front_cam = Arrays.asList(smartphoneDetail.getFeature_front_cam().split("#"));
            // Tiếp tục xử lý với gateList
        } else {
            // Xử lý trường hợp khi laptopDetail hoặc getGate() là null
            feature_front_cam = new ArrayList<>(); // Khởi tạo một danh sách rỗng
            // Hoặc có thể hiển thị thông báo lỗi
        }

        int cate_id = dao.getCategoryByProductID(productId);
        int index;
        int total_star = fdao.getTotalStarByProductID(Integer.valueOf(productId));
        int total_feedback = fdao.countFeedbackByProductID(Integer.valueOf(productId));

        int end_page = total_feedback / 5;
        if (total_feedback % 5 != 0) {
            end_page++;
        }

        if (request.getParameter("index") == null) {
            index = 1;
        } else {
            index = Integer.valueOf(request.getParameter("index"));
        }
        List<Feedback> fb = fdao.getFeedbackByProductID(Integer.valueOf(productId), index);

        float avg_star;
        if (total_feedback != 0) {
            avg_star = (float) total_star / total_feedback;
        } else {
            avg_star = 0;
        }
        int avg_star_int = Math.round(avg_star);

        List<Integer> list = new ArrayList<>();
        for (int i = 1; i <= 5; i++) {
            list.add(fdao.countFeedbackByStar(Integer.valueOf(productId), i));
        }
        if (account == null) {
            request.setAttribute("check", false);
            request.setAttribute("w_check", false);
        } else {
            request.setAttribute("check", odao.checkUserHasBoughtProductID(account.getId(), Integer.valueOf(productId)));
            request.setAttribute("w_check", odao.checkProductInWishList(Integer.valueOf(productId), account.getId()));
        }
        request.setAttribute("sold", odao.countProductSold(Integer.valueOf(productId)));
        request.setAttribute("ld", laptopDetail);
        request.setAttribute("sd", smartphoneDetail);
        request.setAttribute("gl", gateList);
        request.setAttribute("ff", feature);
        request.setAttribute("ffc", feature_front_cam);
        request.setAttribute("cate_id", cate_id);
        request.setAttribute("f_check", -1);
        request.setAttribute("current", index);
        request.setAttribute("endPage", end_page);
        request.setAttribute("totalfb", total_feedback);
        request.setAttribute("avg_star_int", avg_star_int);
        request.setAttribute("avg_star", avg_star);
        request.setAttribute("list", list);
        request.setAttribute("fb", fb);
        request.setAttribute("product", product);
        request.getRequestDispatcher("productdetail.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
