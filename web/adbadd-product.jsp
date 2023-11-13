<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Electro Admin - Add Product</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <!-- http://api.jqueryui.com/datepicker/ -->
        <link rel="stylesheet" href="css/bootstrap.min_1.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body>
        <jsp:include page="headeradmin.jsp"></jsp:include>
            <div class="container tm-mt-big tm-mb-big">
                <div class="row">
                    <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <div class="row">
                                <div class="col-12">
                                    <h2 class="tm-block-title d-inline-block">Add Product</h2>
                                </div>
                            </div>
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <form action="addproduct" class="tm-edit-product-form" method="POST" onsubmit="return validateCategory() && validateBrand() && validateDiscount() && validatePrice() && validateQuantity()">
                                        <div class="form-group mb-3">
                                            <label
                                                for="name"
                                                >Product Name
                                            </label>
                                            <input
                                                id="name"
                                                name="name"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                />
                                        </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="price"
                                                >Price
                                            </label>
                                            <input
                                                id="price"
                                                name="price"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                />
                                        </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="quantity"
                                                >Quantity
                                            </label>
                                            <input
                                                id="quantity"
                                                name="quantity"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                />
                                        </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="discount"
                                                >Discount
                                            </label>
                                            <input
                                                id="discount"
                                                name="discount"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                />
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="description">Description</label>
                                            <textarea
                                                name="description"
                                                class="form-control validate"
                                                rows="3"
                                                required
                                                ></textarea>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="category" name="category">Category</label>
                                            <select class="custom-select tm-select-accounts validate" id="category" name="category">
                                                <option selected>Select category</option>
                                            <c:forEach items="${listC}" var="lC">
                                                <option value="${lC.id}">${lC.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="brand">Brand</label>
                                        <select class="custom-select tm-select-accounts validate" name="brand">
                                            <option selected>Select brand</option>
                                            <c:forEach items="${listB}" var="lB">
                                                <option value="${lB.id}">${lB.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <c:choose>
                                        <c:when test="${check == true}">
                                            Add product successfully: ${nameP}
                                        </c:when>
                                        <c:otherwise>
                                            
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
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
        <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
        <!-- https://jqueryui.com/download/ -->
        <script src="js/bootstrap.min_1.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script>
                                        $(function () {
                                            $("#expire_date").datepicker();
                                            $("#category").datepicker();
                                        });
        </script>
        <script>
            function validateCategory() {
                var categorySelect = document.getElementById("category");
                var selectedCategory = categorySelect.options[categorySelect.selectedIndex].value;

                if (selectedCategory === "Select category") {
                    alert("Please select a category!");
                    return false;
                }
                return true;
            }

            function validateBrand() {
                var brandSelect = document.getElementsByName("brand")[0];
                var selectedBrand = brandSelect.options[brandSelect.selectedIndex].value;

                if (selectedBrand === "Select brand") {
                    alert("Please select a brand!");
                    return false;
                }
                return true;
            }

            function validateDiscount() {
                var discountInput = document.getElementById("discount");
                var discountValue = discountInput.value;

                if (!/^(\d+)$/.test(discountValue)) {
                    alert("Discount must be an integer!");
                    return false;
                }
                return true;
            }

            function validateQuantity() {
                var quantityInput = document.getElementById("quantity");
                var quantityValue = quantityInput.value;

                if (!/^(\d+)$/.test(quantityValue)) {
                    alert("Quantity must be an integer!");
                    return false;
                }
                return true;
            }


            function validatePrice() {
                var priceInput = document.getElementById("price");
                var priceValue = priceInput.value;

                if (!/^\d+(\.\d+)?$/.test(priceValue)) {
                    alert("Price must be a number (double)!");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
