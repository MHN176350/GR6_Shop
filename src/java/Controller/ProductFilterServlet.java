/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.Brand;
import Model.Category;
import Model.Product;
import Model.ProductWithStar;
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
import java.util.List;

/**
 *
 * @author ngnqu
 */
public class ProductFilterServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        OrderDAO odao = new OrderDAO();
        Account account = (Account) session.getAttribute("USER");
        FeedbackDAO fdao = new FeedbackDAO();
        String selectedCategories = request.getParameter("category_id");
        String minPrice = request.getParameter("minprice");
        String maxPrice = request.getParameter("maxprice");
        String brand = request.getParameter("brand");
        String sort = request.getParameter("sort");
        String option1 = request.getParameter("option");
        int option = Integer.parseInt(option1);
        String show = request.getParameter("show");
        if (show == null) {
            show = "1";
        }
        int offset = Integer.parseInt(show);
        String productName = request.getParameter("productName");

        DAO dao = new DAO();
        List<String> listNewLapId = dao.getNewLapProductID();
        List<String> listNewPhoneId = dao.getNewPhoneProductID();
        List<String> listNewCamId = dao.getNewCamProductID();
        int countP = dao.countProductsByFilter(selectedCategories, minPrice, maxPrice, brand, sort, productName);
        int endpage = countP / option;
        if (countP % option != 0) {
            endpage++;
        }
        request.setAttribute("endpage", endpage);
        request.setAttribute("countP", countP);

        List<Category> listC = dao.getAllCategory();
        List<Brand> listB = dao.getAllBrands();
        List<Product> listP = dao.getProductByFilter(selectedCategories, minPrice, maxPrice, brand, sort, option, offset, productName);
        int p = listP.size();

        List<ProductWithStar> withStar = new ArrayList<>();

        for (Product product : listP) {
            int total_star = fdao.getTotalStarByProductID(product.getId());
            int total_feedback = fdao.countFeedbackByProductID(product.getId());
            float avg_star;
            if (total_feedback != 0) {
                avg_star = (float) total_star / total_feedback;
            } else {
                avg_star = 0;
            }
            int avg_star_int = Math.round(avg_star);

            Boolean w_check = false;
            if (account != null) {
                w_check = odao.checkProductInWishList(product.getId(), account.getId());
            }

            ProductWithStar productWithStar = new ProductWithStar(product.getId(), avg_star, avg_star_int, w_check);
            withStar.add(productWithStar);
        }
        List<Product> listHotSelling = dao.getHotSelling();
        request.setAttribute("listHotSelling", listHotSelling);
        request.setAttribute("withstar", withStar);
        request.setAttribute("list", listP);
        request.setAttribute("listC", listC);
        request.setAttribute("listB", listB);
        request.setAttribute("p", p);
        request.setAttribute("listNewCamId", listNewCamId);
        request.setAttribute("listNewPhoneId", listNewPhoneId);
        request.setAttribute("listNewLapId", listNewLapId);
        request.getRequestDispatcher("productlist.jsp").forward(request, response);
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
        processRequest(request, response);
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
