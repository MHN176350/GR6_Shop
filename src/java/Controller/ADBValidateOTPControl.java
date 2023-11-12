/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ADBValidateOTP", urlPatterns = {"/adbvalidate"})
public class ADBValidateOTPControl extends HttpServlet {

    private int requestCount = 0;

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
        try {
            String attributeOTP = "otp";
            String oldAttributeOTP = attributeOTP + "_old";
            try {
                String currentOTP = session.getAttribute(attributeOTP).toString();
                if (session.getAttribute(oldAttributeOTP) != null) {
                    String oldOTP = (String) session.getAttribute(oldAttributeOTP);
                    if (currentOTP != null && oldOTP != null && !currentOTP.equals(oldOTP)) {
                        requestCount = 0;
                    }
                }
                session.setAttribute(attributeOTP + "_old", currentOTP);
            } catch (Exception e) {
            }
            String userResponse = request.getParameter("g-recaptcha-response");
            if (userResponse.equals("")) {
                request.setAttribute("message", "You must verify captcha!");
                request.getRequestDispatcher("adbenterotp.jsp").forward(request, response);
            } else if (requestCount == 3) {
                requestCount = 0;
                request.setAttribute("message1", "You tried too many times. Please try again!");
                session.removeAttribute("otp");
                request.getRequestDispatcher("adbenterotp.jsp").forward(request, response);
            } else {
                int value = Integer.parseInt(request.getParameter("otp"));
                try {
                    int otp = (int) session.getAttribute("otp");
                    if (value == otp) {
                        requestCount = 0;
                        session.removeAttribute("otp");
                        response.sendRedirect("adbenternewpassword.jsp");
                    } else {
                        requestCount++;
                        request.setAttribute("message", "OTP is wrong!");
                        request.getRequestDispatcher("adbenterotp.jsp").forward(request, response);
                    }
                } catch (NullPointerException exception) {
                    request.setAttribute("over", "OTP time required is over!");
                    request.getRequestDispatcher("adbenterotp.jsp").forward(request, response);
                }
            }
        } catch (ServletException | IOException | NumberFormatException e) {
            request.setAttribute("message", "Something went wrong. Exit browser and try again!");
            session.removeAttribute("otp");
            request.getRequestDispatcher("adbenterotp.jsp").forward(request, response);
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
