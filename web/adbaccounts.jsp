<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Electro Admin - Account</title>
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
            .table-responsive {
                margin: 30 px;
            }
            .table-wrapper {
                min-width: 1000 px;
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #6c757d;
                color: #fff;
                padding: 16px 30px;
                margin: -20px -25px 10px;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn {
                color: #566787;
                float: right;
                font-size: 13px;
                background: #fff;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn:hover, .table-title .btn:focus {
                color: #566787;
                background: #f2f2f2;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.settings {
                color: #2196F3;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .status {
                font-size: 30px;
                margin: 2px 2px 0 0;
                display: inline-block;
                vertical-align: middle;
                line-height: 10px;
            }
            .text-success {
                color: #10c469;
            }
            .text-info {
                color: #62c9e8;
            }
            .text-warning {
                color: #FFC107;
            }
            .text-danger {
                color: #ff5b5b;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            .switch {
                position: relative;
                display: inline-block;
                width: 60px;
                height: 34px;
            }

            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                -webkit-transition: .4s;
                transition: .4s;
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

            input:checked + .slider {
                background-color: #2196F3;
            }

            input:focus + .slider {
                box-shadow: 0 0 1px #2196F3;
            }

            input:checked + .slider:before {
                -webkit-transform: translateX(26px);
                -ms-transform: translateX(26px);
                transform: translateX(26px);
            }

            /* Rounded sliders */
            .slider.round {
                border-radius: 34px;
            }

            .slider.round:before {
                border-radius: 50%;
            }
            .table {
                background-color: #fff;
                color: #000;
                font-size: 85%;
                margin-bottom: 0;
            }
            body{
                background-color: #fff;
            }
            .mt-5, .my-5 {
                margin-top: 3rem!important;
                padding-bottom: 30px;
            }
            .tm-content-row {
                justify-content: space-between;
                margin-left: -20px;
                margin-right: -20px;
                border: double;
                border-color: #567086;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #567086;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .input-group {
                position: relative;
                display: flex;
                flex-wrap: wrap;
                align-items: stretch;
                width: 30%;
            }
            .input-group-text {
                display: flex;
                align-items: center;
                padding: .375rem .75rem;
                font-size: 1rem;
                font-weight: 400;
                line-height: 1.5;
                color: #fff;
                text-align: center;
                white-space: nowrap;
                background-color: #e9ecef00;
                border: 1px solid #ced4da;
                border-radius: .25rem;
            }
            .row {
                display: -ms-flexbox;
                display: flex;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
                margin-right: -15px;
                margin-left: -15px;
                justify-content: space-between;
            }
            .form-control {
                background-color: #fff;
                color: #fff;
                border: 0;
            }
        </style>
    </head>

    <body id="reportsPage">
        <div class="content" id="home">
            <jsp:include page="headeradmin.jsp"></jsp:include>
            <div class="container mt-5">

                <!-- row -->
                <div class="row tm-content-row">
                    <div class="table-responsive">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-5">
                                        <h2>Accounts <b>Management</b></h2>
                                    </div>
                                    <form class="input-group rounded" action="Umng" method="post">
                                        <input style="background-color: #fff; color: black" type="search" name="ser" required="" class="form-control rounded" placeholder="Type here to search" aria-label="Search" aria-describedby="search-addon" value="${ser}" />
                                        <button class="input-group-text border-0" id="search-addon">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <div></div>
                            <table class="table table-striped table-hover" id="us">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>						
                                        <th>Date Created</th>
                                        <th>Balance</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${requestScope.users==null}"><h1>No Result Found</h1></c:if>
                                <c:forEach items="${requestScope.users}" var="u">
                                    <tr>
                                        <td>${u.uid}</td>
                                        <td><a href="ud?id=${u.uid}"><img src="images/${u.ava}" class="avatar" alt="Avatar" style="width: 20px;height: 20px;"> ${u.lname}</a></td>
                                        <td>${u.date}</td>                        
                                        <td> $ <fmt:formatNumber type="number" pattern="#,##0.0" value="${u.bal}"/></td>
                                        <td><c:if test="${u.status==1}"><span class="status text-success">&bull;</span> Active</td></c:if><c:if test="${u.status!=1}"><span class="status alert-warning">&bull;</span> Suspended</td></c:if>
                                        <td>
                                                <form method="post" action="Umng" id="myForm"><input type="hidden" value="${u.uid}" name="id"><select onchange="this.form.submit()" name="stt"><option value="1" ${u.status == 1 ? 'selected' : ''}>Active</option><option value="0" ${u.status == 0 ? 'selected' : ''}>Deactive</option></select></form>
                                    </td>
                                    </tr></c:forEach>
                                    </tbody>
                                </table>
                                <div style="padding-top: 15px"class="clearfix">
                                    <div class="hint-text" id="row-count"> Showing <b id="total">{}</b> out of <b>${requestScope.entry}</b> entries</div>
                                <ul class="pagination" style="">
                                    <li class="page-item"><a href="Umng?in=1">First</a></li>
                                        <c:forEach begin="1" end="${requestScope.page}"  var="i">
                                        <li><a href="Umng?in=${i}">${i}</a></li>
                                        </c:forEach>                 
                                    <li class="page-item"><a href="Umng?in=${requestScope.page}" class="page-item">&nbsp;Last</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script>
            function countRows() {
                var table = document.getElementById("us");
                var rowCount = table.rows.length;
                document.getElementById('total').innerHTML = rowCount - 1;
            }

            window.addEventListener("load", countRows);
        </script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min_1.js"></script>
        <!-- https://getbootstrap.com/ -->
    </body>
</html>
