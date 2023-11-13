<%-- 
    Document   : productlist
    Created on : Sep 22, 2023, 11:27:52 PM
    Author     : ngnqu
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Product List - Electro Shop </title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <style>
            .ok {
                text-align: center; /* Canh giữa nút theo chiều ngang */
            }

            .ok input[type="submit"] {
                width: 65%; /* Đổi giá trị width tại đây */
                margin: 5% auto; /* Canh giữa nút theo chiều ngang */
                padding: 10px;
                background-color: #D10024; /* Màu đỏ */
                color: #fff; /* Chữ màu trắng */
                border: none;
                cursor: pointer;
                text-transform: uppercase;
                font-weight: bold;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }
            .product .add-to-cart {
                position: absolute;
                left: 1px;
                right: 1px;
                bottom: 1px;
                padding: 15px;
                background: transparent!important ;
                text-align: center;
                -webkit-transform: translateY(0%);
                -ms-transform: translateY(0%);
                transform: translateY(0%);
                -webkit-transition: 0.2s all;
                transition: 0.2s all;
                z-index: 2;
            }

        </style>

    </head>

    <jsp:include page="header.jsp" />

    <!-- NAVIGATION -->
    <nav id="navigation">
        <!-- container -->
        <div class="container">
            <!-- responsive-nav -->
            <div id="responsive-nav">
                <!-- NAV -->
                <ul class="main-nav nav navbar-nav">
                    <li><a href="home">Home</a></li>
                    <li class="<%= (request.getParameter("category_id") != null && request.getParameter("category_id").equals("1")) ? "active" : ""%>">
                        <a href="http://localhost:9999/GR6_Shop/productfilter?category_id=1&minprice=1.00&maxprice=999.00&brand=all&sort=ASC&option=6&show=1">Laptops</a>
                    </li>
                    <li class="<%= (request.getParameter("category_id") != null && request.getParameter("category_id").equals("2")) ? "active" : ""%>">
                        <a href="http://localhost:9999/GR6_Shop/productfilter?category_id=2&minprice=1.00&maxprice=999.00&brand=all&sort=ASC&option=6&show=1">Smartphones</a>
                    </li>
                    <li class="<%= (request.getParameter("category_id") != null && request.getParameter("category_id").equals("3")) ? "active" : ""%>">
                        <a href="http://localhost:9999/GR6_Shop/productfilter?category_id=3&minprice=1.00&maxprice=999.00&brand=all&sort=ASC&option=6&show=1">Cameras</a>
                    </li>
                    <li>
                        <a href="http://localhost:9999/GR6_Shop/blist">Blogs</a>
                    </li>
                </ul>
                <!-- /NAV -->
            </div>
            <!-- /responsive-nav -->
        </div>
        <!-- /container -->
    </nav>

    <!-- /NAVIGATION -->


    <!-- SECTION -->
    <!--<form id="filter-form" method="GET" action="productfilter">-->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- ASIDE -->
                <div id="aside" class="col-md-3">
                    <form id="filter-form" method="GET" action="productfilter">
                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Categories</h3>
                            <div class="checkbox-filter">
                                <c:forEach items="${listC}" var="cate">
                                    <div class="input-radio">
                                        <input type="radio" id="category-${cate.id}" name="category_id" value="${cate.id}">
                                        <label for="category-${cate.id}">
                                            <span></span>
                                            ${cate.name}
                                            <small>(${cate.quntity})</small>
                                        </label>
                                    </div>
                                </c:forEach>
                                <div class="input-radio">
                                    <input type="radio" id="category-all" name="category_id" value="all">
                                    <label for="category-all">
                                        <span></span>
                                        All
                                    </label>
                                </div>
                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Price</h3>
                            <div class="price-filter">
                                <div id="price-slider"></div>
                                <div class="input-number price-min">
                                    <input id="price-min" type="number" name="minprice" >
                                    <span class="qty-up">+</span>
                                    <span class="qty-down">-</span>
                                </div>
                                <span>-</span>
                                <div class="input-number price-max">
                                    <input id="price-max" type="number" name="maxprice" >
                                    <span class="qty-up">+</span>
                                    <span class="qty-down">-</span>
                                </div>
                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Brand</h3>
                            <div class="checkbox-filter">
                                <c:forEach items="${listB}" var="brand">
                                    <div class="input-radio">
                                        <input type="radio" id="brand-${brand.id}" name="brand" value="${brand.id}">
                                        <label for="brand-${brand.id}">
                                            <span></span>
                                            ${brand.name}
                                            <small>(${brand.quantity})</small>
                                        </label>
                                    </div>
                                </c:forEach>
                                <div class="input-radio">
                                    <input type="radio" id="brand-all" name="brand" value="all">
                                    <label for="brand-all">
                                        <span></span>
                                        All
                                    </label>
                                </div>
                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <div class="ok">
                            <input type="submit" value="Filter" />
                        </div>
                    </form>

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Top selling</h3>
                        <c:forEach items="${listHotSelling}" var="l">
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="${l.img}" alt="">
                                </div>
                                <div class="product-body">
                                    <!--<p class="product-category">${l.category_id}</p>-->
                                    <h3 class="product-name"><a href="productdetail?productid=${l.id}">${l.name}</a></h3>
                                    <h4 class="product-price">
                                        $<fmt:formatNumber value="${l.price * (1 - l.discount/100)}" type="number" maxFractionDigits="2" minIntegerDigits="2"/>
                                        <c:if test="${l.discount != 0}">
                                            <del class="product-old-price">$${l.price}</del>
                                        </c:if>
                                    </h4>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!-- /aside Widget -->
                </div>
                <!-- /ASIDE -->



                <!-- STORE -->
                <div id="store" class="col-md-9">
                    <!-- store top filter -->
                    <div class="store-filter clearfix">
                        <div class="store-sort">
                            <label>
                                Sort By Price :
                                <select class="input-select" name="sort" id="option-select1" onchange="sortProducts(this)">
                                    <option value="ASC">Ascending</option>
                                    <option value="DESC">Descending</option>
                                </select>
                            </label>

                            <label>
                                Show:
                                <select class="input-select" name="option" id="option-select2" onchange="showProducts(this)">
                                    <option value="6">6</option>
                                    <option value="9">9</option>
                                    <option value="12">12</option>
                                </select>
                            </label>
                        </div>
                    </div>
                    <!-- /store top filter -->

                    <!-- store products -->
                    <div class="row">
                        <c:forEach items="${list}" var="l">
                            <c:set var="currentProductId" value="${l.id}" />

                            <c:forEach items="${withstar}" var="productStats">
                                <c:if test="${productStats.product_id == currentProductId}">
                                    <c:set var="avg_star" value="${productStats.avg_star}" />
                                    <c:set var="avg_star_int" value="${productStats.avg_star_int}" />
                                    <c:set var="w_check" value="${productStats.w_check}" />
                                    <c:choose>
                                        <c:when test="${avg_star_int > avg_star}">
                                            <c:set var="fullStars" value="${avg_star_int - 1}" />
                                            <c:set var="halfStar" value="1" />
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="fullStars" value="${avg_star_int}" />
                                            <c:set var="halfStar" value="0" />
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </c:forEach>

                            <!-- product -->
                            <div class="col-md-4 col-xs-6">
                                <div class="product">
                                    <div class="product-img">
                                        <img src="${l.img}" alt="">
                                        <div class="product-label">
                                            <c:if test="${l.discount != 0}">
                                                <span class="sale">-${l.discount}%</span>
                                            </c:if>
                                            <c:if test="${listNewCamId.contains(l.id.toString()) || listNewPhoneId.contains(l.id.toString()) || listNewLapId.contains(l.id.toString())}">
                                                <span class="new">NEW</span>
                                            </c:if>
                                        </div>
                                    </div>

                                    <div class="product-body">
                                        <p class="product-category">${l.quantity} products remaining</p>
                                        <h3 class="product-name"><a href="productdetail?productid=${l.id}">${l.name}</a></h3>
                                        <h4 class="product-price">
                                            $ <fmt:formatNumber value="${l.price * (1 - l.discount/100)}" type="number" maxFractionDigits="2" minIntegerDigits="2"/>
                                            <del class="product-old-price">$${l.price}</del>
                                        </h4>
                                        <div class="product-rating">
                                            <c:forEach var="i" begin="1" end="${fullStars}">    
                                                <i style="color: #D10024" class="fa fa-star"></i>
                                            </c:forEach> 
                                            <c:if test="${halfStar == 1}">
                                                <i class="fa fa-star-half-o" style="color: #D10024"></i>
                                            </c:if>
                                            <c:forEach var="i" begin="1" end="${5 - fullStars - halfStar}">
                                                <i style="color: #E4E7ED" class="fa fa-star-o"></i>
                                            </c:forEach>
                                        </div>

                                        <div style="display: flex; justify-content: center">
                                            <c:if test="${w_check == false}">
                                                <form class="product-btns" action="addtowishlist" method="get">
                                                    <input type="hidden" name="pid" value="${l.id}"/>
                                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                </form>
                                                <form class="product-btns" action="productdetail" method="get">
                                                    <input type="hidden" name="productid" value="${l.id}"/>
                                                    <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                </form>
                                            </c:if>

                                            <c:if test="${w_check == true}">
                                                <div class="product-btns"><button class="add-to-wishlist"><i style="color: red" class="fa fa-heart"></i><span class="tooltipp">added to wishlist</span></button></div> 
                                                <form class="product-btns" action="productdetail" method="get">
                                                    <input type="hidden" name="productid" value="${l.id}"/>
                                                    <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                </form>
                                            </c:if>
                                        </div>

                                    </div>

                                    <div class="add-to-cart">
                                        <c:choose>
                                            <c:when test="${l.quantity != 0}">
                                                <form action="addtocart" method="post">
                                                    <input type="hidden" name="pid" value="${l.id}"/>
                                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <button style="color: white; background-color: #777; border-color: #777" class="add-to-cart-btn"><i style="color: aliceblue" class="fa fa-exclamation-triangle"></i> out of stock</button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            <!-- /product -->
                        </c:forEach>
                    </div>

                    <!-- /store products -->

                    <!-- store bottom filter -->
                    <div class="store-filter clearfix">
                        <span class="store-qty">Showing ${p}-${countP} products</span>
                        <ul class="store-pagination">
                            <c:forEach begin="1" end="${endpage}" var="i">
                                <c:url value="http://localhost:9999/GR6_Shop/productfilter" var="pageURL">
                                    <c:param name="category_id" value="${param.category_id}" />
                                    <c:param name="minprice" value="${param.minprice}" />
                                    <c:param name="maxprice" value="${param.maxprice}" />
                                    <c:param name="brand" value="${param.brand}" />
                                    <c:param name="sort" value="${param.sort}" />
                                    <c:param name="option" value="${param.option}" />
                                    <c:param name="show" value="${i}" />
                                    <c:param name="productName" value="${param.productName}" />
                                </c:url>
                                <li <c:if test="${i == param.show}">class="active"</c:if>><a href="${pageURL}">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </div>

                    <!-- /store bottom filter -->
                </div>
                <!-- /STORE -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <input name="show" type="hidden" value="1">
    <!--</form>-->
    <!-- /SECTION -->




    <jsp:include page="footer.jsp"/>
    <script>
        const optionSelect1 = document.getElementById('option-select1');
        // Đọc giá trị "option" từ URL
        const urlParams = new URLSearchParams(window.location.search);
        const sortValue = urlParams.get('sort');

        if (sortValue === 'ASC') {
            // Kiểm tra nếu giá trị "option" là 6, thì đặt tùy chọn (option) có giá trị 6 là được chọn
            optionSelect1.value = 'ASC';
        }
        if (sortValue === 'DESC') {
            // Kiểm tra nếu giá trị "option" là 6, thì đặt tùy chọn (option) có giá trị 6 là được chọn
            optionSelect1.value = 'DESC';
        }

        function sortProducts(selectElement) {
            // Lấy giá trị được chọn trong dropdown Sort By
            const selectedSortValue = selectElement.value;
            updateURLParameter('sort', selectedSortValue);
        }

        function showProducts(selectElement) {
            // Lấy giá trị được chọn trong dropdown Show
            const selectedShowValue = selectElement.value;
            updateURLParameter('option', selectedShowValue);
        }

        function updateURLParameter(paramName, paramValue) {
            const urlParams = new URLSearchParams(window.location.search);
            urlParams.set(paramName, paramValue);

            // Tạo một URL mới dựa trên URL hiện tại và thêm hoặc cập nhật tham số
            const newURL = window.location.pathname + "?" + urlParams.toString();

            // Chuyển hướng trình duyệt đến URL mới
            window.location.href = newURL;
        }

        function checkURLParameters() {
            const urlParams = new URLSearchParams(window.location.search);
            const categoryValue = urlParams.get("category_id");
            const brandValue = urlParams.get("brand");
            const minPriceValue = urlParams.get("minprice");
            const maxPriceValue = urlParams.get("maxprice");
            const optionValue = urlParams.get("option");
            const optionSelect2 = document.getElementById('option-select2');

            if (optionValue) {
                optionSelect2.value = optionValue;
            }

            // Check and set brand radio buttons
            const categoryRadioButtons = document.querySelectorAll('input[type="radio"][name="category_id"]');
            for (const radio of categoryRadioButtons) {
                if (radio.value === categoryValue) {
                    radio.checked = true;
                }
            }

            // Check and set brand radio buttons
            const brandRadioButtons = document.querySelectorAll('input[type="radio"][name="brand"]');
            let brandChecked = false; // A flag to keep track if any brand is checked
            for (const radio of brandRadioButtons) {
                if (radio.value === brandValue) {
                    radio.checked = true;
                    brandChecked = true; // Set the flag to true if any brand is checked
                }
            }

            // If no brand is checked in the URL, select "brand-all"
            if (!brandChecked) {
                const brandAllRadioButton = document.querySelector('input[type="radio"][name="brand"][value="all"]');
                brandAllRadioButton.checked = true;
            }

            // Set minprice input value
            if (minPriceValue) {
                document.getElementById('price-min').value = minPriceValue;
            }

            // Set maxprice input value
            if (maxPriceValue) {
                document.getElementById('price-max').value = maxPriceValue;
            }
        }

        // Call the function to check and set values on page load
        checkURLParameters();
    </script>
</html>
