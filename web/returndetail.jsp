<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Return Detail - Electro Shop</title>

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

    <body style="margin: 100px!important">
        <style>
            body{
                margin-top:20px;
                color: #484b51;
                background-image: url('images/background.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }
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
            .modal-footer {
                display: -ms-flexbox;
                display: flex;
                -ms-flex-align: center;
                align-items: center;
                -ms-flex-pack: end;
                justify-content: center;
                padding: 1rem;
                border-top: 1px solid #dee2e6;
                border-bottom-right-radius: .3rem;
                border-bottom-left-radius: .3rem;
            }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #555;
            }
            .modal-dialog{
                height: 50%;
                width: 50%;
                margin:auto;
            }
            .modal-header{
                color: white;
                background-color: #dc3545;
            }

            textarea{
                border: none;
                box-shadow: none !important;
                -webkit-appearance:none;
                outline:0px !important;
            }
            .btn-primary {
                color: #fff;
                background-color: #dc3545;
                border-color: #dc3545;
                font-family: monospace;
            }

            .openmodal{
                margin-left: 35%;
                width: 25%;
                margin-top: 25%;
            }
            .icon1{
                color: #007bff;
            }
            a{
                margin: auto;
            }

            input{
                color: #007bff;
            }
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
                background-color: #eee;
            }

            div.stars {
                width: 270px;
                display: inline-block;
            }
            .modal {
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1050;
                display: none;
                width: 100%;
                height: 100%;
                overflow: hidden;
                outline: 0;
            }
            input.star {
                display: none;
            }
            label.star {
                float: right;
                padding: 10px;
                font-size: 36px;
                color: #787e85;
                transition: all .2s;
            }
            input.star:checked~label.star:before {
                content: '\f005';
                color: #FD4;
                transition: all .25s;
            }
            input.star-5:checked~label.star:before {
                color: #FE7;
                text-shadow: 0 0 20px #952;
            }
            input.star-1:checked~label.star:before {
                color: #F62;
            }
            label.star:hover {
                transform: rotate(-15deg) scale(1.3);
            }
            label.star:before {
                content: '\f006';
                font-family: FontAwesome
            }
            .modal-header {
                display: -ms-flexbox;
                display: flex;
                -ms-flex-align: start;
                align-items: flex-start;
                -ms-flex-pack: justify;
                justify-content: space-between;
                padding: 1rem 1rem;
                border-bottom: 1px solid #dee2e6;
                border-top-left-radius: .3rem;
                border-top-right-radius: .3rem;
            }
            .h3, h3 {
                font-size: 1.75rem;
                font-family: monospace;
            }
            .h5, h5 {
                font-size: 1.5rem;
                font-family: monospace;
            }
            .modal-content {
                position: relative;
                display: -ms-flexbox;
                display: flex;
                -ms-flex-direction: column;
                flex-direction: column;
                width: 100%;
                pointer-events: auto;
                background-color: #e9ecef;
                background-clip: padding-box;
                border: 1px solid rgba(0,0,0,.2);
                border-radius: .3rem;
                outline: 0;
            }
        </style>

        <div class="modal-dialog">

            <!--Modal Content-->
            <div class="modal-content">

                <!-- Modal Header-->
                <div class="modal-header">
                    <h3>Order Return Detail Order ID: # ${view.order_id} </h3>

                    <!--Close/Cross Button-->
                </div>

                <div style="padding-left: 20px; padding-top: 15px; font-family: math">
                    <div>
                        <input type="radio" name="reason" required="" disabled="" value="Broken goods (broken, impure, leaking reagents...)"> 
                        <label> Broken goods (broken, impure, leaking reagents...)</label>
                    </div>

                    <div>
                        <input type="radio" name="reason" required="" disabled="" value="Lack of goods"> 
                        <label> Lack of goods</label>
                    </div>

                    <div>
                        <input type="radio" name="reason" required="" disabled="" value="Seller sent wrong item"> 
                        <label> Seller sent wrong item</label>
                    </div>

                    <div>
                        <input type="radio" name="reason" required="" disabled="" value="Defective item, not working"> 
                        <label> Defective item, not working</label>
                    </div>

                    <div>
                        <input type="radio" name="reason" required="" disabled="" value="Different from description"> 
                        <label> Different from description</label>
                    </div>

                    <div>
                        <input type="radio" name="reason" required="" disabled="" value="Over date"> 
                        <label> Over date</label>
                    </div>

                    <div>
                        <input type="radio" name="reason" required="" disabled="" value="Other reason"> 
                        <label> Other reason</label>
                    </div>

                </div>
                <script>
                    var receivedValue = '${view.reason}';
                    var radioButtons = document.querySelectorAll('input[type="radio"][name="reason"]');
                    for (var i = 0; i < radioButtons.length; i++) {
                        if (radioButtons[i].value === receivedValue) {
                            radioButtons[i].checked = true;
                            break;
                        }
                    }
                </script>

                <!--Text Message-->
                <div style="display: flex; justify-content: space-between">

                    <div style="padding-left: 50px; padding-top: 20px"><img src="images/${view.img}"></div>
                    <style>
                        img {
                            vertical-align: middle;
                            border-style: none;
                            max-width: 100px;
                        }
                    </style>
                </div>

                <div style="padding-left: 10px; padding-top: 20px">
                    <textarea readonly=""  name="detail_reason" rows="3" style="width: 98%;
                              padding: 15px;
                              border: 2px solid #dc3545;
                              border-radius: 30px;
                              font-size: 16px;
                              line-height: 1.5;" >${view.detail_reason}</textarea>
                </div>
                <div style="display: flex; justify-content: center">
                    <form action="orderaction4" method="get" enctype="multipart/form-data">
                        <input type="hidden" name="orderID" value="${view.order_id}">
                        <input type="hidden" name="userID" value="${view.user_id}">
                        <!-- Modal Footer-->
                        <div class="modal-footer">
                            <button style="background-color:green !important; border-color: green !important" class="btn btn-primary">Allow
                                <i class="fa fa-check"></i>
                            </button>  
                        </div>
                    </form>
                    <form action="orderaction4" method="post">
                        <input type="hidden" name="orderID" value="${view.order_id}">
                        <div class="modal-footer">
                            <button class="btn btn-primary">Deny
                                <i class="fa fa-ban"></i>
                            </button>  
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>