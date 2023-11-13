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
        <title>Sign Up - Electro Shop </title>

        <link rel="stylesheet" href="css/css-material-design-iconic-font.min.css">

        <link rel="stylesheet" href="css/signupcss-style.css">
        <meta name="robots" content="noindex, follow">

    </head>
    <body style="background-image: url(images/background.jpg);background-size: cover;background-repeat: no-repeat;background-position: center;background-attachment: fixed">
        <div class="main">
            <div class="container">
                <div class="signup-content">
                    <form action="signup" method="get" id="signup-form" class="signup-form">
                        <h2> Sign up </h2>
                        <div class="form-group">
                            <input type="text" class="form-input" name="fname" id="name" placeholder="First Name" required="" value="${sessionScope.signup.first_name}">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="lname" id="name" placeholder="Last Name" required="" value="${sessionScope.signup.last_name}">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="email" id="email" placeholder="Email" required="" value="${sessionScope.signup.email}">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="password" id="password1" placeholder="Password" required="">
                            <span toggle="#password1" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="repassword" id="password2" placeholder="Re-Password" required="">
                            <span toggle="#password2" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="phone" id="phone" placeholder="Phone" required="" value="${sessionScope.signup.phone}">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="address" id="address" placeholder="Address" required="" value="${sessionScope.signup.address}">
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required="">
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements with Term and Policies.</label>
                        </div>
                        <div style="color: wheat; font-size: smaller">
                            <%
                                String Error = (String) request.getAttribute("ERROR");
                                if (Error != null) {
                            %>
                            <div class="alert alert-danger">
                                <%= Error%>
                            </div>
                            <%
                                }
                            %>
                        </div>
                        <div style="padding-left: 60px; padding-top: 20px" >
                            <div class="form-group">
                                <input type="submit" name="submit" id="submit" class="form-submit submit" value="Sign up">
                                <a href="login.jsp" class="submit-link submit">Sign in</a>
                            </div>
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

