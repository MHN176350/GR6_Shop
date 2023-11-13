<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Electro - HTML Ecommerce Template</title>

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
            .blog-author {
                color: #999;
                text-align: center;
                margin-bottom: 20px;
            }
            .blur-text {
                color: transparent;
                text-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
            }
            h1 {
                color: #333;
                text-align: center;
            }
            .blog-thumbnail {
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }
            .blog-thumbnail img {
                max-width: 500px;
                height: auto;
            }
            .blog-content {
                text-align: justify;
                clear: both;
                text-align: left;
                margin-left: 200px;
                margin-right: 200px;
                font-size: 16px;

            }
        </style>
    </head>
    <body>
        <!-- HEADER -->
        <jsp:include page="header.jsp"></jsp:include>

        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li><a href="home">Home</a>
                        </li>
                        <li class="<%= (request.getParameter("category_id") != null && request.getParameter("category_id").equals("1")) ? "active" : ""%>">
                            <a href="http://localhost:9999/GR6_Shop/productfilter?category_id=1&minprice=1.00&maxprice=999.00&brand=all&sort=ASC&option=6&show=1">Laptops</a>
                        </li>
                        <li class="<%= (request.getParameter("category_id") != null && request.getParameter("category_id").equals("2")) ? "active" : ""%>">
                            <a href="http://localhost:9999/GR6_Shop/productfilter?category_id=2&minprice=1.00&maxprice=999.00&brand=all&sort=ASC&option=6&show=1">Smartphones</a>
                        </li>
                        <li class="<%= (request.getParameter("category_id") != null && request.getParameter("category_id").equals("3")) ? "active" : ""%>">
                            <a href="http://localhost:9999/GR6_Shop/productfilter?category_id=3&minprice=1.00&maxprice=999.00&brand=all&sort=ASC&option=6&show=1">Cameras</a>
                        </li>
                        <li class="active">
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
        <c:set value="${requestScope.blog}" var="b"/>

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->
        <div class="blog-container">
            <h1>${b.title}</h1>
            <div class="blog-author">
                <span >By ${requestScope.aut} &nbsp; /&nbsp; ${b.date} &nbsp;/&nbsp;   Category:${b.cate}</span>
            </div>
            <div class="blog-thumbnail">
                <img src="${b.thumb}" alt="Thumbnail">
            </div>

            <div class="blog-content">
                <p>${b.content}</p>
            </div>
        </div>
        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                            <form>
                                <input class="input" type="email" placeholder="Enter Your Email">
                                <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>
                            <ul class="newsletter-follow">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->

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
