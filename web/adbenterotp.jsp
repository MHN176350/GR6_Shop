<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Electro Admin - Verify OTP</title>
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

        <div style="padding-bottom: 200px" class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-12 mx-auto tm-login-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12 text-center">
                                <h2 class="tm-block-title mb-4">Enter OTP </h2>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <form action="adbvalidate" method="post" class="tm-login-form">
                                    <div class="form-group">
                                        <label for="username">Enter OTP: </label>
                                        <input
                                            name="otp"
                                            type="number"
                                            class="form-control validate"
                                            id="otp"
                                            required=""
                                            inputmode="none"
                                            />
                                    </div>
                                    <div style="padding-top: 10px; padding-bottom: 10px " class="g-recaptcha" data-sitekey="6LeiQF4oAAAAAKmYr1qGsmRKV_V6axMTxKI9m10Z"></div>
                                    <div style="color: red; font-family: monospace; font-size: larger">${message}</div>
                                    <div style="color: red; font-family: monospace; font-size: larger">${over}</div>
                                    <div style="color: red; font-family: monospace; font-size: larger">${message1}</div>
                                    <c:if test="${over == null && message1 == null}">
                                        <div class="form-group mt-4">
                                            <button
                                                type="submit"
                                                class="btn btn-primary btn-block text-uppercase"
                                                >
                                                Verify
                                            </button>
                                        </div>
                                    </c:if>

                                    <c:if test="${over != null || message1 != null}">
                                        <div class="form-group mt-4">
                                            <a href="adbforgot"
                                               type="submit"
                                               class="btn btn-primary btn-block text-uppercase"
                                               >
                                                Try again
                                            </a>
                                        </div>
                                    </c:if>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min_1.js"></script>
        <!-- https://getbootstrap.com/ -->
    </body>
</html>
