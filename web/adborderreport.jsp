<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Electro OrderRP - Dashboard</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css">
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min_1.css">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
        <div class="" id="home">
            <jsp:include page="headeradmin.jsp"></jsp:include>
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <p class="text-white mt-5 mb-5">Welcome back, <b> Admin</b></p>
                        </div>

                    </div>             
                    <div class="col-12 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                            <div style="display: flex; justify-content: space-between; padding-bottom: 20px">
                                <h1 class="tm-block-title">Orders List</h1>
                                <label>
                                    <form style="padding-top: 5px" id="filter" action="adborderreport" method="post">
                                        <select style="padding: 10px; border-radius: 5px; border: double;" name="search" onchange="change()">
                                            <option value="" disabled selected>Filter by status</option>
                                            <option value="completed"<c:if test="${search == 'completed'}">selected=""</c:if>>Completed</option>
                                        <option value="canceled"<c:if test="${search == 'canceled'}">selected=""</c:if>>Canceled</option>
                                        <option value="waitingforconfirmed" <c:if test="${search == 'waitingforconfirmed'}">selected=""</c:if>>Waiting for confirmed</option>
                                        <option value="returncompleted"<c:if test="${search == 'returncompleted'}">selected=""</c:if>>Return Completed</option>
                                        <option value="in progress"<c:if test="${search == 'inprogress'}">selected=""</c:if>>In Progress</option>
                                        <option value="returnfailed" <c:if test="${search == 'returnfailed'}">selected=""</c:if>>Return Failed</option>
                                        <option value="pendingconfirmreturn" <c:if test="${search == 'pendingconfirmreturn'}">selected=""</c:if>>Pending Confirm Return</option>
                                        </select>
                                    </form>
                                </label>
                                <script>
                                    function change() {
                                        document.getElementById("filter").submit();
                                    }
                                </script>

                                <form action="adborderreport" method="post" id="date">
                                    <input style="padding: 10px; border: double; border-radius: 5px" type="date" name ="date" value="${date}" onchange="change1()">
                            </form>
                            <script>
                                function change1() {
                                    document.getElementById("date").submit();
                                }
                            </script>

                            <form style="max-width: 30%" class="input-group rounded" action="adborderreport" method="post">
                                <input style="background-color: #fff; color: black" type="search" name="txtsearch" required="" class="form-control rounded" placeholder="Type here to search" aria-label="Search" aria-describedby="search-addon" value="${txtsearch}" />
                                <button style="background-color: transparent; color: white;" class="input-group-text border-0" id="search-addon">
                                    <i class="fas fa-search"></i>
                                </button>
                            </form>
                        </div>
                        <c:set var="itemCount" value="0"/>
                        <c:forEach items="${ord}" var="o">
                            <c:set var="itemCount" value="${itemCount + 1}" />
                        </c:forEach>
                        <div style="display: flex;
                             justify-content: end;
                             padding-bottom: 5px;
                             font-style: italic;
                             color: wheat;
                             font-size: small;
                             padding-right: 10px">Showing all ${itemCount} results. </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">ORDER NO</th>
                                    <th scope="col">CS NAME</th>
                                    <th scope="col">Shipping ADD</th>
                                    <th scope="col">ORDER DATE</th>
                                    <th scope="col">PAYMENT</th>
                                    <th scope="col">STATUS</th>
                                    <th scope="col">VIEW</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${ord}" var="o">
                                    <tr>
                                        <th scope="row"><b>${o.oid}</b></th>
                                        <td><b>${o.cname}</b></td>
                                        <td><b>${o.address}</b></td>
                                        <td><b>${o.odate}</b></td>
                                        <td>${o.payment}</td>
                                        <c:if test="${o.status == 4}">
                                            <td>
                                                <div class="tm-status-circle pending"></div>
                                                <span style="background-color: #af8185; color: #fff" class="badge">Waiting for confirmed</span>
                                            </td>
                                        </c:if>
                                        <c:if test="${o.status == 2}">
                                            <td>
                                                <div class="tm-status-circle pending"></div>
                                                <span style="background-color: #09459d; color: #fff" class="badge">Pending confirm return</span>
                                            </td>
                                        </c:if>
                                        <c:if test="${o.status == 1}">
                                            <td><span class="badge bg-success">Completed</span></td>
                                        </c:if>
                                        <c:if test="${o.status == 0}">
                                            <td><span style="background-color: #ffc107e6; color: #fff" class="badge">In Progress</span></td>
                                        </c:if>
                                        <c:if test="${o.status == 3}">
                                            <td><span class="badge bg-success">Return Completed</span></td>
                                        </c:if>
                                        <c:if test="${o.status == 5}">
                                            <td><span style="background-color: #6c1e1e; color: #fff" class="badge">Return Failed</span></td>
                                        </c:if>
                                        <c:if test="${o.status == -1}">
                                            <td><span style="background-color: #6c757d; color: #fff" class="badge">Canceled</span></td>
                                        </c:if>

                                        <td>
                                            <form action="vieworderdetail" method="post">
                                                <input type="hidden" name="orderID" value="${o.oid}">
                                                <button style="background-color: transparent;
                                                        color: white;
                                                        border: none;
                                                        font-size: large;"><i class="fa fa-eye"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <style>
            .tm-status-circle {
                display: inline-block;
                margin-right: 5px;
                vertical-align: middle;
                width: 5px;
                height: 5px;
                border-radius: 50%;
                margin-top: -3px;
            }
        </style>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/moment.min.js"></script>
    <!-- https://momentjs.com/ -->
    <script src="js/Chart.min.js"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="js/bootstrap.min_1.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="js/tooplate-scripts.js"></script>

    <style>
        body{
            background-color: #545b62 !important
        }
        .tm-bg-primary-dark {
            background-color: #495057 !important
        }
        .table{
            background-color: #495057 !important
        }
    </style>
</body>

</html>