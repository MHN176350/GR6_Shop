/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.Order;
import dal.AccountDAO;
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
@WebServlet(name = "ViewOrderControl", urlPatterns = {"/vieworder"})
public class ViewOrderControl extends HttpServlet {

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
        AccountDAO adao = new AccountDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("USER");

        int end_page = odao.countOrderByUserID(a.getId()) / 5;
        if (odao.countOrderByUserID(a.getId()) % 5 != 0) {
            end_page++;
        }
        int index;
        if (request.getParameter("index") == null) {
            index = 1;
        } else {
            index = Integer.valueOf(request.getParameter("index"));
        }
        List<Order> listO = odao.getOrder(a.getId(), index);
        request.setAttribute("f_check", 1);
        request.setAttribute("total_order", odao.countOrderByUserID(a.getId()));
        request.setAttribute("current", index);
        request.setAttribute("endPage", end_page);
        request.setAttribute("totalCost", adao.getTotalCost(a.getId()));
        request.setAttribute("listO", listO);
        request.getRequestDispatcher("vieworder.jsp").forward(request, response);
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
        String search = request.getParameter("search");
        OrderDAO odao = new OrderDAO();
        AccountDAO adao = new AccountDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("USER");
        List<Order> listO = odao.searchOrder(a.getId(), search);
        request.setAttribute("f_check", -1);
        request.setAttribute("totalCost", adao.getTotalCost(a.getId()));
        request.setAttribute("search", search);
        request.setAttribute("listO", listO);
        request.getRequestDispatcher("vieworder.jsp").forward(request, response);
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
