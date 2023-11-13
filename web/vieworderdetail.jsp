<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Order Detail - Electro Shop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                margin-top:20px;
                color: #484b51;
                background-image: url('images/background.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }
            .text-secondary-d1 {
                color: #728299!important;
            }
            .page-header {
                margin: 0 0 1rem;
                padding-bottom: 1rem;
                padding-top: .5rem;
                display: -ms-flexbox;
                display: flex;
                -ms-flex-pack: justify;
                justify-content: space-between;
                -ms-flex-align: center;
                align-items: center;
            }
            .page-title {
                padding: 0;
                margin: 0;
                font-size: 1.75rem;
                font-weight: 300;
            }
            .brc-default-l1 {
                border-color: #dce9f0!important;
            }

            .ml-n1, .mx-n1 {
                margin-left: -.25rem!important;
            }
            .mr-n1, .mx-n1 {
                margin-right: -.25rem!important;
            }
            .mb-4, .my-4 {
                margin-bottom: 1.5rem!important;
            }

            hr {
                margin-top: 1rem;
                margin-bottom: 1rem;
                border: 0;
                border-top: 1px solid rgba(0,0,0,.1);
            }

            .text-grey-m2 {
                color: #888a8d!important;
            }

            .text-success-m2 {
                color: #86bd68!important;
            }

            .font-bolder, .text-600 {
                font-weight: 600!important;
            }

            .text-110 {
                font-size: 110%!important;
            }
            .text-blue {
                color: #478fcc!important;
            }
            .pb-25, .py-25 {
                padding-bottom: .75rem!important;
            }

            .pt-25, .py-25 {
                padding-top: .75rem!important;
            }
            .bgc-default-tp1 {
                background-color: rgba(121,169,197,.92)!important;
            }

            .page-header .page-tools {
                -ms-flex-item-align: end;
                align-self: flex-end;
            }

            .btn-light {
                background-color: #f5f6f9;
                border-color: #ffc107;
            }
            .w-2 {
                width: 1rem;
            }
            .mt-3, .my-3 {
                margin-top: 1rem!important;
                color: white;
            }
            .text-120 {
                font-size: 120%!important;
            }
            .text-primary-m1 {
                color: #4087d4!important;
            }

            .text-danger-m1 {
                color: #dd4949!important;
            }
            .text-blue-m2 {
                color: #68a3d5!important;
            }
            .text-150 {
                font-size: 150%!important;
            }
            .text-60 {
                font-size: 60%!important;
            }
            .text-grey-m1 {
                color: #7b7d81!important;
            }
            .align-bottom {
                vertical-align: bottom!important;
            }
            .brc-default-l1 {
                border-color: #dce9f0!important;
                padding: 0p;
                margin-top: 0px;
            }
            .text-secondary-d1 {
                color: #fff!important;
            }
            small {
                font-size: 80%;
                font-weight: 400;
                color: burlywood;
            }
            .text-grey-m3 {
                color: #fff!important;
                font-size: smaller;
            }
            .text-grey-m2 {
                color: #fff!important;
            }
            .text-blue {
                color: #fff!important;
            }

            .bgc-default-tp1 {
                background-color: #dc354578!important
            }
            .pt-25, .py-25 {
                padding-top: .75rem!important;
                color: #fff;
            }
            .text-150 {
                font-size: 150%!important;
                font-weight: bolder;
            }
            .bg-white {
                background-color: #ffbf00e3!important;
            }
            .col-9.col-sm-5 a {
                text-decoration: none;
                color: white
            }
        </style>
    </head>
    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <div class="page-content container">
            <div class="page-header text-blue-d2">
                <h1 class="page-title text-secondary-d1">
                    <span style="color: white">Order Detail</span>
                    <small class="page-info">
                        <i class="fa fa-angle-double-right text-80"></i>
                        ID: # ${invoice.orderID}
                    </small>
                </h1>
                <c:if test="${invoice.status != -1 && sessionScope.USER != null}">
                    <div class="page-tools">
                        <form action="vieworderdetail" method="get">
                            <input type="hidden" name="orderID" value="${invoice.orderID}">
                            <button class="btn bg-white btn-light mx-1px text-95" data-title="confirm">
                                <i class="fa fa-truck"></i>
                                View Tracking
                            </button>
                        </form>
                    </div>
                </c:if>

                <c:if test="${invoice.status == 4 && sessionScope.USER == null}">
                    <div class="page-tools">
                        <form action="orderaction3" method="get">
                            <input type="hidden" name="orderID" value="${invoice.orderID}">
                            <button class="btn bg-white btn-light mx-1px text-95" data-title="confirm">
                                <i class="fa fa-check"></i>
                                Confirm order
                            </button>
                        </form>
                    </div>
                </c:if>

                <c:if test="${invoice.status == 2 && sessionScope.USER == null}">
                    <div class="page-tools">
                        <form action="viewreturn" method="post">
                            <input type="hidden" name="orderID" value="${invoice.orderID}">
                            <button class="btn bg-white btn-light mx-1px text-95" data-title="confirm">
                                <i class="fa fa-eye"></i>
                                View return detail
                            </button>
                        </form>
                    </div>
                </c:if>  
            </div>
            <div class="container px-0">
                <div class="row mt-4">
                    <div class="col-12 col-lg-12">
                        <hr class="row brc-default-l1 mx-n1 mb-4" />
                        <div class="row">
                            <div class="col-sm-6">
                                <div>
                                    <span class="text-sm text-grey-m2 align-middle"><i class="fa fa-address-card-o"></i></span>
                                    <span class="text-600 text-110 text-blue align-middle"> ${invoice.billing_name}</span>
                                </div>
                                <div class="text-grey-m3">
                                    <div class="my-1"><i class="fa fa-home"></i></i></i> <b class="text-600"> ${invoice.billing_address}</b></div>
                                    <div class="my-1">
                                        ${invoice.city}, ${invoice.country}
                                    </div>
                                    <div class="my-1"><i class="fa fa-phone fa-flip-horizontal text-secondary"></i> <b class="text-600"> ${invoice.billing_phone}</b></div>
                                    <div class="my-1"><i class="fa fa-envelope"></i></i> <b class="text-600"> ${invoice.billing_mail}</b></div>
                                </div>
                            </div>

                            <div class="text-95 col-sm-6 align-self-start d-sm-flex justify-content-end">
                                <hr class="d-sm-none" />
                                <div class="text-grey-m2">
                                    <div class="mt-1 mb-2 text-secondary-m1 text-600 text-125">
                                        Invoice
                                    </div>
                                    <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">ID:</span> #${invoice.orderID}</div>
                                    <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">Issue Date:</span> ${invoice.orderDate}</div>
                                    <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">Status:</span>
                                        <c:if test="${invoice.status == 0}"><span style="background-color: #ffc107e6; color: #fff" class="badge">In Progress</span></c:if>
                                        <c:if test="${invoice.status == 2}"><span style="background-color: #09459d; color: #fff" class="badge">Return In Progress</span></c:if>
                                        <c:if test="${invoice.status == 3}"><span class="badge bg-success">Return Completed</span></c:if>
                                        <c:if test="${invoice.status == 1}"><span class="badge bg-success">Completed</span></c:if>
                                        <c:if test="${invoice.status == -1}"><span style="background-color: #6c757d; color: #fff" class="badge">Canceled</span></c:if>
                                        <c:if test="${invoice.status == 4}"><span style="background-color: #af8185; color: #fff" class="badge">Waiting for confirmed</span></c:if>
                                        <c:if test="${invoice.status == 5}"><span style="background-color: #6c1e1e; color: #fff" class="badge">Return Failed</span></c:if>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="mt-4">
                                <div class="row text-600 text-white bgc-default-tp1 py-25">
                                    <div class="d-none d-sm-block col-1">#</div>
                                    <div class="col-9 col-sm-5">Description</div>
                                    <div class="d-none d-sm-block col-4 col-sm-2">Quantity</div>
                                    <div class="d-none d-sm-block col-sm-2">Unit Price</div>
                                    <div class="col-2">Amount</div>
                                </div>
                            <c:set var="rowNumber" value="1" />
                            <c:forEach items="${listP}" var="listP">
                                <c:set var="unittotal" value="${listP.unit_price * listP.quantity}"/>
                                <c:set var="subtotal" value="${subtotal + unittotal}"/>
                                <div class="text-95 text-secondary-d3">
                                    <div class="row mb-2 mb-sm-0 py-25">
                                        <div style="color: wheat; font-size: larger; font-weight: bolder" class="d-none d-sm-block col-1">${rowNumber}</div>
                                        <div class="col-9 col-sm-5"><a <c:if test="${sessionScope.USER != null}">href="productdetail?productid=${listP.id}"</c:if>>${listP.name}</a></div>
                                        <div class="d-none d-sm-block col-2">${listP.quantity}</div>
                                        <div class="d-none d-sm-block col-2 text-95">$ ${listP.unit_price}</div>
                                        <div style="font-size: large" class="col-2 text-secondary-d2">$ <fmt:formatNumber type="number" pattern="#,##0.0" value="${unittotal}"/></div>
                                    </div>
                                </div>
                                <c:set var="rowNumber" value="${rowNumber + 1}" />
                            </c:forEach>


                            <div class="row mt-3">
                                <div class="col-12 col-sm-7 text-grey-d2 text-95 mt-2 mt-lg-0">
                                    Extra note such as company or payment information...
                                </div>
                                <div class="col-12 col-sm-5 text-grey text-90 order-first order-sm-last">
                                    <div class="row my-2">
                                        <div class="col-7 text-right">
                                            SubTotal:
                                        </div>
                                        <div class="col-5">
                                            <span style="font-family: cursive" class="text-120 text-secondary-d1">$ <fmt:formatNumber type="number" pattern="#,##0.0" value=" ${subtotal}"/></span>
                                        </div>
                                    </div>
                                    <div class="row my-2">
                                        <div class="col-7 text-right">
                                            Discount:
                                        </div>
                                        <div class="col-5">
                                            <span class="text-110 text-secondary-d1">
                                                <c:choose>
                                                    <c:when test="${sessionScope.USER.getJoinYear() - 2022 >= 1}">
                                                        -15%
                                                    </c:when>
                                                    <c:otherwise>
                                                        - 5% 
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row my-2">
                                        <div class="col-7 text-right">
                                            Shipping Tax: 
                                        </div>
                                        <div class="col-5">
                                            <span style="font-family: cursive" class="text-110 text-secondary-d1">
                                                $ 25
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row my-2 align-items-center bgc-primary-l3 p-2">
                                        <div class="col-7 text-right">
                                            Total Amount
                                        </div>
                                        <div class="col-5">
                                            <span style="font-family: cursive" class="text-150 text-success-d3 opacity-2">$ <fmt:formatNumber type="number"  pattern="#,##0.0" value="${invoice.total}"/></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>