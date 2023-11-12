/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.Account;
import Model.ProductDetailOrder;
import dal.OrderDAO;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MILAMILO
 */
@WebServlet(name = "loginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

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
            String email = request.getParameter("username");
            String password = request.getParameter("password");
            AccountDAO account_dao = new AccountDAO();
            OrderDAO odao = new OrderDAO();
            Account a = account_dao.login(email, password);
            Timestamp stamp = new Timestamp(System.currentTimeMillis());

            if (a == null) {
                try {
                    if (account_dao.getPasswordAttempts(email) == 5 && stamp.after(account_dao.getUnlockTime(email))) {
                        account_dao.decreasePasswordAttempts(email);
                        account_dao.resetUnlockTime(email);
                    }
                } catch (Exception e) {
                }
                if (account_dao.getPasswordAttempts(email) == 5) {
                    request.setAttribute("message", "You try many times. Your account is temporarily locked in 30 mins !");
                    request.setAttribute("mail", email);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    account_dao.updatePasswordAttempts(email);
                    request.setAttribute("message", "Wrong Email or Password !");
                    request.setAttribute("mail", email);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                if (account_dao.getPasswordAttempts(email) == 5 && account_dao.getUnlockTime(email) == null) {
                    account_dao.addUnlockTime(email);
                }
            } else {
                try {
                    if (account_dao.getPasswordAttempts(email) == 5 && stamp.after(account_dao.getUnlockTime(email))) {
                        account_dao.decreasePasswordAttempts(email);
                    }
                } catch (Exception e) {
                }
                if (account_dao.getPasswordAttempts(email) == 5) {
                    request.setAttribute("message", "You try many times. Your account is temporarily locked in 30 mins !");
                    request.setAttribute("mail", email);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else if (account_dao.getAccountStatus(email) == 0) {
                    request.setAttribute("message", "Your account is locked !");
                    request.setAttribute("mail", email);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("count_wl", odao.countWishlist(a.getId()));
                    odao.doStatusTracking1();
                    if (!odao.getOrderIDToCheckTracking2(a.getId()).isEmpty()) {
                        List<Integer> orderID = new ArrayList<>();
                        orderID = odao.getOrderIDToCheckTracking2(a.getId());
                        for (Integer id : orderID) {
                            odao.updateStatusOrder4(id);
                            odao.confirmCompleted(id);
                            List<ProductDetailOrder> listPDO = odao.getAllProductByOrderID(id);
                            for (ProductDetailOrder PDO : listPDO) {
                                odao.updateProductQuantity(PDO.getQuantity(), PDO.getId());
                            }
                            if (odao.getPaymentMethod(id).equals("ElectroPay Balance")) {
                                account_dao.updateBalance3(a.getId(), odao.getOrderTotal(id));
                                account_dao.addTranscation(a.getId(), odao.getOrderTotal(id), a.getBalance(), "Refund from Order ID: # " + id);
                            }
                        }
                    }
                    account_dao.resetPasswordAttempts(email);
                    account_dao.resetUnlockTime(email);
                    session.setAttribute("USER", a);
                    session.setAttribute("EMAIL", email);
                    session.setAttribute("PASS", password);
                    request.getRequestDispatcher("home").forward(request, response);
                }
            }
        } catch (ServletException | IOException e) {
            request.setAttribute("passERROR", "Something went wrong. Exit browser and try again!");
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
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
