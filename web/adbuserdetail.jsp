<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Electro Admin - User Detail</title>
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

    <body style="background-color: #FFF" id="reportsPage">
        <div class="" id="home">
            <jsp:include page="headeradmin.jsp"></jsp:include>
            <div class="container mt-5">

                <!-- row -->
                <div class="row tm-content-row">
                    <div class="tm-block-col tm-col-avatar">
                        <div class="tm-bg-primary-dark tm-block tm-block-avatar">
                            <h2 class="tm-block-title">Account Avatar</h2>
                            <div class="tm-avatar-container">
                                <img
                                    src="images/${us.ava}"
                                    alt="Avatar"
                                    class="tm-avatar img-fluid mb-4"
                                    />
                            </div>
                        </div>
                    </div>
                    <div class="tm-block-col tm-col-account-settings">
                        <div class="tm-bg-primary-dark tm-block tm-block-settings">
                            <h2 class="tm-block-title">Account Detail</h2>
                            <form action="" class="tm-signup-form row">
                                <div class="form-group col-lg-6">
                                    <label for="name">Account Name</label>
                                    <input
                                        id="name"
                                        name="name"
                                        type="text"
                                        class="form-control validate"
                                        readonly=""
                                        value="${us.fname} ${us.lname}"
                                        style="color: black"
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="email">Account Email</label>
                                    <input
                                        id="email"
                                        name="email"
                                        type="email"
                                        class="form-control validate"
                                        readonly=""
                                        value="${us.email}"
                                        style="color: black"
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="phone">Phone</label>
                                    <input
                                        id="phone"
                                        name="phone"
                                        type="text"
                                        class="form-control validate"
                                        readonly=""
                                        value="${us.phone}"
                                        style="color: black"
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="phone">Address</label>
                                    <input
                                        id="address"
                                        name="address"
                                        type="text"
                                        class="form-control validate"
                                        readonly=""
                                        value="${us.address}"
                                        style="color: black"
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="phone">Joined Date</label>
                                    <input
                                        id="date"
                                        name="date"
                                        type="text"
                                        class="form-control validate"
                                        readonly=""
                                        value="${us.date}"
                                        style="color: black"
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="phone">Balance </label>
                                    <input
                                        id="balance"
                                        name="balance"
                                        type="text"
                                        class="form-control validate"
                                        readonly=""
                                        value=" $ <fmt:formatNumber type="number" pattern="#,##0.0" value="${us.bal}"/>"
                                        style="color: black"
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="phone">Status </label>
                                    <input
                                        id="status"
                                        name="status"
                                        type="text"
                                        class="form-control validate"
                                        readonly=""
                                        <c:if test="${us.status == 1}"> value="Active"</c:if>
                                        <c:if test="${us.status == 0}">value="Deactive"</c:if>
                                        style="color: black"
                                        />
                                </div>
                            </form>
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
