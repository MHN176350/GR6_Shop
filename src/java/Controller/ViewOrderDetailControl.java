/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.Feedback;
import Model.Invoice;
import Model.OrderTracking;
import Model.OverviewFeedback;
import Model.ProductDetailOrder;
import dal.FeedbackDAO;
import dal.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author MILAMILO
 */
@WebServlet(name = "ViewOrderDetail", urlPatterns = {"/vieworderdetail"})
public class ViewOrderDetailControl extends HttpServlet {

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

        OrderDAO odao = new OrderDAO();
        FeedbackDAO fback = new FeedbackDAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("USER");
        Invoice invoice = odao.getOrderInfoByOrderID(Integer.valueOf(request.getParameter("orderID")));
        OrderTracking orderT = odao.getOrderTrackingByOrderID(Integer.valueOf(request.getParameter("orderID")));
        OverviewFeedback ofeedback = fback.getOverviewFeedback(account.getId(), Integer.valueOf(request.getParameter("orderID")));
        if (ofeedback == null) {
            request.setAttribute("check", null);
        } else {
            request.setAttribute("check", ofeedback);
        }
        request.setAttribute("invoice", invoice);
        request.setAttribute("orderT", orderT);
        request.getRequestDispatcher("ordertracking.jsp").forward(request, response);
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
        OrderDAO odao = new OrderDAO();
        Invoice invoice = odao.getOrderInfoByOrderID(Integer.valueOf(request.getParameter("orderID")));
        List<ProductDetailOrder> listP = odao.getAllProductByOrderID(Integer.valueOf(request.getParameter("orderID")));
        request.setAttribute("listP", listP);
        request.setAttribute("invoice", invoice);
        request.setAttribute("status", odao.getOrderStatus(Integer.valueOf(request.getParameter("orderID"))));
        request.getRequestDispatcher("vieworderdetail.jsp").forward(request, response);
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
