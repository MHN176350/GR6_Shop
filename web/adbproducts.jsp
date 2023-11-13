<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Electro Admin - Product</title>
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
        <jsp:include page="headeradmin.jsp"></jsp:include>
            <div class="container mt-5">
                <div class="row tm-content-row">
                    <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-products">
                            <div class="tm-product-table-container">
                            <c:if test="${not empty deleteSuccessMessage}">
                                <div class="alert alert-success">
                                    ${deleteSuccessMessage}
                                </div>
                            </c:if>
                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead>
                                    <tr>
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">PRODUCT NAME</th>
                                        <th scope="col">PRICE($)</th>
                                        <th scope="col">IN STOCK</th>
                                        <th scope="col">DISCOUNT(%)</th>
                                        <th scope="col">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="l" items="${listP}">
                                        <tr>
                                            <th scope="row"><input type="checkbox" /></th>
                                            <td class="tm-product-name" data-product-id="${l.id}">${l.name}</td>
                                            <td>${l.price}</td>
                                            <td>${l.quantity}</td>
                                            <td>${l.discount}</td>
                                            <td>
                                                <a href="#" class="tm-product-delete-link" data-product-id="${l.id}">
                                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                        <a
                            href="addproduct"
                            class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
                        <button class="btn btn-primary btn-block text-uppercase">
                            Delete selected products
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min_1.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script>
            $(function () {
                $(".tm-product-name").on("click", function () {
                    var productId = $(this).data("product-id");
                    window.location.href = "editproduct?id=" + productId;
                });

                $(".tm-product-delete-link").on("click", function (event) {
                    event.preventDefault();

                    var productId = $(this).data("product-id");
                    var productName = $(this).closest("tr").find(".tm-product-name").text();

                    var isConfirmed = confirm("Are you sure you want to delete the product: " + productName + "?");

                    if (isConfirmed) {
                        window.location.href = "deleteproduct?id=" + productId;
                    }
                });
                $("button").on("click", function () {
                    var selectedProducts = [];

                    $("tbody tr").each(function () {
                        var checkbox = $(this).find("input[type=checkbox]");

                        if (checkbox.prop("checked")) {
                            var productId = $(this).find(".tm-product-delete-link").data("product-id");
                            selectedProducts.push(productId);
                        }
                    });

                    if (selectedProducts.length > 0) {
                        var isConfirmed = confirm("Are you sure you want to delete the selected products?");

                        if (isConfirmed) {
                            window.location.href = "deleteproduct?id=" + selectedProducts.join(";");
                        }
                    } else {
                        alert("You must be selected products want to delete!");
                    }
                });
            });
        </script>
    </body>
</html>