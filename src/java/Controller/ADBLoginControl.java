/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ADBAccount;
import Model.PieChart;
import com.google.gson.Gson;
import dal.ADBAccountDAO;
import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
@WebServlet(name = "ADBLoginControl", urlPatterns = {"/adblogin"})
public class ADBLoginControl extends HttpServlet {

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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        ADBAccountDAO adbaccount_dao = new ADBAccountDAO();
        ADBAccount a = adbaccount_dao.login(username, password);
        HttpSession session = request.getSession();

        if (adbaccount_dao.getPasswordAttempts(username) == 3) {
            request.setAttribute("message", "You try many times. Your account is locked!");
            request.setAttribute("username", username);
            request.getRequestDispatcher("adblogin.jsp").forward(request, response);
        } else {
            if (a == null) {
                adbaccount_dao.updatePasswordAttempts(username);
                request.setAttribute("message", "Wrong Username or Password !");
                request.setAttribute("username", username);
                request.getRequestDispatcher("adblogin.jsp").forward(request, response);
            } else {
                adbaccount_dao.resetPasswordAttempts(username);
                session.setAttribute("ADBUSER", a);
                DAO da = new DAO();
                List<PieChart> data = new ArrayList<>();
                data.add(new PieChart("Laptop", da.getPie("1", 1)));
                data.add(new PieChart("Smartphone", da.getPie("2", 1)));
                data.add(new PieChart("HeadSet", da.getPie("3", 1)));
                Gson gson = new Gson();
                String jsonData = gson.toJson(data);
                List<PieChart> data1 = da.getLine(1, 1);
                List<PieChart> data2 = da.getLine(2, 1);
                List<PieChart> data3 = da.getCol();
                String jsonData1 = gson.toJson(data1);
                String jsonData2 = gson.toJson(data2);
                String jsonData3 = gson.toJson(data3);
                request.setAttribute("chartData", jsonData);
                request.setAttribute("chartData1", jsonData1);
                request.setAttribute("chartData2", jsonData2);
                request.setAttribute("chartData3", jsonData3);
                  request.setAttribute("newC", da.getNC(1));
            request.setAttribute("earn", da.Earning(1));
            request.setAttribute("newP", da.countnNP(1));
            request.setAttribute("countP", da.countP());
                request.setAttribute("type", 1);
                request.getRequestDispatcher("adbindex.jsp").forward(request, response);
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
        DAO da = new DAO();
        String type = request.getParameter("type");
        int t = 1;
        if (type != null) {
            t = Integer.parseInt(type);
        }
        List<PieChart> data = new ArrayList<>();
        data.add(new PieChart("Laptop", da.getPie("1", t)));
        data.add(new PieChart("Smartphone", da.getPie("2", t)));
        data.add(new PieChart("HeadSet", da.getPie("3", t)));
        Gson gson = new Gson();
        String jsonData = gson.toJson(data);
        List<PieChart> data1 = da.getLine(1, t);
        List<PieChart> data2 = da.getLine(2, t);
        String jsonData1 = gson.toJson(data1);
        String jsonData2 = gson.toJson(data2);
        List<PieChart> data3 = da.getCol();
        String jsonData3 = gson.toJson(data3);
        request.setAttribute("chartData", jsonData);
        request.setAttribute("chartData1", jsonData1);
        request.setAttribute("chartData2", jsonData2);
        request.setAttribute("chartData3", jsonData3);
        request.setAttribute("newC", da.getNC(t));
            request.setAttribute("earn", da.Earning(t));
            request.setAttribute("newP", da.countnNP(t));
            request.setAttribute("countP", da.countP());
        request.setAttribute("type", t);
        request.getRequestDispatcher("adbindex.jsp").forward(request, response);
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
