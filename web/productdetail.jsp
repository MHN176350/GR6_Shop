<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Product - Electro Shop</title>

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
        <header>
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
                        <!-- Product main img -->
                        <div class="col-md-5 col-md-push-2">
                            <div id="product-main-img">
                                <div class="product-preview">
                                    <img src="${product.img}/../1.png" alt="">
                                </div>
                                <div class="product-preview">
                                    <img src="${product.img}/../2.png" alt="">
                                </div>
                                <div class="product-preview">
                                    <img src="${product.img}/../3.png" alt="">
                                </div><!-- comment -->
                                <div class="product-preview">
                                    <img src="${product.img}/../4.png" alt="">
                                </div><!-- comment -->
                                <div class="product-preview">
                                    <img src="${product.img}/../5.png" alt="">
                                </div>
                            </div>
                        </div>
                        <!-- /Product main img -->

                        <!-- Product thumb imgs -->
                        <div class="col-md-2  col-md-pull-5">
                            <div id="product-imgs">
                                <div class="product-preview">
                                    <img src="${product.img}/../1.png" alt="">
                                </div>
                                <div class="product-preview">
                                    <img src="${product.img}/../2.png" alt="">
                                </div>
                                <div class="product-preview">
                                    <img src="${product.img}/../3.png" alt="">
                                </div><!-- comment -->
                                <div class="product-preview">
                                    <img src="${product.img}/../4.png" alt="">
                                </div><!-- comment -->
                                <div class="product-preview">
                                    <img src="${product.img}/../5.png" alt="">
                                </div>
                            </div>
                        </div>
                        <!-- /Product thumb imgs -->
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

                        <!-- Product details -->
                        <div class="col-md-5">
                            <div class="product-details">
                                <h2 class="product-name">${product.name}</h2>
                                <div>
                                    <c:forEach var="i" begin="1" end="${fullStars}">    
                                        <i style="color: #D10024" class="fa fa-star"></i>
                                    </c:forEach> 
                                    <c:if test="${halfStar == 1}">
                                        <i class="fa fa-star-half-o" style="color: #D10024"></i>
                                    </c:if>
                                    <c:forEach var="i" begin="1" end="${5 - fullStars - halfStar}">
                                        <i style="color: #E4E7ED" class="fa fa-star-o"></i>
                                    </c:forEach>
                                    <span style="padding-left: 30px; font-size: small; color: #777; font-weight: 500"> ${sold} product(s) sold </span>
                                    <a style="padding-left: 20px"  class="review-link" href="productdetail?productid=${product.id}#tab3">${totalfb} Review(s) <c:if test="${check == true}"> | Add your review </c:if></a>

                                    </div>
                                    <div>
                                        <h3 class="product-price">$ <fmt:formatNumber value="${product.price * (1 - product.discount/100)}" type="number" maxFractionDigits="2" minIntegerDigits="2"/><del style="padding-left: 20px" class="product-old-price">$ ${product.price}</del></h3>
                                    <c:if test="${product.quantity != 0}">
                                        <span class="product-available">In Stock</span>
                                    </c:if>
                                </div>
                                <p>${product.description}</p>

                                <div class="add-to-cart">
                                    <c:choose>
                                        <c:when test="${product.quantity != 0}">
                                            <form action="addtocart" method="post">
                                                <div  class="qty-label">
                                                    <input type="hidden" name="pid" value="${product.id}"/>
                                                    Quantity: 
                                                    <div style="padding-left: 10px" class="input-number">
                                                        <input type="number" name="pre_quantity" value="1">
                                                        <span class="qty-up">+</span>
                                                        <span class="qty-down">-</span>
                                                    </div>
                                                </div>
                                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                            </form>
                                        </c:when>
                                        <c:otherwise>
                                            <button style="color: white; background-color: #777; border-color: #777" class="add-to-cart-btn"><i style="color: aliceblue" class="fa fa-exclamation-triangle"></i> out of stock</button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <c:if test="${w_check == false}">
                                    <ul class="product-btns">
                                        <li><a href="addtowishlist?pid=${product.id}"><i class="fa fa-heart-o"></i> add to wishlist</a></li>
                                    </ul>
                                </c:if>
                                <c:if test="${w_check == true}">
                                    <ul class="product-btns">
                                        <li><a style="color: #D10024" href="showwishlist"><i class="fa fa-heart"></i> added to wishlist</a></li>
                                    </ul>
                                </c:if>
                                <ul class="product-links">
                                    <li>Category:</li>
                                    <c:if test="${product.category_id == 1}"><li><a href="productlist?category_id=1">LAPTOP</a></li></c:if>
                                    <c:if test="${product.category_id == 2}"><li><a href="productlist?category_id=2">SMARTPHONE</a></li></c:if>
                                    <c:if test="${product.category_id == 3}"><li><a href="productlist?category_id=3">CAMERA</a></li></c:if>
                                    </ul>

                                    <ul class="product-links">
                                        <li>Share:</li>
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                        <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                                    </ul>

                                </div>
                            </div>
                            <!-- /Product details -->

                            <!-- Product tab -->
                            <div class="col-md-12">
                                <div id="product-tab">
                                    <!-- product tab nav -->
                                    <ul class="tab-nav">
                                        <li><a data-toggle="tab" href="#tab1">Description</a></li>
                                        <li><a data-toggle="tab" href="#tab2">Details</a></li>
                                        <li class="active"><a data-toggle="tab" href="#tab3">Reviews (${totalfb})</a></li>
                                </ul>

                                <!-- /product tab nav -->

                                <!-- product tab content -->
                                <div class="tab-content">
                                    <!-- tab1  -->
                                    <div id="tab1" class="tab-pane fade in">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p>${product.description}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /tab1  -->

                                    <!-- tab2  -->
                                    <div id="tab2" class="tab-pane fade in">
                                        <div class="row">
                                            <div style="padding-top: 20px; display: flex; justify-content: center; color: black; font-family: system-ui" class="col-md-12">
                                                <c:if test="${cate_id == 1}">
                                                    <table style="border: 3px double" border="1">
                                                        <tbody>
                                                            <tr>
                                                                <td>CPU</td>
                                                                <td>${ld.cpu}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>RAM</td>
                                                                <td>${ld.ram}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Hard Drive</td>
                                                                <td>${ld.hard_drive}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Card</td>
                                                                <td>${ld.card}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Screen</td>
                                                                <td>${ld.srceen}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Gate</td>
                                                                <td>
                                                                    <table border="0">
                                                                        <c:forEach var="gl" items="${gl}">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td>* ${gl}</td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </c:forEach>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Keyboard</td>
                                                                <td>${ld.keyboard}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Audio</td>
                                                                <td>${ld.audio}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Read memory card</td>
                                                                <td>${ld.read_memory_card}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>LAN</td>
                                                                <td>${ld.lan}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Wifi</td>
                                                                <td>${ld.wifi}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Bluetooth</td>
                                                                <td>${ld.bluetooth}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Webcam</td>
                                                                <td>${ld.webcam}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Os</td>
                                                                <td>${ld.os}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>PIN</td>
                                                                <td>${ld.pin}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Weigh</td>
                                                                <td>${ld.weigh}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Security</td>
                                                                <td>${ld.security}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Color</td>
                                                                <td>${ld.color}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Size</td>
                                                                <td>${ld.size}</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </c:if>
                                                <c:if test="${cate_id == 2}">
                                                    <table border="1">
                                                        <thead>
                                                            <tr>
                                                                <th>Monitor</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Screen technology</td>
                                                                <td>${sd.screen}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Resolution</td>
                                                                <td>${sd.resolution}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Widescreen</td>
                                                                <td>${sd.widescreen}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Maximum brightness</td>
                                                                <td>${sd.maximum_brightness}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Touch glass</td>
                                                                <td>${sd.touch_glass}</td>
                                                            </tr>
                                                        <thead>
                                                            <tr>
                                                                <th>Rear camera</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td>Resolution</td>
                                                            <td>${sd.resolution_cam}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Film</td>
                                                            <td>${sd.film}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Flash</td>
                                                            <td>${sd.flash}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Feature</td>
                                                            <td>
                                                                <table border="0">
                                                                    <c:forEach var="ff" items="${ff}">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>* ${ff}</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </c:forEach>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <thead>
                                                            <tr>
                                                                <th>Front camera</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td>Resolution</td>
                                                            <td>${sd.resolution_front_cam}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Feature</td>
                                                            <td>
                                                                <table border="0">
                                                                    <c:forEach var="ffc" items="${ffc}">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>* ${ffc}</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </c:forEach>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <thead>
                                                            <tr>
                                                                <th>Operating System & CPU</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td>Operating System</td>
                                                            <td>${sd.operating_system}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Processor chip (CPU)</td>
                                                            <td>${sd.cpu}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>CPU Speed</td>
                                                            <td>${sd.cpu_speed}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Graphics chip (GPU)</td>
                                                            <td>${sd.gpu}</td>
                                                        </tr>
                                                        <thead>
                                                            <tr>
                                                                <th>Memory & Storage</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td>RAM</td>
                                                            <td>${sd.ram}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Storage capacity</td>
                                                            <td>${sd.storage_capacity}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Contacts</td>
                                                            <td>${sd.contacts}</td>
                                                        </tr>
                                                        <thead>
                                                            <tr>
                                                                <th>Connect</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td>Mobile networks</td>
                                                            <td>${sd.mobile_networks}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>SIM</td>
                                                            <td>${sd.sim}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Wifi</td>
                                                            <td>${sd.wifi}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>GPS</td>
                                                            <td>${sd.gps}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Bluetooth</td>
                                                            <td>${sd.bluetooth}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Connection/charging port</td>
                                                            <td>${sd.conection}</td>
                                                        </tr>
                                                        <thead>
                                                            <tr>
                                                                <th>Battery & Charging</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td>Battery capacity</td>
                                                            <td>${sd.battery}</td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </c:if>
                                                <c:if test="${cate_id == 3}">
                                                    <table border="1">
                                                        <tbody>
                                                            <tr>
                                                                <td>CPU</td>
                                                                <td>3</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /tab2  -->
                                    <style>
                                        table {
                                            background-color: #99999914!important
                                        }
                                        td{
                                            padding: 8px !important
                                        }
                                    </style>
                                    <!-- tab3  -->
                                    <div id="tab3" class="tab-pane fade in active">
                                        <div style="padding-bottom: 1px"></div>
                                        <div style="display: flex; justify-content: space-around; padding: 13px; border-radius: 18px; background-color: #ff00000f; margin-bottom: 40px; margin-left: 40px; margin-right: 40px; margin-top: 20px" class="allstar">

                                            <div class="eachstar">
                                                <input type="radio" id="fStar-all" name="fStar" value="0" onclick="handleRadioClick(this)" checked="">
                                                <label for="fStar-all"">
                                                    <span>All</span>
                                                </label>
                                            </div>

                                            <div class="eachstar">
                                                <input type="radio" <c:if test="${current_star == 5}"> checked=""</c:if> id="fStar-5" name="fStar" value="5" onclick="handleRadioClick(this)">
                                                    <label for="fStar-5"">
                                                        <span></span>
                                                        5 <i class=" fa fa-star" style="color:#D10024"></i> 
                                                    </label>
                                                </div>

                                                <div class="eachstar">
                                                    <input type="radio" <c:if test="${current_star == 4}"> checked=""</c:if> id="fStar-4" name="fStar" value="4" onclick="handleRadioClick(this)">
                                                    <label for="fStar-4"">
                                                        <span></span>
                                                        4 <i class=" fa fa-star" style="color:#D10024"></i>
                                                    </label>
                                                </div>

                                                <div class="eachstar">
                                                    <input type="radio" <c:if test="${current_star == 3}"> checked=""</c:if> id="fStar-3" name="fStar" value="3" onclick="handleRadioClick(this)">
                                                    <label for="fStar-3"">
                                                        <span></span>
                                                        3 <i class=" fa fa-star" style="color:#D10024"></i>
                                                    </label>
                                                </div>

                                                <div class="eachstar">
                                                    <input type="radio" <c:if test="${current_star == 2}"> checked=""</c:if> id="fStar-2" name="fStar" value="2" onclick="handleRadioClick(this)">
                                                    <label for="fStar-2"">
                                                        <span></span>
                                                        2 <i class=" fa fa-star" style="color:#D10024"></i>
                                                    </label>
                                                </div>

                                                <div class="eachstar">
                                                    <input type="radio" <c:if test="${current_star == 1}"> checked=""</c:if> id="fStar-1" name="fStar" value="1" onclick="handleRadioClick(this)">
                                                    <label for="fStar-1"">
                                                        <span></span>
                                                        1 <i class=" fa fa-star" style="color:#D10024"></i>
                                                    </label>
                                                </div>
                                                <script>
                                                    function handleRadioClick(radioButton) {
                                                        const value = radioButton.value;
                                                        const destinationURL = linkMapping[value];
                                                        if (destinationURL) {
                                                            window.location.href = destinationURL;
                                                        }
                                                    }
                                                    const linkMapping = {
                                                        '0': 'productdetail?productid=${product.id}#tab3',
                                                        '1': 'feedbackfilter?productid=${product.id}&star=1#tab3',
                                                        '2': 'feedbackfilter?productid=${product.id}&star=2#tab3',
                                                        '3': 'feedbackfilter?productid=${product.id}&star=3#tab3',
                                                        '4': 'feedbackfilter?productid=${product.id}&star=4#tab3',
                                                        '5': 'feedbackfilter?productid=${product.id}&star=5#tab3'
                                                    };
                                            </script>
                                        </div>

                                        <div class="row">
                                            <!-- Rating -->
                                            <div class="col-md-3">
                                                <div id="rating">

                                                    <div class="rating-avg">
                                                        <span><fmt:formatNumber type="number"  pattern="#,##0.0" value="${avg_star}"/></span>
                                                        <div class="rating-stars">
                                                            <c:forEach var="i" begin="1" end="${fullStars}">
                                                                <i class="fa fa-star"></i>
                                                            </c:forEach> 
                                                            <c:if test="${halfStar == 1}">
                                                                <i class="fa fa-star-half-o" style="color: #D10024"></i>
                                                            </c:if>
                                                            <c:forEach var="i" begin="1" end="${5 - fullStars - halfStar}">
                                                                <i class="fa fa-star-o"></i>
                                                            </c:forEach>
                                                        </div>
                                                    </div>

                                                    <ul class="rating">
                                                        <li>
                                                            <div class="rating-stars">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                            <c:forEach items="${list}" var="value" varStatus="loop">
                                                                <c:if test="${loop.index == 4}">
                                                                    <div class="rating-progress">
                                                                        <div style="width: ${value / totalfb * 100}%;"></div>
                                                                    </div>
                                                                    <span class="sum">${value}</span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </li>
                                                        <li>
                                                            <div class="rating-stars">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o"></i>
                                                            </div>
                                                            <c:forEach items="${list}" var="value" varStatus="loop">
                                                                <c:if test="${loop.index == 3}">
                                                                    <div class="rating-progress">
                                                                        <div style="width: ${value / totalfb * 100}%;"></div>
                                                                    </div>
                                                                    <span class="sum">${value}</span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </li>
                                                        <li>
                                                            <div class="rating-stars">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                            </div>
                                                            <c:forEach items="${list}" var="value" varStatus="loop">
                                                                <c:if test="${loop.index == 2}">
                                                                    <div class="rating-progress">
                                                                        <div style="width: ${value / totalfb * 100}%;"></div>
                                                                    </div>
                                                                    <span class="sum">${value}</span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </li>
                                                        <li>
                                                            <div class="rating-stars">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                            </div>
                                                            <c:forEach items="${list}" var="value" varStatus="loop">
                                                                <c:if test="${loop.index == 1}">
                                                                    <div class="rating-progress">
                                                                        <div style="width: ${value / totalfb * 100}%;"></div>
                                                                    </div>
                                                                    <span class="sum">${value}</span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </li>
                                                        <li>
                                                            <div class="rating-stars">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                            </div>
                                                            <c:forEach items="${list}" var="value" varStatus="loop">
                                                                <c:if test="${loop.index == 0}">
                                                                    <div class="rating-progress">
                                                                        <div style="width: ${value / totalfb * 100}%;"></div>
                                                                    </div>
                                                                    <span class="sum">${value}</span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!-- /Rating -->

                                            <!-- Reviews -->
                                            <div class="col-md-6">
                                                <div id="reviews">
                                                    <ul class="reviews">
                                                        <c:forEach items="${fb}" var="fb">
                                                            <li>
                                                                <div class="review-heading">
                                                                    <c:choose>
                                                                        <c:when test="${fb.user_id == sessionScope.USER.id}">
                                                                            <h5 class="name">${fb.name}<a href="feedback?f_id=${fb.f_id}&pid=${fb.p_id}"><i style="padding-left: 7px; color: #a94442"class="fa fa-trash-o"></i></a></h5>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                            <h5 class="name">${fb.name}</h5>
                                                                        </c:otherwise>
                                                                    </c:choose>

                                                                    <p class="date">${fb.issue_date}</p>
                                                                    <div class="review-rating">
                                                                        <c:forEach var="i" begin="1" end="${fb.star}" >
                                                                            <i class="fa fa-star"></i>
                                                                        </c:forEach> 
                                                                        <c:forEach var="i" begin="1" end="${5-fb.star}" >
                                                                            <i class="fa fa-star-o"></i>
                                                                        </c:forEach>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <p style="max-width: 95%">${fb.comment}</p>
                                                                </div>
                                                                <div><img style="max-height: 70px" src="images/${fb.img}" onclick="openPopup(this)" /></div>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                    <div id="imagePopup" class="popup">
                                                        <span class="close" onclick="closePopup()">&times;</span>
                                                        <img src="" alt="">
                                                    </div>      
                                                    <style>
                                                        .popup {
                                                            display: none;
                                                            position: fixed;
                                                            top: 50%;
                                                            left: 50%;
                                                            transform: translate(-50%, -50%);
                                                            width: 60%;
                                                            height: 60%;
                                                            background-color: #616b7e61;
                                                            z-index: 1;
                                                            text-align: center;
                                                            overflow: auto;

                                                        }

                                                        .popup img {
                                                            max-width: 100%;
                                                            max-height: 100%;
                                                            margin: auto;
                                                            display: block;
                                                        }

                                                        .close {
                                                            position: absolute;
                                                            top: 10px;
                                                            right: 10px;
                                                            font-size: 21px;
                                                            color: #fff;
                                                            cursor: pointer;
                                                        }

                                                        .thumbnail {
                                                            display: inline-block;
                                                        }
                                                        .aside {
                                                            margin-top: -20px;
                                                            margin-bottom: 20px;
                                                            display: block;
                                                        }
                                                    </style>
                                                    <script>
                                                        function openPopup(imgElement) {
                                                            const imagePopup = document.getElementById("imagePopup");
                                                            const fullSizeImage = imagePopup.getElementsByTagName("img")[0];
                                                            fullSizeImage.src = imgElement.src;
                                                            imagePopup.style.display = "block";

                                                            // B?t s? ki?n khi ng??i dùng b?m ra ngoài n?n trang
                                                            window.onclick = function (event) {
                                                                if (event.target === imagePopup) {
                                                                    closePopup();
                                                                }
                                                            };
                                                        }

                                                        function closePopup() {
                                                            document.getElementById("imagePopup").style.display = "none";
                                                            window.onclick = null;
                                                        }
                                                    </script>

                                                    <c:if test="${f_check == -1}">
                                                        <ul style="padding-top: 30px; display: flex; justify-content: center" class="reviews-pagination" class="reviews-pagination">
                                                            <c:forEach begin="1" end="${endPage}" var="i">
                                                                <li <c:if test="${i == current}">class="active"</c:if>>
                                                                    <a href="productdetail?productid=${product.id}&index=${i}#tab3">${i}</a>
                                                                </li>
                                                                <c:if test="${i == current}">
                                                                    <c:set var="currentValue" value="${i}" />
                                                                </c:if>
                                                            </c:forEach>

                                                            <c:if test="${currentValue < endPage}">
                                                                <li><a href="productdetail?productid=${product.id}&index=${currentValue + 1}#tab3"><i class="fa fa-angle-right"></i></a></li>
                                                                    </c:if>
                                                            <div style="padding: 10px; font-size: small; font-style: italic">  Total ${totalfb} comment(s) .</div>
                                                        </ul>
                                                    </c:if>

                                                    <c:if test="${f_check == 1}">
                                                        <ul style="padding-top: 30px; display: flex; justify-content: center" class="reviews-pagination">
                                                            <c:forEach begin="1" end="${endPage}" var="i">
                                                                <li <c:if test="${i == current}">class="active"</c:if>>
                                                                    <a href="feedbackfilter?productid=${product.id}&index=${i}&star=${current_star}#tab3">${i}</a>
                                                                </li>
                                                                <c:if test="${i == current}">
                                                                    <c:set var="currentValue" value="${i}" />
                                                                </c:if>
                                                            </c:forEach>

                                                            <c:if test="${currentValue < endPage}">
                                                                <li><a href="feedbackfilter?productid=${product.id}&index=${currentValue + 1}&star=${current_star}#tab3"><i class="fa fa-angle-right"></i></a></li>
                                                                    </c:if>
                                                            <div style="padding: 10px; font-size: small; font-style: italic"> Filter by ${current_star} star's vote.</div>
                                                        </ul>
                                                    </c:if>
                                                </div>
                                            </div>

                                            <!-- /Reviews -->
                                            <c:if test="${check == true}">
                                                <!-- Review Form -->
                                                <div class="col-md-3">
                                                    <div id="review-form">
                                                        <form action="feedback" method="post" enctype="multipart/form-data" class="review-form">
                                                            <input type="hidden" name="pid" value="${product.id}">
                                                            <div class="input-rating">
                                                                <span>Your Rating: </span>
                                                                <div class="stars">
                                                                    <input id="star5" name="rating" value="5" type="radio" required=""><label for="star5"></label>
                                                                    <input id="star4" name="rating" value="4" type="radio" required=""><label for="star4"></label>
                                                                    <input id="star3" name="rating" value="3" type="radio" required=""><label for="star3"></label>
                                                                    <input id="star2" name="rating" value="2" type="radio" required=""><label for="star2"></label>
                                                                    <input id="star1" name="rating" value="1" type="radio" required=""><label for="star1"></label>
                                                                </div>
                                                            </div>
                                                            <textarea style="border:2px solid #a94442; font-size: smaller" name="comment" class="input" placeholder="Review here (Max 150 characters)" maxlength="150"></textarea>
                                                            <div>
                                                                <div style="padding-bottom: 20px"><input style="color: red" name="image" type="file" id="fileInput"></div>
                                                                <div style="padding-bottom: 15px" id="imagePreview"></div>
                                                            </div>
                                                            <script>
                                                                const fileInput = document.getElementById('fileInput');
                                                                const imagePreview = document.getElementById('imagePreview');

                                                                fileInput.addEventListener('change', function () {
                                                                    const file = fileInput.files[0];
                                                                    if (file) {

                                                                        const maxSizeInBytes = 2560 * 2560;
                                                                        if (file.size <= maxSizeInBytes) {
                                                                            const reader = new FileReader();
                                                                            reader.onload = function (e) {
                                                                                const img = new Image();
                                                                                img.src = e.target.result;
                                                                                img.style.maxWidth = '80px';
                                                                                imagePreview.innerHTML = '';
                                                                                imagePreview.appendChild(img);
                                                                            };
                                                                            reader.readAsDataURL(file);
                                                                        } else {
                                                                            alert("File is too large. Please choose a file smaller than or equal to 5MB.");

                                                                            fileInput.value = '';
                                                                        }
                                                                    }
                                                                });
                                                            </script>

                                                            <div style="display: grid"><button class="primary-btn">Submit</button></div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <!-- /Review Form -->
                                            </c:if>
                                        </div>
                                    </div>
                                    <!-- /tab3  -->
                                </div>
                                <!-- /product tab content  -->
                            </div>
                        </div>
                        <!-- /product tab -->
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /SECTION -->


            <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
