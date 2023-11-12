/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.Cart;
import Model.Item;
import Model.Product;
import dal.DAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MILAMILO
 */
public class AddToCartControl extends HttpServlet {

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

        try {
            int quantity;
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("USER");
            if (acc == null) {
                response.sendRedirect("login.jsp");
            } else {
                String pid = request.getParameter("pid");
                try {
                    quantity = Integer.parseInt(request.getParameter("pre_quantity"));
                } catch (NumberFormatException e) {
                    quantity = 1;
                }
                OrderDAO odao = new OrderDAO();
                Product a = odao.getProductById(pid);
                if (a.getQuantity() != 0) {
                    if (request.getParameter("quantity") != null) {
                        quantity = Integer.parseInt(request.getParameter("quantity"));
                    }
                    if (session.getAttribute("cart") == null) {
                        Cart cart = new Cart();
                        List<Item> listItem = new ArrayList<Item>();
                        Item item = new Item();
                        item.setQuantity(quantity);
                        item.setProduct(a);
                        item.setPrice(a.getPrice());
                        listItem.add(item);
                        cart.setItem(listItem);
                        session.setAttribute("cart", cart);
                    } else {
                        Cart cart = (Cart) session.getAttribute("cart");
                        List<Item> listItem = cart.getItem();
                        boolean check = false;
                        for (Item item : listItem) {
                            if (item.getProduct().getId() == a.getId()) {
                                item.setQuantity(item.getQuantity() + quantity);
                                check = true;
                            }
                        }
                        if (check == false) {
                            Item item = new Item();
                            item.setQuantity(quantity);
                            item.setProduct(a);
                            item.setPrice(a.getPrice());
                            listItem.add(item);
                        }
                        session.setAttribute("cart", cart);
                    }
                    response.sendRedirect("viewcart.jsp");
                } else {
                    request.setAttribute("message", "SORRY, This product is out of Stock!");
                    request.getRequestDispatcher("blank.jsp").forward(request, response);
                }

            }
        } catch (IOException | NumberFormatException e) {
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
