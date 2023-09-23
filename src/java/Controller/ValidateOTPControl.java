package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ValidateOtp
 */
@WebServlet("/validateotp")
public class ValidateOTPControl extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            int value = Integer.parseInt(request.getParameter("otp"));
            HttpSession session = request.getSession();
            int otp = (int) session.getAttribute("otp");
            if (value == otp) {

                request.setAttribute("email", request.getParameter("email"));
                request.getRequestDispatcher("enternewpassword.jsp").forward(request, response);

            } else {
                request.setAttribute("otpERROR", "OTP is wrong!");
                request.getRequestDispatcher("enterotp.jsp").forward(request, response);

            }
        } catch (ServletException | IOException | NumberFormatException e) {
            request.setAttribute("otpERROR", "OTP is wrong!");
            request.getRequestDispatcher("enterotp.jsp").forward(request, response);
        }

    }

}
