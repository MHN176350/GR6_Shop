<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Electro Admin - Edit Product</title>
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
                                    <h2 class="tm-block-title d-inline-block">Edit Product</h2>
                                </div>
                            </div>
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-7 col-lg-6 col-md-12">
                                    <form action="editproduct" method="POST" class="tm-edit-product-form">
                                        <div class="form-group mb-3">
                                            <label
                                                for="name"
                                                >Product Name
                                            </label>
                                            <input
                                                id="name"
                                                name="name"
                                                type="text"
                                                value="${product.name}"
                                            class="form-control validate"
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="description"
                                            >Description</label
                                        >
                                        <textarea  
                                            name="description"
                                            class="form-control validate tm-small"
                                            rows="5"
                                            required
                                            >${product.description}</textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="category"
                                            >Category</label
                                        >
                                        <select
                                            name="category"
                                            class="custom-select tm-select-accounts"
                                            id="category"
                                            >
                                            <c:forEach items="${categorys}" var="b">
                                                <option value="${b.id}" ${b.id == product.category_id ? 'selected' : ''}>${b.name}</option>
                                            </c:forEach>
                                        </select>
                                        <label
                                            for="brand"
                                            >Brand</label
                                        >
                                        <select class="custom-select tm-select-accounts" id="brand" name="brand">
                                            <c:forEach items="${brand}" var="b">
                                                <option value="${b.id}" ${b.id == product.brand_id ? 'selected' : ''}>${b.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-4">
                                            <label
                                                for="price"
                                                >Price($)
                                            </label>
                                            <input
                                                id="price"
                                                name="price"
                                                type="text"
                                                value="${product.price}"
                                                class="form-control validate"
                                                data-large-mode="true"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-4">
                                            <label
                                                for="discount"
                                                >Discount(%)
                                            </label>
                                            <input
                                                id="discount"
                                                name="discount"
                                                type="text"
                                                value="${product.discount}"
                                                class="form-control validate"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-4">
                                            <label
                                                for="quantity"
                                                >Quantity
                                            </label>
                                            <input
                                                id="quantity"
                                                name="quantity"
                                                type="text"
                                                value="${product.quantity}"
                                                class="form-control validate"
                                                />
                                        </div>
                                    </div>
                            </div>
                            <div class="col-xl-5 col-lg-6 col-md-12 mx-auto mb-4">
                                <div class="tm-product-img-edit mx-auto">
                                    <img src="${product.img}" alt="Product image" class="img-fluid d-block mx-auto">
                                    <i
                                        class="fas fa-cloud-upload-alt tm-upload-icon"
                                        onclick="document.getElementById('fileInput').click();"
                                        ></i>
                                </div>
                                <div class="custom-file mt-3 mb-3">
                                    <input id="fileInput" type="file" style="display:none;" />
                                    <input
                                        type="button"
                                        class="btn btn-primary btn-block mx-auto"
                                        value="CHANGE IMAGE NOW"
                                        onclick="document.getElementById('fileInput').click();"
                                        />
                                </div>
                            </div>
                            <input type="hidden" value="${product.id}" name="id"/>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Now</button>
                            </div>
                            </form>
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
        </script>
    </body>
</html>
