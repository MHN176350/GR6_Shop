<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Order Tracking - Electro Shop</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css' rel='stylesheet'>
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

            body{
                background-color: #eeeeee;
                font-family: 'Open Sans',serif;
                background-image: url('images/background.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }
            .container{
                margin-top:50px;
                margin-bottom: 50px
            }
            .card{
                position: relative;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -ms-flex-direction: column;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #00000057;
                background-clip: border-box;
                border: 1px solid rgba(0, 0, 0, 0.1);
                border-radius: 0.10rem;
            }
            .card-header:first-child{
                border-radius: calc(0.37rem - 1px) calc(0.37rem - 1px) 0 0
            }
            .card-header{
                padding: 0.75rem 1.25rem;
                margin-bottom: 0;
                background-color: #ff000066;
                border-bottom: 1px solid rgba(0, 0, 0, 0.1);
                color: white;
                font-size: x-large;
            }
            .track{
                position: relative;
                background-color: #ddd;
                height: 7px;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                margin-bottom: 120px;
                margin-top: 50px
            }
            .track .step{
                -webkit-box-flex: 1;
                -ms-flex-positive: 1;
                flex-grow: 1;
                width: 25%;
                margin-top: -18px;
                text-align: center;
                position: relative
            }
            .track .step.active:before{
                background: red
            }
            .track .step::before{
                height: 7px;
                position: absolute;
                content: "";
                width: 100%;
                left: 0;
                top: 18px
            }
            .track .step.active .icon{
                background: #dc3545;
                color: #fff
            }
            .track .icon{
                display: inline-block;
                width: 40px;
                height: 40px;
                line-height: 40px;
                position: relative;
                border-radius: 100%;
                background: #ddd
            }
            .track .step.active .text{
                font-weight: bolder;
                font-size: large;
                color: white
            }
            .track .text{
                display: block;
                margin-top: 7px;
                color: white
            }
            .itemside{
                position: relative;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                width: 100%
            }
            .itemside .aside{
                position: relative;
                -ms-flex-negative: 0;
                flex-shrink: 0
            }
            .img-sm{
                width: 80px;
                height: 80px;
                padding: 7px
            }
            ul.row, ul.row-sm{
                list-style: none;
                padding: 0
            }
            .itemside .info{
                padding-left: 15px;
                padding-right: 7px
            }
            .itemside .title{
                display: block;
                margin-bottom: 5px;
                color: #212529
            }
            p{
                margin-top: 0;
                margin-bottom: 1rem
            }
            .btn-warning{
                color: #ffffff;
                background-color: #ee5435;
                border-color: #ee5435;
                border-radius: 1px
            }
            .btn-warning:hover{
                color: #ffffff;
                background-color: #ff2b00;
                border-color: #ff2b00;
                border-radius: 1px
            }
            .time{
                font-size: small;
                font-style: italic;
                color: wheat;
            }
            b, strong {
                font-weight: bolder;
                color: white;
            }
            .col {
                -ms-flex-preferred-size: 0;
                flex-basis: 0;
                -ms-flex-positive: 1;
                flex-grow: 1;
                max-width: 100%;
                color: wheat;
            }
            .bg-white {
                background-color: rgb(0 0 0 / 14%)!important;
            }
            .btn-light {
                color: #fff;
                background-color: #f8f9fa;
                border-color: #fff;
                font-weight: bolder;
            }
        </style>

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
    </head>


    <body className='snippet-body'>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

        <div class="container">
            <article class="card">
                <header class="card-header" style="display: flex;
                        align-items: center;
                        justify-content: space-between">
                    <span style="color: wheat"> Tracking ID: <i class="fa fa-angle-double-right text-80"></i> # ${orderT.tracking_id}</span>

                    <c:if test="${orderT.order_confirm == null}">
                        <div>
                            <a href="orderaction2?orderID=${invoice.orderID}&trackingID=${orderT.tracking_id}" class="btn bg-white btn-light mx-1px text-95" data-title="confirm">
                                <i class="fa fa-trash"></i>
                                Cancel Order
                            </a>
                        </div>
                    </c:if>

                    <c:if test="${orderT.ready_for_picked_up != null && orderT.received == null}">
                        <div>
                            <form action="orderaction" method="post">
                                <input type="hidden" name="orderID" value="${invoice.orderID}">
                                <button class="btn bg-white btn-light mx-1px text-95" data-title="confirm">
                                    <i class="fa fa-download"></i>
                                    Confirm Received
                                </button>
                            </form>
                        </div>
                    </c:if>

                    <c:if test="${orderT.ready_for_picked_up != null && orderT.received != null && orderT.return_demand == null && orderT.complete == null}">
                        <div style="display: flex">
                            <div style="padding-right: 20px">
                                <form action="orderaction" method="get">
                                    <input type="hidden" name="orderID" value="${invoice.orderID}">
                                    <button class="btn bg-white btn-light mx-1px text-95" data-title="confirm">
                                        <i class="fa fa-check"></i>
                                        Complete
                                    </button>
                                </form>
                            </div>
                            <div>
                                <input type="hidden" name="orderID" value="${invoice.orderID}">
                                <button class="btn bg-white btn-light mx-1px text-95" data-title="confirm" data-toggle="modal" data-target="#myModal2">
                                    <i class="fa fa-exchange"></i>
                                    Exchange and Refund
                                </button>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${orderT.return_demand != null && orderT.complete == null && orderT.return_failed == null}">
                        <div style="display: flex">
                            <div style="padding-right: 20px">
                                <form action="orderaction3" method="post">
                                    <input type="hidden" name="orderID" value="${invoice.orderID}">
                                    <input type="hidden" name="trackingID" value="${orderT.tracking_id}">
                                    <button class="btn bg-white btn-light mx-1px text-95" data-title="confirm">
                                        <i class="fa fa-trash"></i>
                                        Delete Return Request
                                    </button>
                                </form>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${(orderT.complete != null || orderT.return_failed != null ) && check == null}">
                        <div style="display: flex">
                            <div style="padding-right: 20px">
                                <input type="hidden" name="orderID" value="${invoice.orderID}">
                                <button class="btn bg-white btn-light mx-1px text-95" data-title="confirm" data-toggle="modal" data-target="#myModal">
                                    <i class="fa fa-star"></i>
                                    Rate and Feedback
                                </button>
                            </div>
                        </c:if>

                        <c:if test="${(orderT.complete != null || orderT.return_failed != null ) && check != null}">
                            <div style="display: flex">
                                <div style="padding-right: 20px">
                                    <form action="overviewfeedback" method="get">
                                        <input type="hidden" name="orderID" value="${invoice.orderID}">
                                        <button class="btn bg-white btn-light mx-1px text-95">
                                            <i class="fa fa-trash"></i>
                                            Remove Feedback
                                        </button>
                                    </form>
                                </div>
                            </c:if>
                            </header>

                            <div class="card-body">
                                <div style="padding-bottom: 20px;
                                     padding-left: 10px">

                                    <h5 style="color: white;
                                        font-family: cursive;
                                        font-weight: bolder"><i class="fa fa-address-card-o" ></i> ${invoice.billing_name}</h5>
                                    <h6 style="color: white"><i class="fa fa-home"></i> ${invoice.billing_address}, ${invoice.city}, ${invoice.country}</h6>
                                    <h6 style="color: white"><i class="fa fa-phone fa-flip-horizontal text-secondary"></i> ${invoice.billing_phone}</h6>
                                    <h6 style="color: white"><i class="fa fa-envelope"></i> ${invoice.billing_mail} </h6>
                                </div>
                                <article class="card">
                                    <div class="card-body row">

                                        <c:set var="status" value="Waiting for confirmation"/>

                                        <c:if test="${orderT.order_confirm != null}">
                                            <c:set var="status" value="Order confirmed"/>
                                        </c:if>

                                        <c:if test="${orderT.picked_up_by_courier != null}" >
                                            <c:set var="status" value="Picked up by courier"/>
                                        </c:if >

                                        <c:if test="${orderT.on_the_way != null}">
                                            <c:set var="status" value="On delivery"/>
                                        </c:if >

                                        <c:if test="${orderT.ready_for_picked_up != null}">
                                            <c:set var="status" value="Ready for picked up"/>
                                        </c:if>

                                        <c:if test="${orderT.return_demand != null}">
                                            <c:set var="status" value="Waiting for accept return Request"/>
                                        </c:if>

                                        <c:if test="${orderT.return_failed != null && orderT.return_demand != null }" >
                                            <c:set var="status" value="Return Failed"/>
                                        </c:if>

                                        <c:if test="${orderT.complete != null && orderT.return_demand != null && orderT.return_failed == null }" >
                                            <c:set var="status" value="Return Completed"/>
                                        </c:if>

                                        <c:if test="${orderT.complete != null && orderT.return_demand == null }" >
                                            <c:set var="status" value="Completed"/>
                                        </c:if>

                                        <div class="col"> <strong> Transported By: </strong> <br> VIETTEL POST | <i class="fa fa-phone"></i> (+84)762003609 </div>
                                        <div class="col"> <strong> Status: </strong> <br> ${status} </div>
                                        <div class="col"> <strong> Estimate delivered time:  </strong> <br> About 5 days to 1 week </div>
                                    </div>
                                </article>
                                <div class="track">
                                    <c:choose>
                                        <c:when test="${orderT.order_confirm != null}">
                                            <div class="step active"><span class="icon"><i class="fa fa-handshake-o"></i></span><span class="text"> Order confirmed </span><span class="time">${orderT.order_confirm}</span></div>
                                                </c:when>
                                                <c:otherwise>
                                            <div class="step"><span class="icon"><i class="fa fa-handshake-o"></i></span><span class="text"> Order confirmed </span></div>
                                                </c:otherwise>
                                            </c:choose>

                                    <c:choose>
                                        <c:when test="${orderT.picked_up_by_courier!= null}">
                                            <div class="step active"> <span class="icon"> <i class="fa fa-user"></i> </span> <span class="text"> Picked by courier </span><span class="time">${orderT.picked_up_by_courier}</span></div>
                                            </c:when>
                                            <c:otherwise>
                                            <div class="step"> <span class="icon"> <i class="fa fa-user"></i> </span> <span class="text"> Picked by courier </span></div>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${orderT.on_the_way != null}">
                                            <div class="step active"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> On delivery </span><span class="time">${orderT.on_the_way}</span> </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="step"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> On delivery </span></div>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${orderT.ready_for_picked_up != null}">
                                            <div class="step active"> <span class="icon"> <i class="fa fa-phone"></i> </span> <span class="text"> Ready for picked up </span><span class="time">${orderT.ready_for_picked_up}</span></div>
                                            </c:when>
                                            <c:otherwise>
                                            <div class="step"> <span class="icon"> <i class="fa fa-phone"></i> </span> <span class="text"> Ready for picked up </span></div>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:if test="${orderT.return_demand != null}">
                                        <div class="step active"> <span class="icon"> <i class="fa fa-exchange"></i> </span> <span class="text">Return Requested </span><span class="time">${orderT.return_demand}</span></div>
                                            <c:choose>
                                                <c:when test="${orderT.complete != null}">
                                                <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text"> Return Completed </span><span class="time">${orderT.complete}</span> </div>
                                            </c:when>
                                            <c:when test="${orderT.return_failed != null }">
                                                <div class="step active"> <span class="icon"> <i class="fa fa-warning"></i> </span> <span class="text"> Return Failed </span><span class="time">${orderT.return_failed}</span></div>
                                                </c:when>
                                                <c:otherwise>
                                                <div class="step"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text"> Return  Completed </span></div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>

                                    <c:if test="${orderT.return_demand == null}">
                                        <c:choose>
                                            <c:when test="${orderT.complete != null}">
                                                <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text"> Completed </span><span class="time">${orderT.complete}</span> </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="step"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text"> Completed </span></div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </div>
                            </div>
                            </article>
                        </div>
                        <div style="padding-top: 100px" id="myModal" class="modal fade" role="dialog">
                            <!--Modal-->
                            <div class="modal-dialog">

                                <!--Modal Content-->
                                <div class="modal-content">

                                    <!-- Modal Header-->
                                    <div class="modal-header">
                                        <h3>Overview Feedback</h3>

                                        <!--Close/Cross Button-->
                                        <button type="button" class="close" data-dismiss="modal" style="color: white;">&times;</button>
                                    </div>

                                    <form action="overviewfeedback" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="orderID" value="${invoice.orderID}">
                                        <div class="container1 d-flex justify-content-center mt-200">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="stars">
                                                        <input class="star star-5" id="star-5" type="radio" value="5" name="star" required="" />
                                                        <label class="star star-5" for="star-5"></label>
                                                        <input class="star star-4" id="star-4" type="radio" value="4" name="star" required="" />
                                                        <label class="star star-4" for="star-4"></label>
                                                        <input class="star star-3" id="star-3" type="radio" value="3" name="star" required=""/>
                                                        <label class="star star-3" for="star-3"></label>
                                                        <input class="star star-2" id="star-2" type="radio" value="2" name="star" required=""/>
                                                        <label class="star star-2" for="star-2"></label>
                                                        <input class="star star-1" id="star-1" type="radio" value="1" name="star" required=""/>
                                                        <label class="star star-1" for="star-1"></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!--Text Message-->
                                        <div class="text-center">
                                            <h4>What could we improve?</h4>
                                        </div>

                                        <div style="display: flex; justify-content: space-between">
                                            <div style="padding-left: 20px; padding-top: 10px"><input style="color: red" name="image1" type="file" id="fileInput1"></div>
                                            <div style="padding-right: 25px" id="imagePreview1"></div>
                                            <style>
                                                img {
                                                    vertical-align: middle;
                                                    border-style: none;
                                                    max-width: 80px;
                                                }
                                            </style>
                                        </div>
                                        <script>
                                            const fileInput = document.getElementById('fileInput1');
                                            const imagePreview = document.getElementById('imagePreview1');

                                            fileInput.addEventListener('change', function () {
                                                const file = fileInput.files[0];
                                                if (file) {
                                                    const reader = new FileReader();
                                                    reader.onload = function (e) {
                                                        const img = new Image();
                                                        img.src = e.target.result;
                                                        imagePreview.innerHTML = '';
                                                        imagePreview.appendChild(img);
                                                    };
                                                    reader.readAsDataURL(file);
                                                }
                                            });
                                        </script>


                                        <div style="padding-left: 10px; padding-top: 20px">
                                            <textarea name="comment" placeholder="Give your feedback here !" rows="3" style="width: 98%;
                                                      padding: 15px;
                                                      border: 2px solid #dc3545;
                                                      border-radius: 30px;
                                                      font-size: 16px;
                                                      line-height: 1.5;"></textarea>
                                        </div>


                                        <!-- Modal Footer-->
                                        <div class="modal-footer">
                                            <button class="btn btn-primary">Send
                                                <i class="fa fa-paper-plane"></i>
                                            </button>  
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>


                        <div style="padding-top: 50px" id="myModal2" class="modal fade" role="dialog">
                            <!--Modal-->
                            <div class="modal-dialog">

                                <!--Modal Content-->
                                <div class="modal-content">

                                    <!-- Modal Header-->
                                    <div class="modal-header">
                                        <h3>Exchange and Refund</h3>

                                        <!--Close/Cross Button-->
                                        <button type="button" class="close" data-dismiss="modal" style="color: white;">&times;</button>
                                    </div>
                                    <div style="padding-top: 15px" class="text-center">
                                        <h5>What's problem with your order ?</h5>
                                    </div>

                                    <form action="orderaction2" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="orderID" value="${invoice.orderID}">
                                        <div style="padding-left: 20px; padding-top: 15px; font-family: math">
                                            <div>
                                                <input type="radio" name="reason" required="" value="Broken goods (broken, impure, leaking reagents...)"> 
                                                <label> Broken goods (broken, impure, leaking reagents...)</label>
                                            </div>

                                            <div>
                                                <input type="radio" name="reason" required="" value="Lack of goods"> 
                                                <label> Lack of goods</label>
                                            </div>

                                            <div>
                                                <input type="radio" name="reason" required="" value="Seller sent wrong item"> 
                                                <label> Seller sent wrong item</label>
                                            </div>

                                            <div>
                                                <input type="radio" name="reason" required="" value="Defective item, not working"> 
                                                <label> Defective item, not working</label>
                                            </div>

                                            <div>
                                                <input type="radio" name="reason" required="" value="Different from description"> 
                                                <label> Different from description</label>
                                            </div>

                                            <div>
                                                <input type="radio" name="reason" required="" value="Over date"> 
                                                <label> Over date</label>
                                            </div>

                                            <div>
                                                <input type="radio" name="reason" required="" value="Other reason"> 
                                                <label> Other reason</label>
                                            </div>

                                        </div>

                                        <!--Text Message-->
                                        <div style="display: flex; justify-content: space-between">
                                            <div style="padding-left: 20px; padding-top: 10px"><input style="color: red" name="image" type="file" id="fileInput"></div>
                                            <div style="padding-right: 25px" id="imagePreview"></div>
                                            <style>
                                                img {
                                                    vertical-align: middle;
                                                    border-style: none;
                                                    max-width: 80px;
                                                }
                                            </style>
                                        </div>
                                        <script>
                                            const fileInput = document.getElementById('fileInput');
                                            const imagePreview = document.getElementById('imagePreview');

                                            fileInput.addEventListener('change', function () {
                                                const file = fileInput.files[0];
                                                if (file) {
                                                    const reader = new FileReader();
                                                    reader.onload = function (e) {
                                                        const img = new Image();
                                                        img.src = e.target.result;
                                                        imagePreview.innerHTML = '';
                                                        imagePreview.appendChild(img);
                                                    };
                                                    reader.readAsDataURL(file);
                                                }
                                            });
                                        </script>


                                        <div style="padding-left: 10px; padding-top: 20px">
                                            <textarea name="detail_reason" placeholder="Give your detail problem here !" rows="3" style="width: 98%;
                                                      padding: 15px;
                                                      border: 2px solid #dc3545;
                                                      border-radius: 30px;
                                                      font-size: 16px;
                                                      line-height: 1.5;"></textarea>
                                        </div>


                                        <!-- Modal Footer-->
                                        <div class="modal-footer">
                                            <button class="btn btn-primary">Send
                                                <i class="fa fa-paper-plane"></i>
                                            </button>  
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>


                        <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
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