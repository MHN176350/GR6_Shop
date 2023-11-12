package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import Model.Account;
import Model.Cart;
import Model.Invoice;
import dal.AccountDAO;
import dal.OrderDAO;
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
@WebServlet(urlPatterns = {"/checkout"})
public class CheckOutControl extends HttpServlet {

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
        HttpSession session = request.getSession();
        session.removeAttribute("cart");
        response.sendRedirect("home");
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
        try {
            String billing_name = request.getParameter("billing-name");
            String billing_mail = request.getParameter("billing-mail");
            String billing_phone = request.getParameter("billing-phone");
            String billing_address = request.getParameter("billing-address");
            String country = request.getParameter("country");
            String city = request.getParameter("city");
            String selectedPaymentMethod = request.getParameter("pay-method");
            double total = Double.valueOf(request.getParameter("total"));
            HttpSession session = request.getSession();
            String email = session.getAttribute("EMAIL").toString();
            String pass = session.getAttribute("PASS").toString();
            OrderDAO odao = new OrderDAO();
            AccountDAO adao = new AccountDAO();
            Account account = (Account) session.getAttribute("USER");

            String payment_method;
            if ("ElectroPay".equals(selectedPaymentMethod)) {
                payment_method = "ElectroPay Balance";
            } else {
                payment_method = "Cash on Delivery";
            }

            if ("ElectroPay".equals(selectedPaymentMethod)) {
                if (account.getBalance() < total) {
                    Invoice invoice = new Invoice(odao.getOrderID(account.getId()), odao.getOrderDate(account.getId()), 4, billing_name, billing_phone, billing_address, billing_mail, country, city, total);
                    session.setAttribute("invoice", invoice);
                    request.setAttribute("message", "ElectroPay balance is not enough !");
                    request.getRequestDispatcher("purchase.jsp").forward(request, response);
                } else {
                    Cart cart = (Cart) session.getAttribute("cart");
                    odao.addOrder(account, cart, payment_method);
                    adao.updateBalance(account, total);
                    adao.addTranscation(account.getId(), total, account.getBalance(), "Paid for Order ID: # " + Integer.toString(odao.getOrderID(account.getId())));
                    Invoice invoice = new Invoice(odao.getOrderID(account.getId()), odao.getOrderDate(account.getId()), 4, billing_name, billing_phone, billing_address, billing_mail, country, city, total);
                    odao.insertOrderInfo(invoice);
                    odao.addOrderTracking(odao.getOrderID(account.getId()));
                    session.setAttribute("invoice", invoice);
                    session.setAttribute("USER", adao.login(email, pass));
                    response.sendRedirect("invoicetoemail");
                }
            } else {
                Cart cart = (Cart) session.getAttribute("cart");
                odao.addOrder(account, cart, payment_method);
                Invoice invoice = new Invoice(odao.getOrderID(account.getId()), odao.getOrderDate(account.getId()), 4, billing_name, billing_phone, billing_address, billing_mail, country, city, total);
                odao.insertOrderInfo(invoice);
                odao.addOrderTracking(odao.getOrderID(account.getId()));
                session.setAttribute("invoice", invoice);
                session.setAttribute("USER", adao.login(email, pass));
                response.sendRedirect("invoicetoemail");
            }
        } catch (ServletException | IOException e) {
        }
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
