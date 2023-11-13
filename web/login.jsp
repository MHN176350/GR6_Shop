<%-- 
    Document   : login
    Created on : Sep 20, 2023, 10:15:15 AM
    Author     : MILAMILO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Sign in - Electro Shop</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/css-style.css">
    </head>
    <body style="background-image: url(images/background.jpg);background-size: cover;background-repeat: no-repeat;background-position: center;background-attachment: fixed">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section"></h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">SIGN IN</h3>
                            <form action="login" method="post" class="signin-form">
                                <div class="form-group">
                                    <input type="text" name="username" class="form-control" placeholder="Username" required value="${mail}">
                                </div>
                                <div class="form-group">
                                    <input id="password-field" type="password" name="password" class="form-control" placeholder="Password" required="">
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div style="padding-bottom: 10px"> ${message}</div>
                                <div></div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
                                </div>
                            </form>
                            <div class="form-group d-md-flex">
                                <div class="w-50">
                                    <a href="signup.jsp"><label class="checkbox-wrap checkbox-primary"><i style="padding-right: 5px" class="fa fa-user-plus"></i> SIGN UP</label></a>
                                </div>
                                <div class="w-50 text-md-right">
                                    <a href="forgotpassword.jsp" style="color: #fff">Forgot Password</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <style>
                body {
                    font-family: "Lato", Arial, sans-serif;
                    font-size: 16px;
                    line-height: revert;
                    font-weight: normal;
                    color: gray;
                    position: inherit;
                    z-index: 0;
                    padding: 0;
                }
            </style>
        </section>
        <script src="js/8479-js-jquery.min.js"></script>
        <script src="js/4082-js-popper.js"></script>
        <script src="js/2459-js-bootstrap.min.js"></script>
        <script src="js/211-js-main.js"></script>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v8b253dfea2ab4077af8c6f58422dfbfd1689876627854" integrity="sha512-bjgnUKX4azu3dLTVtie9u6TKqgx29RBwfj3QXYt5EKfWM/9hPSAI/4qcV5NACjwAo8UtTeWefx6Zq5PHcMm7Tg==" data-cf-beacon='{"rayId":"8096e512af5dc4b9","version":"2023.8.0","b":1,"token":"cd0b4b3a733644fc843ef0b185f98241","si":100}' crossorigin="anonymous"></script>
        <div style="padding-top: 80px" class="w-50">
            <a href="adblogin.jsp"><label class="checkbox-wrap checkbox-primary"><i style="padding-right: 5px" class="fa fa-sign-in"></i> Administrator Login</label></a>
        </div>
    </body>
</html>

