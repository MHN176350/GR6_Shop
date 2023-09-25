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
        <title>Reset Password </title>

        <link rel="stylesheet" href="css/css-material-design-iconic-font.min.css">

        <link rel="stylesheet" href="css/css-style_1.css">
        <meta name="robots" content="noindex, follow">
    </head>
    <body class="img js-fullheight" style="background-image: url(images/3425822.jpg);">
        <div class="main">
            <div class="container">
                <div class="signup-content">
                    <form method="POST" action="reset" id="signup-form" class="signup-form">
                        <h2 style="padding-bottom: 20px"> Reset Password </h2>
                        
                        <div class="form-group">
                            <input type="password" class="form-input" name="npassword1" id="password" placeholder="New Password" required="">
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="nrepassword1" id="password" placeholder="Re-Password" required="">
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>

                        <div style="">


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
                                String messageSUCCESS = (String) request.getAttribute("SUCCESS");
                                if (messageSUCCESS != null) {
                            %>
                            <div class="alert alert-danger">
                                
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>Reset password successfully! Go back Sign In, click <a href="login.jsp" class="term-service">here</a></label>
                            </div>
                            <%
                                }
                            %>

                        </div>

                        <div class="form-group" style="padding-top: 20px;padding-left: 150px">
                            <input type="submit" name="submit" id="submit" class="form-submit submit" value="CONFIRM">

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

