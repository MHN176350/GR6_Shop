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
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author MILAMILO
 */
@WebServlet(name = "ChangePasswordControl", urlPatterns = {"/changepassword"})
public class ChangePasswordControl extends HttpServlet {

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
            HttpSession session = request.getSession();
            String email = session.getAttribute("EMAIL").toString();
            String old_password = request.getParameter("opassword");
            String password = request.getParameter("npassword");
            String re_password = request.getParameter("nrepassword");
            AccountDAO account_dao = new AccountDAO();
            Account account = (Account)session.getAttribute("USER");
            String passError;
            if (account_dao.getPasswordAttempts(email) == 5) {
                account_dao.addUnlockTime(email);
                session.invalidate();
                request.setAttribute("passAttempts", "You try many times. Your account is temporarily locked in 30 mins!");
                request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            } else {
                if (!password.equals(re_password)) {
                    request.setAttribute("passERROR", "Re-password is not match with New Password!");
                    request.getRequestDispatcher("changepassword.jsp").forward(request, response);
                } else if (!old_password.equals(account.getPassword())) {
                    account_dao.updatePasswordAttempts(email);
                    request.setAttribute("passERROR", "Old password is wrong!");
                    request.getRequestDispatcher("changepassword.jsp").forward(request, response);
                } else if (password.matches(".*\\s.*")) {
                    passError = "Password should not contain spaces.\n";
                    request.setAttribute("passERROR", passError);
                    request.getRequestDispatcher("changepassword.jsp").forward(request, response);
                } else if (password.matches(".*\\s{2,}.*")) {
                    passError = "Password should not contain spaces.\n";
                    request.setAttribute("passERROR", passError);
                    request.getRequestDispatcher("changepassword.jsp").forward(request, response);
                } else if (!password.matches("^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@#$%^&+=!]).{8,}$")) {
                    passError = "Password does not meet complexity requirements. You are missing: \n";
                    if (!password.matches(".*[A-Z].*")) {
                        passError += "  - at least one uppercase letter\n";
                    }
                    if (!password.matches(".*[a-z].*")) {
                        passError += "  - at least one lowercase letter\n";
                    }
                    if (!password.matches(".*\\d.*")) {
                        passError += "  - at least one digit\n";
                    }
                    if (!password.matches(".*[@#$%^&+=!].*")) {
                        passError += "  - at least one special character\n";
                    }
                    if (password.length() < 8) {
                        passError += "  - a minimum length of 8 characters\n";
                    }
                    if (!passError.isEmpty()) {
                        request.setAttribute("passERROR", passError + ".");
                        request.getRequestDispatcher("changepassword.jsp").forward(request, response);
                    }
                } else {
                    account_dao.changePassword(email, re_password);
                    account_dao.resetPasswordAttempts(email);
                    request.setAttribute("SUCCESS", "Update Password Successfully!");
                    request.getRequestDispatcher("changepassword.jsp").forward(request, response);
                }
            }
        } catch (ServletException | IOException e) {
            request.setAttribute("message", "Something went wrong. Exit browser and try again!");
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
