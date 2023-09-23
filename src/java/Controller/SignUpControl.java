/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import dal.AccountDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author MILAMILO
 */
@WebServlet(name = "SignUpControl", urlPatterns = {"/signup"})
public class SignUpControl extends HttpServlet {

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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String re_password = request.getParameter("repassword");
        String first_name = request.getParameter("fname");
        String last_name = request.getParameter("lname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String phonePattern = "\\d{10,15}";

        if (!re_password.equals(password)) {
            request.setAttribute("passERROR", "Re-password does not match with Password!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else if (password.length() <= 6) {
            request.setAttribute("passERROR", "Password need more 6 characters!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else if (!phone.matches(phonePattern)) {
            request.setAttribute("phoneERROR", "Phone number must have at least 10 digits!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            AccountDAO account_dao = new AccountDAO();
            Account a = account_dao.checkAccountExist(email);
            if (a == null) {
                account_dao.signUp(first_name, last_name, email, password, phone, address);
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("existERROR", "Email is exist!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
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
