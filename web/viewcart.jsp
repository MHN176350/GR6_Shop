<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Shopping Cart - Electro Shop</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>


        <style>
            ::-webkit-scrollbar {
                width: 8px;
            }


            /* Track */
            ::-webkit-scrollbar-track {
                background: #f1f1f1;
            }

            /* Handle */
            ::-webkit-scrollbar-thumb {
                background: #888;
            }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #555;
            }

            body {
                background-image: url('images/background.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
                min-height: 100vh;
                vertical-align: middle;
                display: flex;
                font-family: sans-serif;
                font-size: 0.8rem;
                font-weight: bold;
            }

            .title {
                margin-bottom: 3vh;
            }
            .text-muted {
                color: #ffc107!important;
            }

            .card {
                margin: auto;
                max-width: 950px;
                width: 90%;
                box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                border-radius: 1rem;
                border: transparent;
                background-color: rgba(255, 255, 255, 0.2);
            }

            @media(max-width:767px) {
                .card {
                    margin: 3vh auto;
                }
            }
            .text-muted {
                color: #ff0000!important;
                font-size: inherit;
            }
            .cart {
                background-color: #00000096;
                padding: 4vh 5vh;
                border-bottom-left-radius: 1rem;
                border-top-left-radius: 1rem;
                color: white;
            }

            @media(max-width:767px) {
                .cart {
                    padding: 4vh;
                    border-bottom-left-radius: unset;
                    border-top-right-radius: 1rem;
                }
            }

            .summary {
                background-color: #e70b0b96;
                border-top-right-radius: 1rem;
                border-bottom-right-radius: 1rem;
                padding: 4vh;
                color: white;
            }

            @media(max-width:767px) {
                .summary {
                    border-top-right-radius: unset;
                    border-bottom-left-radius: 1rem;
                }
            }

            .summary .col-2 {
                padding: 0;
            }

            .summary .col-10 {
                padding: 0;
            }

            .row {
                margin: 0;
            }

            .title b {
                font-size: 1.5rem;
            }

            .main {
                margin: 0;
                padding: 2vh 0;
                width: 100%;
            }

            .col-2,
            .col {
                padding: 0 1vh;
            }

            a {
                padding: 0 1vh;

            }

            .close {
                margin-left: auto;
                font-size: 0.7rem;
            }

            img {
                width: 5.5rem;
            }

            .back-to-shop {
                margin-top: 4.5rem;
            }

            h5 {
                margin-top: 4vh;
            }

            hr {
                margin-top: 1.25rem;
            }

            form {
                padding: 2vh 0;
            }

            select {
                border: 1px solid rgba(0, 0, 0, 0.137);
                padding: 1.5vh 1vh;
                margin-bottom: 4vh;
                outline: none;
                width: 100%;
                background-color: rgb(247, 247, 247);
            }

            input:focus::-webkit-input-placeholder {
                color: transparent;
            }

            .btn {
                background-color: #574949;
                border-color: #000;
                color: white;
                font-size: 0.7rem;
                margin-top: 4vh;
                padding: 1vh;
                border-radius: 10px;
            }

            .btn:focus {
                box-shadow: none;
                outline: none;
                box-shadow: none;
                color: white;
                -webkit-box-shadow: none;
                -webkit-user-select: none;
                transition: none;
            }

            .btn:hover {
                color: white;
            }

            a {
                color: #fff;
            }

            a:hover {
                color: black;
                text-decoration: none;
            }

            #code {
                background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253), rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
                background-repeat: no-repeat;
                background-position-x: 95%;
                background-position-y: center;
            }
            .back-to-shop {
                margin-top: 170px;
            }
            label {
                display: inline-block;
                margin-bottom: 0rem;
            }
            form {
                padding: 0vh 0;
            }
            .refresh-button {
                border: none;
                background: transparent;
                color: wheat;
                padding: 0;
                outline: none;
            }
            .col2 {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
        </style>
    </head>
    <body className='snippet-body'>
        <div class="card">
            <div class="row">
                <div class="col-md-12 cart">
                    <div class="title">
                        <div class="row">
                            <div class="col">
                                <h4><b><i class="fa fa-shopping-cart" style="font-size:48px;color:red"></i> Shopping Cart </b></h4> 

                            </div>
                            <div style="padding-top: 60px; padding-left: 40px; font-size: medium; font-family: cursive; color: wheat;" class="col ">${message}</div>
                            <div class="col align-self-center text-right text-muted">
                                <c:set var="itemCount" value="0"/>
                                <c:forEach items="${sessionScope.cart.item}" var="item">
                                    <c:set var="itemCount" value="${itemCount + 1}" />
                                </c:forEach>
                                ${itemCount} Item(s)
                            </div>

                        </div>
                    </div>
                    <c:set var="itemCount" value="${itemCount}" scope="session"/>
                    <c:if test="${itemCount ==0}">
                        <h4 style="padding-left: 350px">Your cart is emty ! </h4>
                    </c:if>
                    <c:forEach items="${sessionScope.cart.item}" var="item">
                        <c:set var="total" value="${item.product.price *(100 - item.product.discount)/100 * item.quantity}"/>
                        <c:set var="purchase" value="${purchase + total}"/>
                        <form action="updatecart" method="post">
                            <div class="row border-top border-bottom">
                                <div class="row main align-items-center">
                                    <div class="col-2"><img class="img-fluid" src="${item.product.img}"></div>
                                    <div class="col">
                                        <c:if test="${item.product.category_id == 1}"><div class="row text-muted"> LAPTOP </div></c:if>
                                        <c:if test="${item.product.category_id == 2}"><div class="row text-muted"> SMARTPHONE </div></c:if>
                                        <c:if test="${item.product.category_id == 3}"><div class="row text-muted"> CAMERA </div></c:if>
                                        <div style="padding-top: 5px" class="row">${item.product.name}</div>
                                    </div>
                                    <div style="padding-left: 35px" class="col">&dollar; <fmt:formatNumber type="number" pattern="#,##0.00" value="${item.product.price *(100 - item.product.discount)/100}"/></div>
                                    <div class="col" style="color: #ff0b22">${item.product.quantity} left(s)  </div>
                                    <div class="col">
                                        <label>
                                            <input
                                                style="border: 1px solid #fff; padding: 0.6vh; outline: none; width: 100%; background-color: transparent; text-align: center; color: white;"
                                                type="number"
                                                min="1"
                                                max="200"
                                                name="quantity"
                                                data-id="makeshop-common-cart-quantity:000000000642-0-0-0-0"
                                                value="${item.quantity}"
                                                name="quantity"
                                                class="quantity-input"/>
                                        </label>
                                    </div>
                                    <div class="col">&dollar; <fmt:formatNumber type="number" pattern="#,##0.00" value="${total}"/></div>
                                    <div> <a href="deletecart?pid=${item.product.id}"><i class="fa fa-close" style="font-size:20px; padding-right: 15px"></i></a></div>
                                    <input type="hidden" name="pid" value="${item.product.id}">
                                    <button class="refresh-button"><i class="fa fa-refresh fa-spin" style="font-size:18px"></i></button>
                                </div>
                            </div>
                        </form>
                    </c:forEach>
                    <div class="col2">
                        <div style="margin-top: 20px" class="back-to-shop"><a href="home"><i class="fa fa-chevron-circle-left" style="color: white"></i><span style="color:white; font-size: initial"> Continue Shopping</span></a></div>
                                    <c:if test="${itemCount !=0 }">
                            <a href="enterpasswordpayment.jsp"> 
                                <button class="btn">
                                    <span style="color: wheat; font-weight: bolder;font-size: larger;"> CHECKOUT</span>
                                    <span style="padding-left: 20px; color: #dc3545; font-family: cursive; font-size: initial;">
                                        $ <fmt:formatNumber type="number" pattern="#,##0.00" value="${purchase}"/>
                                    </span>
                                </button>
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
        <script type='text/javascript' src='#'></script>
        <script type='text/javascript' src='#'></script>
        <script type='text/javascript' src='#'></script>
        <script type='text/javascript'></script>
        <script type='text/javascript'>var myLink = document.querySelector('a[href="#"]');
            myLink.addEventListener('click', function (e) {
                e.preventDefault();
            });</script>
    </body>
</html>