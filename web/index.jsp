<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Electro Shop </title>

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

    </head>
    <body>
        <!-- HEADER -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- /HEADER -->

            <!-- NAVIGATION -->
            <nav id="navigation">
                <!-- container -->
                <div class="container">
                    <!-- responsive-nav -->
                    <div id="responsive-nav">
                        <!-- NAV -->
                        <ul class="main-nav nav navbar-nav">
                            <li class="active"><a href="home">Home</a></li>
                            <li class="<%= (request.getParameter("category_id") != null && request.getParameter("category_id").equals("1")) ? "active" : ""%>">
                            <a href="http://localhost:9999/GR6_Shop/productfilter?category_id=1&minprice=1.00&maxprice=999.00&brand=all&sort=ASC&option=6&show=1">Laptops</a>
                        </li>
                        <li class="<%= (request.getParameter("category_id") != null && request.getParameter("category_id").equals("2")) ? "active" : ""%>">
                            <a href="http://localhost:9999/GR6_Shop/productfilter?category_id=2&minprice=1.00&maxprice=999.00&brand=all&sort=ASC&option=6&show=1">Smartphones</a>
                        </li>
                        <li class="<%= (request.getParameter("category_id") != null && request.getParameter("category_id").equals("3")) ? "active" : ""%>">
                            <a href="http://localhost:9999/GR6_Shop/productfilter?category_id=3&minprice=1.00&maxprice=999.00&brand=all&sort=ASC&option=6&show=1">Cameras</a>
                        </li >
                        <li class="<%= (request.getParameter("blist") != null) ? "active" : ""%>">
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
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/shop01.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Laptop<br>Collection</h3>
                                <a href="http://localhost:9999/GR6_Shop/productfilter?category_id=1&minprice=1.00&maxprice=999.00&brand=all&sort=ASC&option=6&show=1" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="img/iphonehehe.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Smartphone<br>Collection</h3>
                                <a href="http://localhost:9999/GR6_Shop/productfilter?category_id=2&minprice=1.00&maxprice=999.00&brand=all&sort=ASC&option=6&show=1" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/shop02.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Cameras<br>Collection</h3>
                                <a href="http://localhost:9999/GR6_Shop/productfilter?category_id=3&minprice=1.00&maxprice=999.00&brand=all&sort=ASC&option=6&show=1" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">New Products</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
                                    <li class="active"><a data-toggle="tab" href="#tab1">Laptops</a></li>
                                    <li><a data-toggle="tab" href="#tab2">Smartphones</a></li>
                                    <li><a data-toggle="tab" href="#tab3">Cameras</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <!-- product -->
                                        <c:forEach items="${listNewLap}" var="l">
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
                                                            $<fmt:formatNumber value="${l.price * (1 - l.discount/100)}" type="number" maxFractionDigits="2" minIntegerDigits="2"/>
                                                            <c:if test="${l.discount != 0}">
                                                                <del class="product-old-price">$${l.price}</del>
                                                            </c:if>
                                                        </h4>
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <a href="addtocart?pid=${l.id}" class="custom-button">
                                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /product -->
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                                <!-- tab2 -->
                                <div id="tab2" class="tab-pane">
                                    <div class="products-slick" data-nav="#slick-nav-2">
                                        <!-- product -->
                                        <c:forEach items="${listNewPhone}" var="l">
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
                                                            $<fmt:formatNumber value="${l.price * (1 - l.discount/100)}" type="number" maxFractionDigits="2" minIntegerDigits="2"/>
                                                            <c:if test="${l.discount != 0}">
                                                                <del class="product-old-price">$${l.price}</del>
                                                            </c:if>
                                                        </h4>
                                                        
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <a href="addtocart?pid=${l.id}" class="custom-button">
                                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /product -->
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab2 -->
                                <!-- tab3 -->
                                <div id="tab3" class="tab-pane">
                                    <div class="products-slick" data-nav="#slick-nav-3">
                                        <!-- product -->
                                        <c:forEach items="${listNewCam}" var="l">
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
                                                            $<fmt:formatNumber value="${l.price * (1 - l.discount/100)}" type="number" maxFractionDigits="2" minIntegerDigits="2"/>
                                                            <c:if test="${l.discount != 0}">
                                                                <del class="product-old-price">$${l.price}</del>
                                                            </c:if>
                                                        </h4>
                                                        
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <a href="addtocart?pid=${l.id}" class="custom-button">
                                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /product -->
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-3" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab3 -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->
        <div id="hot-deal" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <ul class="hot-deal-countdown">
                                <li>
                                    <div>
                                        <h3>V</h3>
                                        
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>I</h3>
                                        
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>S</h3>
                                        
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>I</h3>
                                        
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>T</h3>
                                        
                                    </div>
                                </li>
                                
                            </ul>
                            <h2 class="text-uppercase">hot deal this week</h2>
                            <p>New Collection Up to ${deal_pid.discount}% OFF</p>
                            <a class="primary-btn cta-btn" href="productdetail?productid=${deal_pid.id}">Shop now </a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Hot Selling</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
                                    <li class="active"><a data-toggle="tab" href="#tab4">Laptops</a></li>
                                    <li><a data-toggle="tab" href="#tab5">Smartphones</a></li>
                                    <li><a data-toggle="tab" href="#tab6">Cameras</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab4" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-4">
                                        <!-- product -->
                                        <c:forEach items="${listHotLap}" var="l">
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
                                                            $<fmt:formatNumber value="${l.price * (1 - l.discount/100)}" type="number" maxFractionDigits="2" minIntegerDigits="2"/>
                                                            <c:if test="${l.discount != 0}">
                                                                <del class="product-old-price">$${l.price}</del>
                                                            </c:if>
                                                        </h4>
                                                        
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <a href="addtocart?pid=${l.id}" class="custom-button">
                                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /product -->
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-4" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                                <!-- tab2 -->
                                <div id="tab5" class="tab-pane">
                                    <div class="products-slick" data-nav="#slick-nav-5">
                                        <!-- product -->
                                        <c:forEach items="${listHotPhone}" var="l">
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
                                                            $<fmt:formatNumber value="${l.price * (1 - l.discount/100)}" type="number" maxFractionDigits="2" minIntegerDigits="2"/>
                                                            <c:if test="${l.discount != 0}">
                                                                <del class="product-old-price">$${l.price}</del>
                                                            </c:if>
                                                        </h4>
                                                        
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <a href="addtocart?pid=${l.id}" class="custom-button">
                                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /product -->
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-5" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab5 -->
                                <!-- tab6 -->
                                <div id="tab6" class="tab-pane">
                                    <div class="products-slick" data-nav="#slick-nav-6">
                                        <!-- product -->
                                        <c:forEach items="${listHotCam}" var="l">
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
                                                            $<fmt:formatNumber value="${l.price * (1 - l.discount/100)}" type="number" maxFractionDigits="2" minIntegerDigits="2"/>
                                                            <c:if test="${l.discount != 0}">
                                                                <del class="product-old-price">$${l.price}</del>
                                                            </c:if>
                                                        </h4>
                                                        
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <a href="addtocart?pid=${l.id}" class="custom-button">
                                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /product -->
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-6" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab9 -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Big Deals</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
                                    <li class="active"><a data-toggle="tab" href="#tab7">Laptops</a></li>
                                    <li><a data-toggle="tab" href="#tab8">Smartphones</a></li>
                                    <li><a data-toggle="tab" href="#tab9">Cameras</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab7" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-7">
                                        <!-- product -->
                                        <c:forEach items="${listDealLap}" var="l">
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
                                                            $<fmt:formatNumber value="${l.price * (1 - l.discount/100)}" type="number" maxFractionDigits="2" minIntegerDigits="2"/>
                                                            <c:if test="${l.discount != 0}">
                                                                <del class="product-old-price">$${l.price}</del>
                                                            </c:if>
                                                        </h4>
                                                        
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <a href="addtocart?pid=${l.id}" class="custom-button">
                                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /product -->
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-7" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                                <!-- tab2 -->
                                <div id="tab8" class="tab-pane">
                                    <div class="products-slick" data-nav="#slick-nav-8">
                                        <!-- product -->
                                        <c:forEach items="${listDealPhone}" var="l">
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
                                                            $<fmt:formatNumber value="${l.price * (1 - l.discount/100)}" type="number" maxFractionDigits="2" minIntegerDigits="2"/>
                                                            <c:if test="${l.discount != 0}">
                                                                <del class="product-old-price">$${l.price}</del>
                                                            </c:if>
                                                        </h4>
                                                        
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <a href="addtocart?pid=${l.id}" class="custom-button">
                                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /product -->
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-8" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab2 -->
                                <!-- tab9 -->
                                <div id="tab9" class="tab-pane">
                                    <div class="products-slick" data-nav="#slick-nav-9">
                                        <!-- product -->
                                        <c:forEach items="${listDealCam}" var="l">
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
                                                            $<fmt:formatNumber value="${l.price * (1 - l.discount/100)}" type="number" maxFractionDigits="2" minIntegerDigits="2"/>
                                                            <c:if test="${l.discount != 0}">
                                                                <del class="product-old-price">$${l.price}</del>
                                                            </c:if>
                                                        </h4>
                                                        
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <a href="addtocart?pid=${l.id}" class="custom-button">
                                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /product -->
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-9" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab9 -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- FOOTER -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
