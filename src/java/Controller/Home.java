/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Product;
import dal.DAO;
import dal.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ngnqu
 */
public class Home extends HttpServlet {

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
        DAO dao = new DAO();
        OrderDAO odao = new OrderDAO();
        List<Product> listNewLap = dao.getNewLapProduct();
        List<Product> listNewPhone = dao.getNewPhoneProduct();
        List<Product> listNewCam = dao.getNewCamProduct();
        List<Product> listHotLap = dao.getHotLap();
        List<Product> listHotPhone = dao.getHotPhone();
        List<Product> listHotCam = dao.getHotCam();
        List<Product> listDealLap = dao.getDealLapProduct();
        List<Product> listDealPhone = dao.getDealPhoneProduct();
        List<Product> listDealCam = dao.getDealCamProduct();
        List<String> listNewLapId = dao.getNewLapProductID();
        List<String> listNewPhoneId = dao.getNewPhoneProductID();
        List<String> listNewCamId = dao.getNewCamProductID();

        request.setAttribute("deal_pid", odao.getDealProduct());
        request.setAttribute("listNewLap", listNewLap);
        request.setAttribute("listNewPhone", listNewPhone);
        request.setAttribute("listNewCam", listNewCam);
        request.setAttribute("listHotLap", listHotLap);
        request.setAttribute("listHotPhone", listHotPhone);
        request.setAttribute("listHotCam", listHotCam);
        request.setAttribute("listNewCamId", listNewCamId);
        request.setAttribute("listNewPhoneId", listNewPhoneId);
        request.setAttribute("listNewLapId", listNewLapId);
        request.setAttribute("listDealLap", listDealLap);
        request.setAttribute("listDealPhone", listDealPhone);
        request.setAttribute("listDealCam", listDealCam);
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
