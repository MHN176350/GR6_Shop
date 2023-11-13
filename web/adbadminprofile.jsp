<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Electro Admin - Profile</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min_1.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
        <div class="" id="home">
            <jsp:include page="headeradmin.jsp"></jsp:include>
            <div class="container mt-5">
                <!-- row -->
                <div style="justify-content: center; padding-top: 40px" class="row tm-content-row">
                    <div style="border: double" class="tm-block-col tm-col-account-settings">
                        <div class="tm-bg-primary-dark tm-block tm-block-settings">
                            <h2 class="tm-block-title">Administrator Account Settings</h2>
                            <form action="adbchangepassword" method="post" class="tm-signup-form row">
                                <div class="form-group col-lg-6">
                                    <label for="password2">Old Password</label>
                                    <input
                                        id="opassword"
                                        name="opassword"
                                        type="password"
                                        class="form-control validate"
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="password">New Password</label>
                                    <input
                                        id="password1"
                                        name="password1"
                                        type="password"
                                        class="form-control validate"
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="password2">Re-enter New Password</label>
                                    <input
                                        id="password2"
                                        name="password2"
                                        type="password"
                                        class="form-control validate"
                                        />
                                </div>
                                <c:if test="${SUCCESS == null && failed == null}">
                                    <div class="form-group col-lg-6">
                                        <label class="tm-hide-sm">&nbsp;</label>
                                        <button
                                            type="submit"
                                            class="btn btn-primary btn-block text-uppercase"
                                            >
                                            Update Password
                                        </button>
                                    </div>
                                </c:if>
                                <div style="padding-top: 10px; padding-bottom: 10px; padding-left: 15px " class="g-recaptcha" data-sitekey="6LeiQF4oAAAAAKmYr1qGsmRKV_V6axMTxKI9m10Z"></div>
                            </form>

                            <div style="color: red; font-family: monospace; font-size: larger">${failed}</div>
                            <div style="color: red; font-family: monospace; font-size: larger">${message}</div>
                            <div style="color: red; font-family: monospace; font-size: larger">${SUCCESS}</div>
                            <%
                                String message = (String) request.getAttribute("failed");
                                if (message != null) {
                            %>

                            <script>

                                function redirect() {

                                    window.location.href = 'adblogin.jsp';
                                }
                                setTimeout(redirect, 4000);
                            </script>

                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style>
            body{
                background-color: #fff;
            }
            .tm-bg-primary-dark {
                background-color: #495057e0;
            }
            .form-control {
                background-color: #ced4da;
                color: #fff;
                border: 0;
            }
            .btn-primary {
                color: #fff;
                background-color: #4e657a;
                border: 2px solid #8c8e91;
                font-size: 90%;
                font-weight: 600;
            }
            .tm-col-account-settings {
                max-width: 822px;
                width: 63%;
                padding: 0;
            }

        </style>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min_1.js"></script>
        <!-- https://getbootstrap.com/ -->
    </body>
</html>
