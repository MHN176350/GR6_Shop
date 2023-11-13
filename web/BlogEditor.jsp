<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>EDIT BLOG - ELECTRO Shop</title>

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
        <style>
            .row {
                margin-bottom: 30px;
                margin-top: 30px;
            }

            .form-label {
                font-weight: bold;
            }

            .form-input {
                width: 100%;
                padding: 5px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .form-select {
                width: 100%;
                padding: 5px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .form-textarea {
                width: 100%;
                height: 200px;
                padding: 5px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .form-button {
                display: block;
                margin-top: 20px;
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                color: #fff;
                background-color: #337ab7;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            body{
                background-color: #fff !important
            }
        </style>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script src="ckeditor/ckeditor.js"></script>
    </head>
    <body>
        <!-- HEADER -->

        <jsp:include page="headeradmin.jsp"></jsp:include>
            <!-- NAVIGATION -->

            <!-- /NAVIGATION -->

            <!-- BREADCRUMB -->
            
            <!-- /BREADCRUMB -->

            <!-- SECTION -->
        <c:set value="${requestScope.tar}" var="b"/>
        
            <div class="section">
                <!-- container -->
                <div class="container">
                    <form method="post" action="bedit">
                        <input type="hidden" value="${b.id}" name="id">

                        <div class="row">
                            <label class="form-label">Blog Title:</label>
                            <input type="text" name="btit" value="${b.title}" class="form-input">
                        </div>

                        <div class="row">
                            <label class="form-label">Blog Type:</label>
                            <select name="cate" class="form-select">
                                <c:forEach items="${requestScope.cat}" var="i">
                                    <option value="${i.id}" <c:if test="${b.cate==i.name}">selected</c:if>>${i.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="row">
                            <label style="padding-right: 10px" class="form-label">Blog Thumb:</label>
                            <input type="file" name="imageFile" accept="image/*" onchange="previewImage(event)" />
                            <img id="image-preview" src="${b.thumb}" alt="images/images-welcome.jpg" style="margin-top: 20px; height: 250px;width: 400px">
                            <input type="hidden" id="thumb-img" name="thumb" value="${b.thumb}">
                        </div>
                        <script>

                            function previewImage(event) {
                                var input = event.target;
                                var reader = new FileReader();
                                var tn;
                                reader.onload = function () {
                                    var imagePreview = document.getElementById("image-preview");
                                    imagePreview.src = reader.result;

                                };

                                if (input.files && input.files[0]) {
                                    reader.readAsDataURL(input.files[0]);
                                }
                                tn = input.files[0].name;
                                var ele = document.getElementById("thumb-img");
                                ele.value = "images/" + tn;

                            }
                        </script>
                        <div class="row">
                            <label style="padding-right: 20px" class="form-label">Blog Content:</label>
                            <textarea name="content" class="form-textarea">${b.content}</textarea>
                        </div>

                        <div>${requestScope.mes}</div>

                        <button type="submit" class="form-button">Save</button>
                </div>
            </div>
            <script>
                CKEDITOR.replace('content');
            </script>
            <!-- /SECTION -->
        
        
        <!-- NEWSLETTER -->
        

    </body>
</html>



