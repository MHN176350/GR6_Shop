<%-- 
    Document   : signup
    Created on : Sep 20, 2023, 8:32:45 PM
    Author     : MILAMILO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up </title>

        <link rel="stylesheet" href="css/css-material-design-iconic-font.min.css">

        <link rel="stylesheet" href="css/css-style_1.css">
        <meta name="robots" content="noindex, follow">
    </head>
    <body class="img js-fullheight" style="background-image: url(images/3425822.jpg);">
        <div class="main">
            <div class="container">
                <div class="signup-content">
                    <form method="POST" action="signup" id="signup-form" class="signup-form">
                        <h2>Sign up </h2>
                        <div class="form-group">
                            <input type="text" class="form-input" name="fname" id="name" placeholder="First Name" required="">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="lname" id="name" placeholder="Last Name" required="">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-input" name="email" id="email" placeholder="Email" required="">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="password" id="password" placeholder="Password" required="">
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="repassword" id="password" placeholder="Re-Password" required="">
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="phone" id="phone" placeholder="Phone" required="">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="address" id="address" placeholder="Address" required="">
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term">
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in <a href="#" class="term-service">Terms of service</a></label>
                        </div>
                        <div style="">
                        <%
                                    String errorMessage = (String) request.getAttribute("phoneERROR");
                                    if (errorMessage != null) {
                        %>
                        <div class="alert alert-danger">
                            <%= errorMessage %>
                        </div>
                        <%
                            }
                        %>

                        <%
                            String passError = (String) request.getAttribute("passERROR");
                                    if(passError!=null){
                        %>
                        <div class="alert alert-danger">
                            <%= passError%>
                        </div>
                        <%
                            }
                        %>

                        <%
                            String existError = (String) request.getAttribute("existERROR");
                            if (existError != null) {
                        %>
                        <div class="alert alert-danger">
                            <%= existError %>
                        </div>
                        <%
                            }
                        %>
                        
                        <%
                            String nameError = (String) request.getAttribute("nameERROR");
                            if (nameError != null) {
                        %>
                        <div class="alert alert-danger">
                            <%= nameError %>
                        </div>
                        <%
                            }
                        %>
                        </div>
                        
                        <div class="form-group" style="padding-top: 20px;">
                            <input type="submit" name="submit" id="submit" class="form-submit submit" value="Sign up">
                            <a href="login.jsp" class="submit-link submit">Sign in</a>
                        </div>
                        
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
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v8b253dfea2ab4077af8c6f58422dfbfd1689876627854" integrity="sha512-bjgnUKX4azu3dLTVtie9u6TKqgx29RBwfj3QXYt5EKfWM/9hPSAI/4qcV5NACjwAo8UtTeWefx6Zq5PHcMm7Tg==" data-cf-beacon='{"rayId":"809a63f86e6ec5c5","version":"2023.8.0","b":1,"token":"cd0b4b3a733644fc843ef0b185f98241","si":100}' crossorigin="anonymous"></script>
    </body>
</html>

