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
        <title>Forgot Password - Electro Shop </title>
        <link rel="stylesheet" href="css/css-material-design-iconic-font.min.css">
        <link rel="stylesheet" href="css/css-style_1.css">
        <meta name="robots" content="noindex, follow">
    </head>
    <body style="background-image: url(images/background.jpg);background-size: cover;background-repeat: no-repeat;background-position: center;background-attachment: fixed">
        <div class="main">
            <div class="container">
                <div class="signup-content">
                    <form method="get" action="forgotpassword" id="signup-form" class="signup-form">
                        <h2 style="padding-bottom: 20px">Forgot Password </h2>
                        <div>
                            <input type="email" class="form-input" name="email" id="email" placeholder="Enter your email " required="" value="${sessionScope.email}">
                        </div>
                        <div class="error">
                            <%
                                String errorMessage = (String) request.getAttribute("ERROR");
                                if (errorMessage != null) {
                            %>
                            <div class="alert alert-danger">
                                <%= errorMessage%>
                            </div>
                            <%
                                }
                            %>
                        </div>
                        <div class="form-group" style="padding-left: 150px; padding-top: 20px">
                            <input type="submit" name="submit" id="submit" class="form-submit submit" value="RESET PASSWORD">
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

