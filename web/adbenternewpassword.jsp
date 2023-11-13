<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Electro Admin - Reset password</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Open+Sans -->
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

    <body>
        <div style="padding-bottom: 120px" class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-12 mx-auto tm-login-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12 text-center">
                                <h2 class="tm-block-title mb-4">Reset your password </h2>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <form action="adbresetpassword" method="post" class="tm-login-form">
                                    <div class="form-group">
                                        <label for="username">Enter new password: </label>
                                        <input
                                            name="npassword1"
                                            type="password"
                                            class="form-control validate"
                                            id="password"
                                            value=""
                                            required
                                            />
                                    </div>

                                    <div class="form-group">
                                        <label for="username">Re-Enter new password: </label>
                                        <input
                                            name="nrepassword1"
                                            type="password"
                                            class="form-control validate"
                                            id="password"
                                            value=""
                                            required
                                            />
                                    </div>

                                    <div style="color: red; font-family: monospace; font-size: larger">${SUCCESS}</div>
                                    <div style="color: red; font-family: monospace; font-size: larger">${message}</div>
                                    <%
                                        String messageSUCCESS = (String) request.getAttribute("SUCCESS");
                                        if (messageSUCCESS != null) {
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
                                    <c:if test="${SUCCESS == null}">
                                        <div class="form-group mt-4">
                                            <button
                                                type="submit"
                                                class="btn btn-primary btn-block text-uppercase"
                                                >
                                                Confirm
                                            </button>
                                        </div>
                                    </c:if>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min_1.js"></script>
        <!-- https://getbootstrap.com/ -->
    </body>
</html>
