<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <head>
        <meta charset="utf-8">


        <title>Finance - Electro Shop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body {
                margin-top: 20px;
                background-image: url('images/background.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }

            .img-account-profile {
                height: 10rem;
            }

            .rounded-circle {
                border-radius: 50% !important;
            }
            .table>:not(:last-child)>:last-child>* {
                border-bottom-color: currentColor;
                color: wheat;
            }
            .card {
                box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: rgb(0 0 0 / 45%);
                background-clip: border-box;
                border: 1px solid rgba(0,0,0,.125);
                border-radius: 0.25rem;
                color: white
            }
            hr {
                margin: 1rem 0;
                color: inherit;
                background-color: white;
                border: 0;
                opacity: .25;
                padding-bottom: 1px;
            }

            .card .card-header {
                font-weight: 500;
            }

            .card-header:first-child {
                border-radius: 0.35rem 0.35rem 0 0;
            }

            .card-header {
                padding: 1rem 1.35rem;
                margin-bottom: 0;
                background-color: rgba(33, 40, 50, 0.03);
                border-bottom: 1px solid rgba(33, 40, 50, 0.125);
                display: flex;
                justify-content: space-between;
                align-items: center
            }

            .form-control,
            .dataTable-input {
                display: block;
                width: 100%;
                padding: none;
                font-size: 0.875rem;
                font-weight: 400;
                line-height: 1;
                color: #69707a;
                background-color: #fff0;
                background-clip: padding-box;
                border: 2px solid #f700188a;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 0.35rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            .nav {
                display: flex;
                flex-wrap: wrap;
                padding-left: 0;
                margin-bottom: 0;
                list-style: none;
                padding-bottom: 10px;
            }

            .nav-borders .nav-link {
                color: white;
                border-bottom-width: 0.125rem;
                border-bottom-style: solid;
                border-bottom-color: transparent;
                padding-top: 0.5rem;
                padding-bottom: 0.5rem;
                padding-left: 20px;
                padding-right: 0;
                margin-left: 1rem;
                margin-right: 1rem;
            }

            .fa-2x {
                font-size: 2em;
            }

            .table-billing-history th,
            .table-billing-history td {
                padding-top: 0.75rem;
                padding-bottom: 0.75rem;
                padding-left: 1.375rem;
                padding-right: 1.375rem;
            }

            .table> :not(caption)>*>*,
            .dataTable-table> :not(caption)>*>* {

                background-color: var(--bs-table-bg);
                border-bottom-width: 1px;
                box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
                color: white;
                padding-left: 85px

            }

            .border-start-primary {
                border-left-color: #0061f2 !important;
            }

            .border-start-secondary {
                border-left-color: #6900c7 !important;
            }

            .border-start-success {
                border-left-color: #00ac69 !important;
            }

            .border-start-lg {
                border-left-width: 0.25rem !important;
            }

            .h-100 {
                height: 100% !important;
            }
            .text-muted {
                color: white !important
            }
            tbody, td, tfoot, th, thead, tr {
                border-color: inherit;
                border-width: 0;
                border-style: none;
            }
            th {
                text-align: inherit;
                text-align: -webkit-match-parent;
                border-style: solid;
            }
            .mb-0 {
                margin-bottom: 10px!important
            }
            .input-group {
                position: relative;
                display: flex;
                flex-wrap: wrap;
                align-items: stretch;
                width: 23%;
            }
            .input-group-text {
                display: flex;
                align-items: center;
                padding: .375rem .75rem;
                font-size: 1rem;
                font-weight: 400;
                line-height: 1.5;
                color: #dc3545;
                text-align: center;
                white-space: nowrap;
                background-color: #e9ecef00;
                border: 1px solid #ced4da;
                border-radius: .25rem;
            }

        </style>
    </head>

    <body>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
              integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
        <div class="container-xl px-4 mt-4">

            <nav class="nav nav-borders"> <a class="nav-link active ms-0" href="profile.jsp"
                                             >PROFILE</a> <a class="nav-link" href="vieworder"
                                             >ORDER</a> <a class="nav-link" href="finance?npassword1=${sessionScope.USER.password}&g-recaptcha-response=checked"
                                             >FINANCE</a> <a class="nav-link" href="changepassword.jsp"
                                             >SECURITY</a> <a class="nav-link" href="home"
                                             >HOME</a><a style="padding-left: 480px; padding-bottom: 5px" href='https://www.paypal.com/vn/webapps/mpp/paypal-popup' title='How PayPal Works' onclick="javascript:window.open('https://www.paypal.com/vn/webapps/mpp/paypal-popup',
                                                             'WIPaypal', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700');
                                                     return false;"><img src='https://www.paypalobjects.com/marketing/web/vn/manage-my-paypal-account/PP-AcceptanceMarkTray-NoDiscover-243x40-optimised.png' alt='Khay ?�nh d?u ch?p nh?n PayPal | L?n' /></a>
            </nav>
            <hr class="mt-0 mb-4">
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <div class="card h-100 border-start-lg border-start-primary">
                        <div class="card-body">
                            <div class="small text-muted">Current ElectroPay balance</div>
                            <div style="padding-top: 10px; font-family: cursive; color: wheat; display: flex; justify-content: space-between" class="h3">
                                $ <fmt:formatNumber type="number" pattern="#,##0.0" value="${sessionScope.USER.balance}" />
                                <a href="redirectpaypal.jsp">
                                    <i style="color: white; padding-right: 25px" class="fa fa-plus-square"></i>
                                </a>
                            </div>
                            <div style="display: flex; justify-content: space-between">
                                <a style="text-decoration: none" class="text-arrow-icon small text-secondary" href="https://www.sandbox.paypal.com/myaccount/summary" target="_blank">
                                    View Paypal detail history
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-arrow-right">
                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                    <polyline points="12 5 19 12 12 19"></polyline>
                                    </svg>
                                </a>
                                <a href='https://www.paypal.com/vn/webapps/mpp/paypal-popup' title='How PayPal Works' onclick="javascript:window.open('https://www.paypal.com/vn/webapps/mpp/paypal-popup',
                                                'WIPaypal', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700');
                                        return false;"><img src='https://www.paypalobjects.com/webstatic/en_US/i/buttons/PP_logo_h_100x26.png' alt='Ch?p nh?n PayPal | Nh? v2' /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mb-4">
                <form action="finance" method="post">
                    <div class="card-header">
                        <div style="font-size: larger; font-weight: bolder; font-family: cursive"> Transaction history</div>
                        <div class="input-group rounded">
                            <input type="search" name="search" required="" class="form-control rounded" placeholder="Type here to search" aria-label="Search" aria-describedby="search-addon" value="${search}" />
                            <button class="input-group-text border-0" id="search-addon">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                        <c:set var="itemCount" value="0"/>
                        <c:forEach items="${listTr}" var="listTr">
                            <c:set var="itemCount" value="${itemCount + 1}" />
                        </c:forEach>
                        <c:if test="${f_check == 1}">
                            <div style="font: initial; font-style: italic; font-size: smaller">Showing result(s) in page ${current} of total ${total_tr} result(s).</div>
                        </c:if>
                        <c:if test="${f_check == -1}">
                            <div style="font: initial; font-style: italic; font-size: smaller">Showing ${itemCount} result(s).</div>
                        </c:if>
                    </div>
                </form>
                <div class="card-body p-0">
                    <div class="table-responsive table-billing-history">
                        <table class="table mb-0">
                            <thead>
                                <tr>
                                    <th class="border-gray-200" scope="col">ID</th>
                                    <th class="border-gray-200" scope="col">Issue Date</th>
                                    <th class="border-gray-200" scope="col">Action</th>
                                    <th class="border-gray-200" scope="col">Note</th>
                                    <th class="border-gray-200" scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listTr}" var="listTr">
                                    <tr>
                                        <td># ${listTr.id}</td>
                                        <td>${listTr.issue_date}</td>
                                        <c:if test="${listTr.note == 'Import money from Paypal'}">
                                            <td> + $ <fmt:formatNumber type="number" pattern="#,##0.0" value="${listTr.action}"/></td>
                                            <td>Import from Paypal</td>
                                        </c:if>
                                        <c:if test="${fn:contains(listTr.note, 'Paid for Order ID: # ')}"> 
                                            <td> - $ <fmt:formatNumber type="number" pattern="#,##0.0" value="${listTr.action}"/></td>
                                            <td> ${listTr.note}</td>
                                        </c:if>
                                        <c:if test="${fn:contains(listTr.note, 'Refund from canceled Order ID: # ')}">
                                            <td> + $ <fmt:formatNumber type="number" pattern="#,##0.0" value="${listTr.action}"/></td>
                                            <td>${listTr.note}</td>
                                        </c:if>
                                        <c:if test="${fn:contains(listTr.note, 'Refund from Order ID: # ')}">
                                            <td> + $ <fmt:formatNumber type="number" pattern="#,##0.0" value="${listTr.action}"/></td>
                                            <td>${listTr.note}</td>
                                        </c:if>
                                        <td><span class="badge bg-success">Success</span></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <c:if test="${f_check == 1}">

                <c:if test="${endPage <= 4}">
                    <ul style="display: flex; justify-content: flex-end;" class="reviews-pagination">
                        <c:forEach begin="1" end="${endPage}" var="i">
                            <li <c:if test="${i == current}">class="active"</c:if>>
                                <a href="finance?npassword1=${sessionScope.USER.password}&g-recaptcha-response=checked&index=${i}">${i}</a>
                            </li>
                            <c:if test="${i == current}">
                                <c:set var="currentValue" value="${i}" />
                            </c:if>
                        </c:forEach>

                        <c:if test="${currentValue < endPage}">
                            <li class="active"><a href="finance?npassword1=${sessionScope.USER.password}&g-recaptcha-response=checked&index=${currentValue + 1}"><i class="fa fa-angle-right"></i></a></li>
                                </c:if>
                    </ul>
                </c:if>

                <c:if test="${endPage > 4}">
                    <ul style="display: flex; justify-content: flex-end;" class="reviews-pagination">
                        <c:choose>
                            <c:when test="${current <= 3}">
                                <c:forEach begin="1" end="3" var="i">
                                    <li <c:if test="${i == current}">class="active"</c:if>>
                                        <a href="finance?npassword1=${sessionScope.USER.password}&g-recaptcha-response=checked&index=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                                <div style="padding-right: 10px; padding-top: 7px; color: white">...</div>
                                <li>
                                    <a href="finance?npassword1=${sessionScope.USER.password}&g-recaptcha-response=checked&index=${endPage}">${endPage}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <c:forEach begin="1" end="3" var="i">
                                    <li <c:if test="${i == current}">class="active"</c:if>>
                                        <a href="finance?npassword1=${sessionScope.USER.password}&g-recaptcha-response=checked&index=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                                <div style="padding-right: 10px; padding-top: 7px; color: white">...</div>
                                <li <c:if test="${endPage == current}">class="active"</c:if>>
                                    <a href="finance?npassword1=${sessionScope.USER.password}&g-recaptcha-response=checked&index=${endPage}">${endPage}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>

                        <c:if test="${current < endPage}">
                            <li class="active"><a href="finance?npassword1=${sessionScope.USER.password}&g-recaptcha-response=checked&index=${current + 1}"><i class="fa fa-angle-right"></i></a></li>
                                </c:if>
                    </ul>
                </c:if>
            </c:if>     

            <style>
                ul.reviews-pagination li.active {
                    background-color: #f700188a;
                    color: #fff;
                }
                ul.reviews-pagination li {
                    list-style-type: none;
                    display: inline-block;
                    margin-right: 10px;
                    border: 2px solid #f700188a;
                    border-radius: 5px;
                    padding: 3px 9px;
                }
                ul.reviews-pagination li a {
                    text-decoration: none;
                    color: white
                }
            </style>
        </div>

        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">
        </script>

    </body>

</html>