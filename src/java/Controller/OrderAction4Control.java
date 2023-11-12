/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.ProductDetailOrder;
import dal.AccountDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "OrderAction4Control", urlPatterns = {"/orderaction4"})
public class OrderAction4Control extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderAction4Control</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderAction4Control at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        AccountDAO adao = new AccountDAO();
        Account account = adao.getAccountByID(Integer.valueOf(request.getParameter("userID")));
        odao.updateStatusOrder4(Integer.valueOf(request.getParameter("orderID")));
        odao.confirmCompleted(Integer.valueOf(request.getParameter("orderID")));
        List<ProductDetailOrder> listPDO = odao.getAllProductByOrderID(Integer.valueOf(request.getParameter("orderID")));
        for (ProductDetailOrder PDO : listPDO) {
            odao.updateProductQuantity(PDO.getQuantity(), PDO.getId());
        }
        if (odao.getPaymentMethod(Integer.valueOf(request.getParameter("orderID"))).equals("ElectroPay Balance")) {
            adao.updateBalance3(Integer.valueOf(request.getParameter("userID")), odao.getOrderTotal(Integer.valueOf(request.getParameter("orderID"))));
            adao.addTranscation(account.getId(), odao.getOrderTotal(Integer.valueOf(request.getParameter("orderID"))), account.getBalance(), "Refund from Order ID: # " + Integer.valueOf(request.getParameter("orderID")));
        }
        response.sendRedirect("adborderreport");
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
        odao.updateStatusOrder5(Integer.valueOf(request.getParameter("orderID")));
        odao.confirmRefundFailed(Integer.valueOf(request.getParameter("orderID")));
        response.sendRedirect("adborderreport");
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
