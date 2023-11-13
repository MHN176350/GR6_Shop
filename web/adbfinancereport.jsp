<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>ElectroPay RP - Dashboard</title>
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
                                <h1 class="tm-block-title">Transaction List</h1>
                                <label>
                                    <form style="padding-top: 5px" id="filter" action="adbfinancereport" method="post">
                                        <select style="padding: 10px; border-radius: 5px; border: double;" name="search" onchange="change()">
                                            <option value="" disabled selected>Filter by payment</option>
                                            <option value="paid for order"<c:if test="${search == 'paid for order'}">selected=""</c:if>>Paid for Order</option>
                                        <option value="import" <c:if test="${search == 'import'}">selected=""</c:if>>Import from Paypal</option>
                                        <option value="refund from order"<c:if test="${search == 'refund from order'}">selected=""</c:if>>Refund from Order</option>
                                        <option value="refund from canceled order"<c:if test="${search == 'refund from canceled order'}">selected=""</c:if>>Refund from Canceled Order</option>
                                        </select>
                                    </form>
                                </label>
                                <script>
                                    function change() {
                                        document.getElementById("filter").submit();
                                    }
                                </script>

                                <form action="adbfinancereport" method="post" id="date">
                                    <input style="padding: 10px; border: double; border-radius: 5px" type="date" name ="date" value="${date}" onchange="change1()">
                            </form>
                            <script>
                                function change1() {
                                    document.getElementById("date").submit();
                                }
                            </script>

                            <form style="max-width: 30%" class="input-group rounded" action="adbfinancereport" method="post">
                                <input style="background-color: #fff; color: black" type="search" name="txtsearch" required="" class="form-control rounded" placeholder="Type here to search" aria-label="Search" aria-describedby="search-addon" value="${txtsearch}" />
                                <button style="background-color: transparent; color: white;" class="input-group-text border-0" id="search-addon">
                                    <i class="fas fa-search"></i>
                                </button>
                            </form>
                        </div>
                        <c:set var="itemCount" value="0"/>
                        <c:forEach items="${trs}" var="t">
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
                                    <th scope="col">TRSC NO</th>
                                    <th scope="col">CS NAME</th>
                                    <th scope="col">BALANCE ACTION</th>
                                    <th scope="col">ISSUE DATE</th>
                                    <th scope="col">METHOD ACTION</th>
                                    <th scope="col">STATUS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${trs}" var="t">
                                    <tr>
                                        <th scope="row"><b>${t.id}</b></th>
                                        <td><b>${t.f_name} ${t.l_name}</b></td>

                                        <c:if test="${t.note == 'Import money from Paypal'}">
                                            <td> + $ <fmt:formatNumber type="number" pattern="#,##0.0" value="${t.action}"/></td>
                                            <td><b>${t.issue_date}</b></td>
                                            <td>Import from Paypal</td>
                                        </c:if>

                                        <c:if test="${fn:contains(t.note, 'Paid for Order ID: # ')}"> 
                                            <td> - $ <fmt:formatNumber type="number" pattern="#,##0.0" value="${t.action}"/></td>
                                            <td><b>${t.issue_date}</b></td>
                                            <td> ${t.note}</td>
                                        </c:if>

                                        <c:if test="${fn:contains(t.note, 'Refund from canceled Order ID: # ')}">
                                            <td> + $ <fmt:formatNumber type="number" pattern="#,##0.0" value="${t.action}"/></td>
                                            <td><b>${t.issue_date}</b></td>
                                            <td>${t.note}</td>
                                        </c:if>

                                        <c:if test="${fn:contains(t.note, 'Refund from Order ID: # ')}">
                                            <td> + $ <fmt:formatNumber type="number" pattern="#,##0.0" value="${t.action}"/></td>
                                            <td><b>${t.issue_date}</b></td>
                                            <td>${t.note}</td>
                                        </c:if>
                                        <td><span class="badge bg-success">Completed</span></td>
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