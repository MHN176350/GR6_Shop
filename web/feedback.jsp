<%-- 
    Document   : newjsp
    Created on : Oct 20, 2023, 9:15:34 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<style>

</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <button id="openModalButton">Mở Modal</button>
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close" id="closeModalButton">&times;</span>
                <form class="review-form">
                    <!-- Nội dung biểu mẫu của bạn ở đây -->
                    <div class="col-md-3">
                        <div id="review-form">
                            <form class="review-form" >
                                <input class="input" id="name" type="text" placeholder="Your Name">
                                <input class="input" id="email" type="email" placeholder="Your Email">
                                <textarea class="input" placeholder="Your Review"></textarea>
                                <div class="input-rating">
                                    <span>Your Rating: </span>
                                    <div class="stars">
                                        <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                        <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                        <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                        <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                        <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                    </div>
                                </div>
                                <button class="primary-btn">Submit</button>
                            </form>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- Review Form -->
        <style>
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.7);
            }

            .modal-content {
                background-color: #fff;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 60%;
            }

            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
        <script>
            // Lấy tham chiếu đến modal và các nút
            var modal = document.getElementById("myModal");
            var openModalButton = document.getElementById("openModalButton");
            var closeModalButton = document.getElementById("closeModalButton");

            // Mở modal
            openModalButton.onclick = function () {
                modal.style.display = "block";
            }

            // Đóng modal
            closeModalButton.onclick = function () {
                modal.style.display = "none";
            }

            // Đóng modal nếu nền được nhấn
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>
    </body>
</html>