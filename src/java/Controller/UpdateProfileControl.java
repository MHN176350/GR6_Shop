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
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author MILAMILO
 */
@WebServlet(name = "UpdateProfileControl", urlPatterns = {"/updateprofile"})
public class UpdateProfileControl extends HttpServlet {

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
            String pass = session.getAttribute("PASS").toString();

            String first_name = request.getParameter("nfname");
            String last_name = request.getParameter("nlname");
            String phone = request.getParameter("nphone");
            String address = request.getParameter("naddress");

            if (!phone.matches("^\\d{10,}$")) {
                request.setAttribute("status", "Phone number must have at least 10 digits!");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else {
                AccountDAO account_dao = new AccountDAO();
                account_dao.updateProfile(email, first_name, last_name, phone, address);
                request.setAttribute("status", "Update Successfully !");
                session.setAttribute("USER", account_dao.login(email, pass));
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            request.setAttribute("status", "Something went wrong. Exit browser and try again!");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
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
