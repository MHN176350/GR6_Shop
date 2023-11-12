/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.SignUp;
import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String re_password = request.getParameter("repassword");
            String first_name = request.getParameter("fname");
            String last_name = request.getParameter("lname");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String passError;

            HttpSession mySession = request.getSession();
            AccountDAO account_dao = new AccountDAO();
            Account a = account_dao.checkAccountExist(email);
            SignUp signup = new SignUp(first_name, last_name, email, password, phone, address);
            mySession.setAttribute("signup", signup);

            if (!re_password.equals(password)) {
                request.setAttribute("ERROR", "Re-password does not match with Password!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                request.setAttribute("ERROR", "Invalid email address format !");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else if (password.matches(".*\\s.*")) {
                passError = "Password should not contain spaces.\n";
                request.setAttribute("ERROR", passError);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else if (password.matches(".*\\s{2,}.*")) {
                passError = "Password should not contain spaces.\n";
                request.setAttribute("ERROR", passError);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
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
                    request.setAttribute("ERROR", passError + ".");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                }
            } else if (!phone.matches("^\\d{10,}$")) {
                request.setAttribute("ERROR", "Phone number must have at least 10 digits!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else if (a != null) {
                request.setAttribute("ERROR", "Email is exist!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else {
                int otpvalue;
                Random rand = new Random();
                otpvalue = rand.nextInt(1255650);
                String to = email;
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("alphashopfpt@gmail.com", "hgmw axdt dcsj jhig");
                    }
                }
                );
                try {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(email));
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    message.setSubject("Electro Shop");
                    message.setText("Hello. This is your OTP code. Do not share this code to anyone! Your OTP is: " + otpvalue);
                    Transport.send(message);
                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
                ScheduledExecutorService scheduler = Executors.newSingleThreadScheduledExecutor();
                scheduler.schedule(() -> {
                    mySession.removeAttribute("otp");
                }, 30, TimeUnit.SECONDS);

                mySession.setAttribute("otp", otpvalue);
                response.sendRedirect("enterotpemail.jsp");
            }
        } catch (ServletException | IOException | RuntimeException e) {
            request.setAttribute("ERROR", "Something went wrong. Exit browser and try again!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
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
