/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.Transcation;
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
@WebServlet(name = "FinanceControl", urlPatterns = {"/finance"})
public class FinanceControl extends HttpServlet {

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
        try {
            AccountDAO account_dao = new AccountDAO();
            HttpSession session = request.getSession();
            String email = session.getAttribute("EMAIL").toString();
            String vpassword = request.getParameter("npassword1");
            String password = session.getAttribute("PASS").toString();
            String userResponse = request.getParameter("g-recaptcha-response");
            Account a = (Account) session.getAttribute("USER");

            if (userResponse.equals("")) {
                request.setAttribute("passERROR", "You must verify captcha!");
                request.getRequestDispatcher("enterpasswordfinance.jsp").forward(request, response);
            } else if (account_dao.getPasswordAttempts(email) == 5) {
                account_dao.addUnlockTime(email);
                session.invalidate();
                request.setAttribute("passAttempts", "You try many times. Your account is temporarily locked in 30 mins!");
                request.getRequestDispatcher("enterpasswordfinance.jsp").forward(request, response);
            } else if (!vpassword.equals(password)) {
                account_dao.updatePasswordAttempts(email);
                request.setAttribute("passERROR", "Wrong Password!");
                request.getRequestDispatcher("enterpasswordfinance.jsp").forward(request, response);
            } else {
                account_dao.resetPasswordAttempts(email);
                session.setAttribute("USER", account_dao.login(email, password));
                AccountDAO dao = new AccountDAO();
                int end_page = account_dao.countTrasactionByUserID(a.getId()) / 5;
                if (account_dao.countTrasactionByUserID(a.getId()) % 5 != 0) {
                    end_page++;
                }
                int index;
                if (request.getParameter("index") == null) {
                    index = 1;
                } else {
                    index = Integer.valueOf(request.getParameter("index"));
                }
                List<Transcation> listTr = dao.getTranscation(a.getId(), index);
                request.setAttribute("f_check", 1);
                request.setAttribute("total_tr", account_dao.countTrasactionByUserID(a.getId()));
                request.setAttribute("current", index);
                request.setAttribute("endPage", end_page);
                request.setAttribute("listTr", listTr);
                request.getRequestDispatcher("finance.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            request.setAttribute("passERROR", "Something went wrong. Exit browser and try again!");
            request.getRequestDispatcher("enterpasswordfinance.jsp").forward(request, response);
        }
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
        AccountDAO adao = new AccountDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("USER");
        List<Transcation> listTr = adao.searchTransaction(a, search);
        request.setAttribute("f_check", -1);
        request.setAttribute("search", search);
        request.setAttribute("listTr", listTr);
        request.getRequestDispatcher("finance.jsp").forward(request, response);
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
