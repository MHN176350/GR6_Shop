/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.ProductDetailOrder;
import Model.ReturnProduct;
import dal.AccountDAO;
import dal.FeedbackDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.List;

/**
 *
 * @author MILAMILO
 */
@MultipartConfig
@WebServlet(name = "OrderAction2Control", urlPatterns = {"/orderaction2"})
public class OrderAction2Control extends HttpServlet {

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
            out.println("<title>Servlet OrderAction2Control</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderAction2Control at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("USER");
        List<ProductDetailOrder> listPDO = odao.getAllProductByOrderID(Integer.valueOf(request.getParameter("orderID")));
        for (ProductDetailOrder PDO : listPDO) {
            odao.updateProductQuantity(PDO.getQuantity(), PDO.getId());
        }
        if ("ElectroPay Balance".equals(odao.getPaymentMethod(Integer.valueOf(request.getParameter("orderID"))))) {
            adao.updateBalance2(account, odao.getOrderTotal(Integer.valueOf(request.getParameter("orderID"))));
            adao.addTranscation(account.getId(), odao.getOrderTotal(Integer.valueOf(request.getParameter("orderID"))), account.getBalance(), "Refund from canceled Order ID: # " + Integer.valueOf(request.getParameter("orderID")));
        }
        odao.updateStatusOrder2(Integer.valueOf(request.getParameter("orderID")));
        odao.deleteTrackingByID(Integer.valueOf(request.getParameter("trackingID")));
        session.setAttribute("USER", adao.login(account.getEmail(), account.getPassword()));
        response.sendRedirect("vieworder");
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

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("USER");
        FeedbackDAO fdao = new FeedbackDAO();
        OrderDAO odao = new OrderDAO();
        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();
        String reason = request.getParameter("reason");
        String detail_reason = request.getParameter("detail_reason");
        int order_id = Integer.valueOf(request.getParameter("orderID"));
        fdao.addReturnProduct(order_id, account.getId(), reason, detail_reason, fileName);
        odao.confirmRefundDemand(order_id);
        odao.updateStatusOrder3(order_id);
        response.sendRedirect("vieworderdetail?orderID=" + order_id);

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
