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
        
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> (+84) 914205986</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> electroshopfpt@gmail.com</a></li>
                        <li><a href="https://www.google.com/maps/@21.0138275,105.5254008,16z?hl=vi-VN&entry=ttu"><i class="fa fa-map-marker"></i> FPT-University, ThachThat, HaNoi</a></li>
                    </ul>
                    <ul class="header-links pull-right">

                        <c:if test="${sessionScope.USER == null}">
                            <li><a href="login.jsp"><i class="fa fa-user-o"></i> Login </a></li>
                            <li><a href="signup.jsp"><i class="fa fa-user-plus"></i> Sign Up </a></li>
                            </c:if>

                        <c:if test="${sessionScope.USER != null}">
                            <li><a href="profile.jsp"><i class="fa fa-user-o"></i>${sessionScope.USER.firstName} ${sessionScope.USER.lastName}  </a></li>
                            <li><a href="logout"><i class="fa fa-sign-out"></i> Log Out </a></li>
                            </c:if>

                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="home" class="logo">
                                    <img src="./img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form method="GET" action="productfilter">
                                    <select class="input-select" name="category_id" id="optionSelect3">
                                        <option value="all">All Categories</option>
                                        <option value="1">Laptop</option>
                                        <option value="2">Smartphone</option>
                                        <option value="3">Camera</option>
                                    </select>
                                    <input name="minprice" type="hidden" value="1.00">
                                    <input name="maxprice" type="hidden" value="999.00">
                                    <input name="brand" type="hidden" value="all">
                                    <input name="sort" type="hidden" value="ASC">
                                    <input name="option" type="hidden" value="6">
                                    <input name="show" type="hidden" value="1">
                                    <input class="input" placeholder="Search here" name="productName" value="${param.productName}">
                                    <button class="search-btn">Search</button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Wishlist -->
                                <c:if test="${sessionScope.USER != null}">
                                    <div>
                                        <a href="showwishlist">
                                            <i class="fa fa-heart-o"></i>
                                            <span>Your Wishlist</span>
                                            <c:if test="${sessionScope.count_wl != null}">
                                                <%
                                                    int itemCount1 = Integer.valueOf(session.getAttribute("count_wl").toString());
                                                %>
                                                <div class="qty"><%=itemCount1%></div>
                                            </c:if>
                                            <c:if test="${sessionScope.count_wl == null}">
                                                <div class="qty">0</div>
                                            </c:if>
                                        </a>
                                    </div>
                                </c:if>

                                <div>
                                    <c:if test="${sessionScope.USER == null}">
                                        <a href="login.jsp">
                                            <i class="fa fa-heart-o"></i>
                                            <span>Your Wishlist</span>
                                        </a>
                                    </c:if>
                                </div>
                                <!-- /Wishlist -->

                                <!-- Cart -->
                                <div class="dropdown">
                                    <c:if test="${sessionScope.USER != null}">
                                        <a href="viewcart.jsp">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span>Your Cart</span>
                                            <c:if test="${sessionScope.cart != null}">
                                                <%
                                                    int itemCount = Integer.valueOf(session.getAttribute("itemCount").toString());
                                                %>
                                                <div class="qty"><%=itemCount%></div>
                                            </c:if>
                                            <c:if test="${sessionScope.cart == null}" >
                                                <div class="qty">0</div>
                                            </c:if>
                                        </a>
                                    </c:if>

                                    <c:if test="${sessionScope.USER == null}">
                                        <a href="login.jsp">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span>Your Cart</span>
                                        </a>
                                    </c:if>
                                </div>
                                <!-- /Cart -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <!-- NAVIGATION -->

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
