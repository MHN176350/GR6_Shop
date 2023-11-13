<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">


        <title>Purchase - Electro Shop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body {
                margin-top: 20px;
                background-color: #f1f3f7;
                background-image: url('images/background.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }

            .btn-success {
                --bs-btn-color: #fff;
                --bs-btn-bg: #842029;
                --bs-btn-border-color: #842029;
                --bs-btn-hover-color: #fff;
                --bs-btn-hover-bg: #842029;
                --bs-btn-hover-border-color: #842029;
                --bs-btn-focus-shadow-rgb: 60,153,110;
                --bs-btn-active-color: #fff;
                --bs-btn-active-bg: #842029;
                --bs-btn-active-border-color: #842029;
                --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
                --bs-btn-disabled-color: #fff;
                --bs-btn-disabled-bg: #842029;
                --bs-btn-disabled-border-color: #842029;
            }
            .card {
                margin-bottom: 24px;
                -webkit-box-shadow: 0 2px 3px #e4e8f0;
                box-shadow: 0 2px 3px #e4e8f0;
            }

            .card {
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
                background-color: #2b000f87;
                background-clip: border-box;
                border: 1px solid #eff0f2;
                border-radius: 1rem;
                color: whitesmoke;
            }

            .activity-checkout {
                list-style: none
            }

            .activity-checkout .checkout-icon {
                position: absolute;
                top: -4px;
                left: -24px
            }

            .activity-checkout .checkout-item {
                position: relative;
                padding-bottom: 24px;
                padding-left: 35px;
                border-left: 2px solid #f5f6f8
            }

            .activity-checkout .checkout-item:first-child {
                border-color: #842029;
            }

            .activity-checkout .checkout-item:first-child:after {
                background-color: #3b76e1
            }

            .activity-checkout .checkout-item:last-child {
                border-color: transparent
            }

            .activity-checkout .checkout-item.crypto-activity {
                margin-left: 50px
            }

            .activity-checkout .checkout-item .crypto-date {
                position: absolute;
                top: 3px;
                left: -65px
            }

            ::placeholder {
                color: whitesmoke !important;
            }

            .avatar-xs {
                height: 1rem;
                width: 1rem
            }

            .avatar-sm {
                height: 2rem;
                width: 2rem
            }

            .avatar {
                height: 3rem;
                width: 3rem
            }

            .avatar-md {
                height: 4rem;
                width: 4rem
            }

            .avatar-lg {
                height: 3rem;
                width: 4rem;
            }

            .avatar-xl {
                height: 6rem;
                width: 6rem
            }

            .avatar-title {
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                background-color: #dc3545 !important;
                color: #fff;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                font-weight: 500;
                height: 100%;
                -webkit-box-pack: center;
                -ms-flex-pack: center;
                justify-content: center;
                width: 100%;
            }

            .avatar-group {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
                padding-left: 8px
            }

            .avatar-group .avatar-group-item {
                margin-left: -8px;
                border: 2px solid #fff;
                border-radius: 50%;
                -webkit-transition: all .2s;
                transition: all .2s
            }

            .avatar-group .avatar-group-item:hover {
                position: relative;
                -webkit-transform: translateY(-2px);
                transform: translateY(-2px)
            }

            .card-radio {
                background-color: #2b000f87;
                border: 2px solid #eff0f2;
                border-radius: .75rem;
                padding: .5rem;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
                display: block;
            }

            .card-radio:hover {
                cursor: pointer
            }

            .card-radio-label {
                display: block
            }

            .edit-btn {
                width: 35px;
                height: 35px;
                line-height: 40px;
                text-align: center;
                position: absolute;
                right: 25px;
                margin-top: -50px
            }

            .card-radio-input {
                display: none
            }
            .bg-light {
                --bs-bg-opacity: 1;
                background-color: #842029 !important;
            }
            .card-radio-input:checked+.card-radio {
                border-color: #3b76e1 !important
            }
            .card-radio-input:checked+.card-radio {
                border-color: #dc3535 !important;
            }

            .font-size-16 {
                font-size: 16px !important;
            }

            .text-truncate {
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

            a {
                text-decoration: none !important;
            }


            .form-control {
                display: block;
                width: 100%;
                padding: 0.47rem 0.75rem;
                font-size: .875rem;
                font-weight: 400;
                line-height: 1.5;
                color: white;
                background-color: transparent;
                background-clip: padding-box;
                border: 1px solid #e2e5e8;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 0.75rem;
                -webkit-transition: border-color .15s ease-in-out, -webkit-box-shadow .15s ease-in-out;
                transition: border-color .15s ease-in-out, -webkit-box-shadow .15s ease-in-out;
                transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
                transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out, -webkit-box-shadow .15s ease-in-out;
            }

            .edit-btn {
                width: 35px;
                height: 35px;
                line-height: 40px;
                text-align: center;
                position: absolute;
                right: 25px;
                margin-top: -50px;
            }

            .ribbon {
                position: absolute;
                right: -26px;
                top: 20px;
                -webkit-transform: rotate(45deg);
                transform: rotate(45deg);
                color: #fff;
                font-size: 13px;
                font-weight: 500;
                padding: 1px 22px;
                font-size: 13px;
                font-weight: 500
            }
            .h5, h5 {
                font-size: inherit;
            }
            .text-muted {
                --bs-text-opacity: 1;
                color: #8e99a5!important;

            }
            td{
                min-width: 100px;
            }
            .border-top-0 {
                border-top: 0!important;
                color: white;
            }
            .text-dark {
                --bs-text-opacity: 1;
                color: white !important;
            }
            .m-0 {
                margin: 0!important;
                color: white;
            }
            tbody, td, tfoot, th, thead, tr {
                border-color: inherit;
                border-style: solid;
                border-width: 0;
                color: white;
            }
        </style>
    </head>

    <body>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
              integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <div class="container">
            <div class="row">
                <div class="col-xl-7">
                    <div class="card">
                        <div class="card-body">
                            <ol class="activity-checkout mb-0 px-4 mt-3">
                                <li class="checkout-item">
                                    <div class="avatar checkout-icon p-1">
                                        <div class="avatar-title rounded-circle bg-primary">
                                            <i class="bx bxs-receipt text-white font-size-20"></i>
                                        </div>
                                    </div>
                                    <div class="feed-item-list">
                                        <form action="checkout" method="post">
                                            <div>
                                                <h5 class="font-size-16 mb-1">Billing Info</h5>
                                                <p class="text-muted text-truncate mb-4">Specify the important delivery information</p>
                                                <div class="mb-3">

                                                    <div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                <div class="mb-3">
                                                                    <label class="form-label"
                                                                           for="billing-name">Name</label>
                                                                    <input type="text" class="form-control"
                                                                           id="billing-name" name="billing-name" placeholder="Enter name" required="" value="${sessionScope.invoice.billing_name}">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <div class="mb-3">
                                                                    <label class="form-label"
                                                                           for="billing-email-address">Email Address</label>
                                                                    <input type="email" class="form-control"
                                                                           id="billing-email-address" name="billing-mail"
                                                                           placeholder="Enter email" required="" value="${sessionScope.invoice.billing_mail}">
                                                                </div>
                                                            </div> 
                                                            <div class="col-lg-4">
                                                                <div class="mb-3">
                                                                    <label class="form-label"
                                                                           for="billing-phone">Phone</label>
                                                                    <input type="text" class="form-control"
                                                                           id="billing-phone" name="billing-phone" placeholder="Enter Phone" required="" value="${sessionScope.invoice.billing_phone}" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label" for="billing-address">Address</label>
                                                            <input type="text" class="form-control"
                                                                   id="billing-address" name="billing-address" placeholder="Enter Address" required="" value="${sessionScope.invoice.billing_address}" >
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                <div class="mb-4 mb-lg-0">
                                                                    <label class="form-label">Country</label>
                                                                    <input type="text" class="form-control"
                                                                           id="country" name="country" placeholder="Enter Country" required="" value="${sessionScope.invoice.country}" >
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <div class="mb-4 mb-lg-0">
                                                                    <label class="form-label"
                                                                           for="billing-city">City</label>
                                                                    <input type="text" class="form-control"
                                                                           id="billing-city" name="city" placeholder="Enter City" required="" value="${sessionScope.invoice.city}">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <div class="mb-0">
                                                                    <label class="form-label" for="zip-code">Zip / Postal
                                                                        code</label>
                                                                    <input type="text" class="form-control" id="zip-code" name="zip"
                                                                           placeholder="Enter Postal code">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                </li>

                                <li class="checkout-item">
                                    <div class="avatar checkout-icon p-1">
                                        <div class="avatar-title rounded-circle bg-primary">
                                            <i class="bx bxs-wallet-alt text-white font-size-20"></i>
                                        </div>
                                    </div>
                                    <div class="feed-item-list">
                                        <div>
                                            <h5 class="font-size-16 mb-1">Payment Info</h5>
                                            <p class="text-muted text-truncate mb-4">Choose the most optimal payment method</p>
                                        </div>
                                        <div>
                                            <h5 style="font-family: cursive" class="font-size-14 mb-3">Payment method :<span style="color: wheat"> ${message}</span> </h5>
                                            <div class="row">
                                                <div class="col-lg-3 col-sm-6">
                                                    <div data-bs-toggle="collapse">
                                                        <label class="card-radio-label">
                                                            <input type="radio" name="pay-method" id="pay-methodoption1" value="ElectroPay" class="card-radio-input" >
                                                            <span class="card-radio py-3 text-center text-truncate">
                                                                <i class="bx bx-credit-card d-block h2 mb-3"></i>
                                                                ElectroPay <br>$ <fmt:formatNumber type="number" pattern="#,##0.0" value="${sessionScope.USER.balance}"/>
                                                            </span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-sm-6">
                                                    <div>
                                                        <label class="card-radio-label">
                                                            <input type="radio" name="pay-method" value="CashOnDelivery" id="pay-methodoption2"
                                                                   class="card-radio-input" checked>
                                                            <span class="card-radio py-3 text-center text-truncate">
                                                                <i class="bx bx-money d-block h2 mb-3"></i>
                                                                <span>Cash on Delivery <br> (COD)</span>
                                                            </span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ol>
                        </div>
                    </div>

                </div>
                <div class="col-xl-5">
                    <div class="card checkout-order-summary">
                        <div class="card-body">
                            <div class="p-3 bg-light mb-3">
                                <h5 class="font-size-16 mb-0">Order Summary</h5>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-centered mb-0 table-nowrap">
                                    <thead>
                                        <tr>
                                            <th class="border-top-0" style="width: 110px;" scope="col">Product</th>
                                            <th class="border-top-0" scope="col">Product Desc</th>
                                            <th class="border-top-0" scope="col">Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${sessionScope.cart.item}" var="item">
                                            <c:set var="unittotal" value="${item.product.price *(100 - item.product.discount)/100 * item.quantity}"/>
                                            <c:set var="subtotal" value="${subtotal + unittotal}"/>
                                            <tr>
                                                <th scope="row"><img src="${item.product.img}"
                                                                     alt="product-img" title="product-img" class="avatar-lg rounded"></th>
                                                <td style="font-family: cursive">
                                                    <h5 style="color: #dee2e6" class="font-size-16 text-truncate">${item.product.name}</h5>
                                                    <p class=" mb-0 mt-1" style="color: wheat;">$ <fmt:formatNumber type="number" pattern="#,##0.0" value="${item.product.price *(100 - item.product.discount)/100}"/> x ${item.quantity}</p>
                                                </td>
                                                <td style="font-family: cursive">$ <fmt:formatNumber type="number" pattern="#,##0.0" value="${unittotal}"/></td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td colspan="2">
                                                <h5 class="font-size-14 m-0">Sub Total :</h5>
                                            </td>
                                            <td style="font-family: cursive; font-weight: bolder; color: wheat">
                                                $ <fmt:formatNumber type="number" pattern="#,##0.0" value="${subtotal}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <h5 class="font-size-14 m-0">Discount :</h5>
                                            </td>
                                            <td style="font-family: cursive">
                                                <c:choose>
                                                    <c:when test="${sessionScope.USER.getJoinYear() - 2022 >=1}">
                                                        -15%
                                                    </c:when>
                                                    <c:otherwise>
                                                        - 5% 
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <h5 class="font-size-14 m-0">Shipping Charge :</h5>
                                            </td>
                                            <td style="font-family: cursive">
                                                $ 25
                                            </td>
                                        </tr>
                                        <tr class="bg-light">
                                            <td colspan="2">
                                                <h5 class="font-size-14 m-0">Total:</h5>
                                            </td>
                                            <td style="font-family: cursive; font-weight: bolder; color: wheat">
                                                <c:choose>
                                                    <c:when test="${sessionScope.USER.getJoinYear() - 2022 >=1}">
                                                        <input type="hidden" name="total" value="${subtotal * 85 / 100 + 25}">
                                                        $ <fmt:formatNumber type="number"  pattern="#,##0.0" value="${subtotal *85 /100 +25}"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="hidden" name="total" value="${subtotal * 95 / 100 + 25}"> 
                                                        $ <fmt:formatNumber type="number" pattern="#,##0.0" value="${subtotal *95 /100 +25}"/> 
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row my-4">
                            <div style="padding-left: 20px" class="col">
                                <a style="color: white" href="viewcart.jsp" class="btn btn-link ">
                                    <i class="mdi mdi-arrow-left me-1"></i> Back to Cart </a>
                            </div>
                            <div style="padding-right: 30px"class="col">
                                <div class="text-end mt-2 mt-sm-0">
                                    <button class="btn btn-success">
                                        <i class="mdi mdi-cart-outline me-1"></i> PURCHASE
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>

                </div>

            </div>

        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>

</html>