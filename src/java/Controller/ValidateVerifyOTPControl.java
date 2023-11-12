/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.SignUp;
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
@WebServlet(name = "ValidateVerifyOTPControl", urlPatterns = {"/validateverify"})
public class ValidateVerifyOTPControl extends HttpServlet {

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
            int value = Integer.parseInt(request.getParameter("otp"));
            String userResponse = request.getParameter("g-recaptcha-response");

            try {
                HttpSession session = request.getSession();
                if (userResponse.equals("")) {
                    request.setAttribute("otpERROR", "You must verify captcha!");
                    request.getRequestDispatcher("enterotpemail.jsp").forward(request, response);
                } else if (value == Integer.valueOf(session.getAttribute("otp").toString())) {
                    SignUp signup = (SignUp) session.getAttribute("signup");
                    AccountDAO account_dao = new AccountDAO();
                    account_dao.signUp(signup.getFirst_name(), signup.getLast_name(), signup.getEmail(), signup.getPassword(), signup.getPhone(), signup.getAddress());
                    request.setAttribute("SUCCESS", "Registration Successfully!");
                    request.getRequestDispatcher("enterotpemail.jsp").forward(request, response);
                    session.removeAttribute("signup");
                } else {
                    request.setAttribute("otpERROR", "OTP is wrong!");
                    request.getRequestDispatcher("enterotpemail.jsp").forward(request, response);
                }
            } catch (Exception e) {
                request.setAttribute("otpERROR", "OTP time required is over! Please try again.");
                request.getRequestDispatcher("enterotpemail.jsp").forward(request, response);
            }
        } catch (ServletException | IOException | NumberFormatException e) {
            request.setAttribute("otpERROR", "Something went wrong. Exit browser and try again!");
            request.getRequestDispatcher("enterotpemail.jsp").forward(request, response);
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
