<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <style>  /* Some basic styling for the blog list */

            h1 {
                color: #333;
                text-align: center;
            }
            .blog-list {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
            }
            .blog-item {
                width: 300px;
                margin: 20px;
                padding: 20px;
                border: 1px solid #ccc;
                text-align: center;
                height: 350px;
                justify-content: space-evenly;
            }
            .blog-item h2 {
                color: #333;
            }
            .blog-item p {
                color: #666;
            }

        </style>
        <title>Electro - HTML Ecommerce Template</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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

        <div class="store-filter clearfix" >
            <div style="background-color: #d1002412; padding: 10px; border-radius: 60px; margin-left: 50px; margin-right: 50px; margin-bottom: 50px" class="store-sort">
                <form style="display: flex; justify-content: space-around; align-items: center" action="blist" method="get">
                    <div><!-- comment -->
                        <label>                                                           
                            Sort By:
                            <select class="input-select" name="od" onchange="this.form.submit()">
                                <option value="0" <c:if test="${requestScope.order==0&&requestScope.order==null}">selected</c:if>>Latest</option>
                                <option value="1" <c:if test="${requestScope.order==1}">selected</c:if>>Name</option>
                                </select>
                            </label>

                            <label>
                                Category
                                <select class="input-select" name="cate" onchange="this.form.submit()">
                                    <option value="0" <c:if test="${requestScope.cate==0&&requestScope.cate==null}">selected</c:if>>All</option>
                                <option value="1" <c:if test="${requestScope.cate==1}">selected</c:if>>News</option>
                                <option value="2" <c:if test="${requestScope.cate==2}">selected</c:if>>Explore</option>
                                <option value="3" <c:if test="${requestScope.cate==3}">selected</c:if>> Reviews</option>
                                </select>
                            </label>
                        </div>
                        <style>
                            .search-container {
                                display: flex;
                                align-items: center;
                                width: 300px;
                                border: 1px solid #ccc;
                                border-radius: 10px;
                            }

                            .search-container input[type="text"] {
                                border: none;
                                outline: none;
                                width: 100%;
                                text-indent: 20px;
                                border-radius: 10px;
                                padding: 10px
                            }
                        </style>
                        <div class="search-container"><input type="Text" placeholder="Type here to search " name="kw" style=" border-radius: 10px; text-indent: 20px"></div>
                        <input type="Submit" style="visibility: hidden">
                        <div><!-- comment -->
                            <label>
                                Page:
                                <select class="input-select" name="page" onchange="this.form.submit()" >
                                    <option value="1" <c:if test="${requestScope.page==0&&requestScope.page==null &&requestScope.page>requestScope.pc}">selected</c:if>>1</option>
                                <c:forEach begin="2" end="${requestScope.pc}" var="i">
                                    <option value="${i}" <c:if test="${requestScope.page==i}">selected</c:if>>${i}</option>
                                </c:forEach>
                            </select>
                        </label>
                    </div>
                </form>
            </div>
        </div>
        <div class="blog-list"  id="contain">
            <c:forEach items="${requestScope.list}" var="b">

                <c:set var="shortDesc" value="${fn:substring(b.content, 0, 20)}" />
                <div class="blog-item" style="margin-top: 30px; margin-left: 30px">
                    <h4>${b.title}</h4>
                    <img src="${b.thumb}" alt="Image 1" style="width: 250px;height: 150px">
                    <p>${shortDesc}...</p>
                    <a style="font-size: small; color: red" href="blog?id=${b.id}">Read more <i class="fa fa-eye"></i></a>
                </div>
            </c:forEach>
        </div>

        <!-- NEWSLETTER -->
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
