/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Minh
 */
@WebServlet(name="BlogEdit", urlPatterns={"/bedit"})
public class BlogEdit extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BlogEdit</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogEdit at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DAO da=new DAO();
        request.setAttribute("tar",da.getB(request.getParameter("id")));
        request.setAttribute("cat", da.getAllBC());
        request.getRequestDispatcher("BlogEditor.jsp").forward(request, response);
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DAO da=new DAO();
        if(!request.getParameter("btit").isEmpty() && !request.getParameter("cate").isEmpty() && !request.getParameter("content").isEmpty()&&!request.getParameter("thumb").isEmpty()){
        int id=Integer.parseInt(request.getParameter("id"));
        int cate=Integer.parseInt(request.getParameter("cate"));
        da.up_B(request.getParameter("btit"), cate, request.getParameter("thumb"),  request.getParameter("content"), id);
        request.setAttribute("tar",da.getB(request.getParameter("id")));
        request.setAttribute("cat", da.getAllBC());
        request.setAttribute("mes", "Save Succesful");
        request.getRequestDispatcher("BlogEditor.jsp").forward(request, response);
        }else{
             request.setAttribute("tar",da.getB(request.getParameter("id")));
        request.setAttribute("cat", da.getAllBC());
        request.setAttribute("mes", "Save Failed: Please fill all the blank");
        request.getRequestDispatcher("BlogEditor.jsp").forward(request, response);
        }
            
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
