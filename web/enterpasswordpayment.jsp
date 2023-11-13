<%-- 
    Document   : signup
    Created on : Sep 20, 2023, 8:32:45 PM
    Author     : MILAMILO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Verify - Electro Shop </title>

        <link rel="stylesheet" href="css/css-material-design-iconic-font.min.css">

        <link rel="stylesheet" href="css/css-style_1.css">
        <meta name="robots" content="noindex, follow">
    </head>
    <body style="background-image: url(images/background.jpg);background-size: cover;background-repeat: no-repeat;background-position: center;background-attachment: fixed">
        <div class="main">
            <div class="container">
                <div class="signup-content">
                    <form method="POST" action="verifypasswordpayment" id="signup-form" class="signup-form">
                        <h2> Verify password </h2>
                        <div style="padding-bottom: 30px; font-size: smaller; color: wheat"> Sorry. We wanted to make sure that it was you ! </div>

                        <div style="padding-bottom: 15px">
                            <input type="password" class="form-input" name="npassword1" id="password1" placeholder="Password" required="">
                            <span toggle="#password1" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        <div style="padding-bottom: 10px " class="g-recaptcha" data-sitekey="6LeiQF4oAAAAAKmYr1qGsmRKV_V6axMTxKI9m10Z"></div>
                        <div class="error">
                            <%
                                String passError = (String) request.getAttribute("passERROR");
                                if (passError != null) {
                            %>
                            <div class="alert alert-danger">
                                <%= passError%>
                            </div>
                            <%
                                }
                            %>

                            <%
                                String passAttempts = (String) request.getAttribute("passAttempts");
                                if (passAttempts != null) {
                            %>
                            <div class="alert alert-danger">
                                <label for="agree-term" class="label-agree-term"><span><%= passAttempts%> Redirecting to Sign In in <span id="countdown-timer">7 second(s)</span>.</span></label>
                            </div>

                            <script>

                                function redirect() {

                                    window.location.href = 'login.jsp';
                                }
                                setTimeout(redirect, 7000);
                            </script>
                            <%
                                }
                            %>
                        </div>
                        <c:if test="${passAttempts == null}">
                            <div class="form-group" style="padding-top: 20px;padding-left: 150px">
                                <input type="submit" name="submit" id="submit" class="form-submit submit" value="COUNTINUE">
                            </div>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>

        <script src="js/jquery-jquery.min.js"></script>
        <script src="js/4370-js-main.js"></script>

        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script>
                                window.dataLayer = window.dataLayer || [];
                                function gtag() {
                                    dataLayer.push(arguments);
                                }
                                gtag('js', new Date());

                                gtag('config', 'UA-23581568-13');
        </script>
        <script>

            function updateTimer() {
                var timerElement = document.getElementById('countdown-timer');
                var countdownTime = 7;
                function decrementTime() {
                    countdownTime--;
                    if (countdownTime >= 0) {
                        timerElement.textContent = countdownTime + " second(s)";
                        setTimeout(decrementTime, 1000);
                    }
                }
                decrementTime();
            }
            window.onload = updateTimer;
        </script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v8b253dfea2ab4077af8c6f58422dfbfd1689876627854" integrity="sha512-bjgnUKX4azu3dLTVtie9u6TKqgx29RBwfj3QXYt5EKfWM/9hPSAI/4qcV5NACjwAo8UtTeWefx6Zq5PHcMm7Tg==" data-cf-beacon='{"rayId":"809a63f86e6ec5c5","version":"2023.8.0","b":1,"token":"cd0b4b3a733644fc843ef0b185f98241","si":100}' crossorigin="anonymous"></script>
    </body>
</html>

