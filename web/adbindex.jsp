<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Electro Product Admin - Dashboard</title>
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
                            <p class="text-white mt-5 mb-5">Welcome back, <b> Admin ${ADBUSER.full_name}</b></p>
                    </div>
                </div>
                <!-- row -->
                <div style="right: auto"><form method="post" action="adblogin" ><Select onchange="this.form.submit()" name="type">
                            <option value="1" <c:if test="${requestScope.type==1}">selected</c:if>>This Month </option>
                            <option value="2" <c:if test="${requestScope.type!=1}">selected</c:if>>This Year </option>
                            </Select></form></div>
                    <div class="card-group" style="margin-top: 20px;margin-bottom: 20px" >
                        <div class="card border-right">
                            <div class="card-body">
                                <div class="d-flex d-lg-flex d-md-block align-items-center">
                                    <div>
                                        <div class="d-inline-flex align-items-center">
                                            <h2 class="text-dark mb-1 font-weight-medium">${requestScope.newC}</h2>
                                        <span
                                            class="badge bg-primary font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">+18.33%</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">New Clients</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="user-plus"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <c:set var = "balance" value = "${requestScope.earn}" />
                                    <h2 class="text-dark mb-1 w-100 text-truncate font-weight-medium"><sup
                                            class="set-doller">$</sup><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${balance}" /></h2>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Earnings of <c:if test="${requestScope.type==1}"> Month</c:if><c:if test="${requestScope.type!=1}"> Year</c:if>
                                        </h6>
                                    </div>
                                    <div class="ml-auto mt-md-3 mt-lg-0">
                                        <span class="opacity-7 text-muted"><i data-feather="dollar-sign"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card border-right">
                            <div class="card-body">
                                <div class="d-flex d-lg-flex d-md-block align-items-center">
                                    <div>
                                        <div class="d-inline-flex align-items-center">
                                                <h2 class="text-dark mb-1 font-weight-medium">${requestScope.newP}</h2>
                                        <span
                                            class="badge bg-danger font-12 text-white font-weight-medium badge-pill ml-2 d-md-none d-lg-block">+${requestScope.newP/requestScope.countP*100}%</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">New Products</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="file-plus"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <h2 class="text-dark mb-1 font-weight-medium">${requestScope.countP}</h2>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Product</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="globe"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row tm-content-row">
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title">Income Component</h2>
                            <canvas style="background-color: rgb(255, 255, 255);
                                    border-radius: 30px;
                                    border: solid rgb(220, 53, 69); max-height: 340px" id="myChart" class="chartjs-render-monitor" width="150" height="150"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title">Performance by<c:if test="${requestScope.type==1}"> Month</c:if><c:if test="${requestScope.type!=1}"> Year</c:if></h2>
                                <canvas style="background-color: rgb(255, 255, 255);
                                    border-radius: 30px;
                                    border: solid rgb(220, 53, 69); height: 340px !important" id="myChart1"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                            <div class="tm-bg-primary-dark tm-block tm-block-taller">
                                <h2 class="tm-block-title">Expense Information</h2>
                                <div id="pieChartContainer">
                                    <canvas style="background-color: rgb(255, 255, 255);
                                    border-radius: 30px;
                                    border: solid rgb(220, 53, 69);" id="myChart2" ></canvas>
                                </div>                        
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                            <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow">
                                <h2 class="tm-block-title">Notification List</h2>
                                <div class="tm-notification-items">
                                    <div class="media tm-notification-item">
                                        <div class="tm-gray-circle"><img src="img/notification-01.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                        <div class="media-body">
                                            <p class="mb-2"><b>Jessica</b> and <b>6 others</b> sent you new <a href="#"
                                                                                                               class="tm-notification-link">product updates</a>. Check new orders.</p>
                                            <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                        </div>
                                    </div>
                                    <div class="media tm-notification-item">
                                        <div class="tm-gray-circle"><img src="img/notification-02.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                        <div class="media-body">
                                            <p class="mb-2"><b>Oliver Too</b> and <b>6 others</b> sent you existing <a href="#"
                                                                                                                       class="tm-notification-link">product updates</a>. Read more reports.</p>
                                            <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                        </div>
                                    </div>
                                    <div class="media tm-notification-item">
                                        <div class="tm-gray-circle"><img src="img/notification-03.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                        <div class="media-body">
                                            <p class="mb-2"><b>Victoria</b> and <b>6 others</b> sent you <a href="#"
                                                                                                            class="tm-notification-link">order updates</a>. Read order information.</p>
                                            <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                        </div>
                                    </div>
                                    <div class="media tm-notification-item">
                                        <div class="tm-gray-circle"><img src="img/notification-01.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                        <div class="media-body">
                                            <p class="mb-2"><b>Laura Cute</b> and <b>6 others</b> sent you <a href="#"
                                                                                                              class="tm-notification-link">product records</a>.</p>
                                            <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                        </div>
                                    </div>
                                    <div class="media tm-notification-item">
                                        <div class="tm-gray-circle"><img src="img/notification-02.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                        <div class="media-body">
                                            <p class="mb-2"><b>Samantha</b> and <b>6 others</b> sent you <a href="#"
                                                                                                            class="tm-notification-link">order stuffs</a>.</p>
                                            <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                        </div>
                                    </div>
                                    <div class="media tm-notification-item">
                                        <div class="tm-gray-circle"><img src="img/notification-03.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                        <div class="media-body">
                                            <p class="mb-2"><b>Sophie</b> and <b>6 others</b> sent you <a href="#"
                                                                                                          class="tm-notification-link">product updates</a>.</p>
                                            <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                        </div>
                                    </div>
                                    <div class="media tm-notification-item">
                                        <div class="tm-gray-circle"><img src="img/notification-01.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                        <div class="media-body">
                                            <p class="mb-2"><b>Lily A</b> and <b>6 others</b> sent you <a href="#"
                                                                                                          class="tm-notification-link">product updates</a>.</p>
                                            <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                        </div>
                                    </div>
                                    <div class="media tm-notification-item">
                                        <div class="tm-gray-circle"><img src="img/notification-02.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                        <div class="media-body">
                                            <p class="mb-2"><b>Amara</b> and <b>6 others</b> sent you <a href="#"
                                                                                                         class="tm-notification-link">product updates</a>.</p>
                                            <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                        </div>
                                    </div>
                                    <div class="media tm-notification-item">
                                        <div class="tm-gray-circle"><img src="img/notification-03.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                        <div class="media-body">
                                            <p class="mb-2"><b>Cinthela</b> and <b>6 others</b> sent you <a href="#"
                                                                                                            class="tm-notification-link">product updates</a>.</p>
                                            <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                <script>
                    var chartData = ${chartData}; // Access the data from the request attribute

                    // Extract labels and data from chartData object
                    var labels = chartData.map(obj => obj.data);
                    var data = chartData.map(obj => obj.value);

// Create a pie chart using Chart.js
                    var ctx = document.getElementById('myChart').getContext('2d');
                    var myChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: labels,
                            datasets: [{
                                    label: 'Chart Data',
                                    data: data,
                                    backgroundColor: [
                                        'rgba(255, 99, 132, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(255, 206, 86, 0.2)'
                                    ],
                                    borderColor: [
                                        'rgba(255, 99, 132, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(255, 206, 86, 1)'
                                    ],
                                    borderWidth: 1
                                }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            layout: {
                                padding: {
                                    left: 10,
                                    right: 10,
                                    top: 10,
                                    bottom: 15
                                }
                            },
                            legend: {
                                position: "top"
                            }
                        }
                    });

            </script>
            <script>
                var chartData =${chartData1};
                var chartData1 =${chartData2};
                var datasets = [];

                // Extract labels and data from chartData array
                var labels = chartData.map(obj => obj.data);
                var data = chartData.map(obj => obj.value);
                var data1 = chartData1.map(obj => obj.value);

                datasets.push({
                    label: 'Laptop',
                    data: data,
                    fill: false,
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                });
                datasets.push({
                    label: 'Phone',
                    data: data1,
                    fill: false,
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                });


                // Create a line chart using Chart.js
                var ctx = document.getElementById('myChart1').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: datasets
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            </script>
            <script>
                // Inserted data
                var chartData4 = ${chartData3}

                // Extract labels and data from chartData array
                var labels = chartData4.map(obj => obj.data);
                var data = chartData4.map(obj => obj.value);

                // Create a column chart using Chart.js
                var ctx = document.getElementById('myChart2').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: 'Expense',
                                data: data,
                                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                                borderColor: 'rgba(54, 162, 235, 1)',
                                borderWidth: 1
                            }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            </script>
            <script src="js/jquery-3.3.1.min.js"></script>
            <!-- https://jquery.com/download/ -->
            <script src="js/moment.min.js"></script>
            <!-- https://momentjs.com/ -->
            <script src="js/Chart.min.js"></script>
            <!-- http://www.chartjs.org/docs/latest/ -->
            <script src="js/bootstrap.min_1.js"></script>
            <!-- https://getbootstrap.com/ -->
            <script src="js/tooplate-scripts.js"></script>



    </body>

</html>