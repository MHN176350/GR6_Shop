<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Electro Admin - Forgot Password</title>
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
                                <h2 class="tm-block-title mb-4">Forgot Password</h2>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <form action="adbcheckaccount" method="post" class="tm-login-form">
                                    <div class="form-group">
                                        <label for="username">Enter Username: </label>
                                        <input
                                            name="username"
                                            type="text"
                                            class="form-control validate"
                                            id="username"
                                            value="${username}"
                                            required
                                            />
                                    </div>
                                    <div class="form-group">
                                        <label style="display: flex" for="username">Enter Email:</label>
                                        <input
                                            name="email"
                                            type="text"
                                            class="form-control validate"
                                            id="username"
                                            value="${email}"
                                            required
                                            />
                                    </div>

                                    <div style="color: red; font-family: monospace; font-size: larger">${message}</div>
                                    <div class="form-group mt-4">
                                        <button
                                            type="submit"
                                            class="btn btn-primary btn-block text-uppercase"
                                            >
                                            Next
                                        </button>
                                    </div>
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
