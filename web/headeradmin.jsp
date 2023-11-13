<%-- 
    Document   : headeradmin
    Created on : Oct 29, 2023, 11:45:47 PM
    Author     : ngnqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav style="padding-top: 15px" class="navbar navbar-expand-xl ">
            <div class="container h-100">
                <a class="navbar-brand" href="adbindex.jsp">
                    <h1 class="tm-site-title mb-0">Administrator</h1>
                </a>
                <button
                    class="navbar-toggler ml-auto mr-0"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link" href="">
                                <i class="fas fa-tachometer-alt"></i>Admin Dashboard
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="navbarDropdown"
                                role="button"
                                data-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                                >
                                <i class="far fa-file-alt"></i>
                                <span> Reports <i class="fas fa-angle-down"></i> </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="adborderreport">Orders Report</a>
                                <a class="dropdown-item" href="adbfinancereport">ElectroPay Report</a>
                                <a class="dropdown-item" href="adboverviewfb">Overview FeedBack Report</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="readproduct">
                                <i class="fas fa-shopping-cart"></i>Manage Products
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="Umng">
                                <i class="far fa-user"></i>Manage Accounts
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Bmng?uid=37">
                                <i class="fas fa-book"></i>Manage Blogs
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="adbadminprofile.jsp">
                                <i class="fas fa-cog"></i> Settings
                            </a>
                        </li>
                    </ul>
                    <ul style="padding-left: 20px" class="navbar-nav">
                        <li class="nav-item">
                            <form action="logout" method="post">
                                <button style="border: none; border-radius: 20px" type="submit"><a class="nav-link d-block">
                                        <b>Logout</b>
                                    </a>
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
