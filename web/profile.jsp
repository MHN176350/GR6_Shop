<%-- 
    Document   : index
    Created on : Sep 25, 2023, 10:59:10 PM
    Author     : MILAMILO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head itemscope itemtype="http://schema.org/WebSite">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title itemprop="name">PROFILE - Electro Shop</title>
        <meta name="description" itemprop="description"
              content="Preview bootstrap html snippet. bs5 edit profile account details. Copy and paste the html, css and js code for save time, build your app faster and responsive">
        <meta name="keywords"
              content="html, css, javascript, themes, templates, code snippets, ui examples, react js, react-native, plagraounds, cards, front-end, profile, invoice, back-end, web-designers, web-developers">
        <link itemprop="sameAs" href="https://www.facebook.com/bootdey">
        <link itemprop="sameAs" href="https://twitter.com/bootdey">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
        <meta name="viewport" content="width=device-width">
        <link rel="shortcut icon" type="image/x-icon" href="favicons/img-bootdey_favicon.ico">
        <link rel="apple-touch-icon" sizes="135x140" href="favicons/img-bootdey_135x140.png">
        <link rel="apple-touch-icon" sizes="76x76" href="favicons/img-bootdey_76x76.png">
        <link rel="canonical" href="https://www.bootdey.com/snippets/view/bs5-edit-profile-account-details" itemprop="url">
        <meta property="twitter:account_id" content="2433978487">
        <meta name="twitter:card" content="summary">
        <meta name="twitter:card" content="summary_large_image">
        <meta name="twitter:site" content="@bootdey">
        <meta name="twitter:creator" content="@bootdey">
        <meta name="twitter:title" content="Preview bootstrap html snippet. bs5 edit profile account details">
        <meta name="twitter:description"
              content="Preview bootstrap html snippet. bs5 edit profile account details. Copy and paste the html, css and js code for save time, build your app faster and responsive">
        <meta name="twitter:image" content="https://www.bootdey.com/files/SnippetsImages/bootstrap-snippets-1273.png">
        <meta name="twitter:url"
              content="https://www.bootdey.com/snippets/preview/bs5-edit-profile-account-details?full-screen=true">
        <meta property="og:title" content="Preview bootstrap html snippet. bs5 edit profile account details">
        <meta property="og:url"
              content="https://www.bootdey.com/snippets/preview/bs5-edit-profile-account-details?full-screen=true">
        <meta property="og:image" content="https://www.bootdey.com/files/SnippetsImages/bootstrap-snippets-1273.png">
        <meta property="og:description"
              content="Preview bootstrap html snippet. bs5 edit profile account details. Copy and paste the html, css and js code for save time, build your app faster and responsive">
        <meta name="msvalidate.01" content="23285BE3183727A550D31CAE95A790AB">
        <script src="js/cache-js-cache-1635427806-97135bbb13d92c11d6b2a92f6a36685a.js" type="text/javascript"></script>
    </head>

    <body>
        <div id="snippetContent">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
            <script src="js/js-bootstrap.bundle.min.js"></script>
            <div class="container-xl px-4 mt-4">
                <nav class="nav nav-borders"> <a class="nav-link active ms-0" href="profile.jsp"
                                                 >PROFILE</a> <a class="nav-link" href="vieworder"
                                                 >ORDER</a> <a class="nav-link" href="enterpasswordfinance.jsp"
                                                 >FINANCE</a> <a class="nav-link" href="changepassword.jsp"
                                                 >SECURITY</a> <a class="nav-link" href="home"
                                                 >HOME</a> <a style="padding-left: 480px; padding-bottom: 5px" href='https://www.paypal.com/vn/webapps/mpp/paypal-popup' title='How PayPal Works' onclick="javascript:window.open('https://www.paypal.com/vn/webapps/mpp/paypal-popup',
                                                                 'WIPaypal', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700');
                                                         return false;"><img src='https://www.paypalobjects.com/marketing/web/vn/manage-my-paypal-account/PP-AcceptanceMarkTray-NoDiscover-243x40-optimised.png' alt='Khay ?ánh d?u ch?p nh?n PayPal | L?n' /></a>
                </nav>
                <hr class="mt-0 mb-4">
                <div class="row">
                    <div class="col-xl-4">


                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Profile Picture</div>
                            <div class="card-body text-center"> <img class="img-account-profile rounded-circle mb-2"
                                                                     src="images/${sessionScope.USER.avatar}" alt>
                                <form action="image" method="post" enctype="multipart/form-data">
                                    <input style="padding-top: 20px; padding-bottom: 20px" name="photo" type="file">
                                    <c:if test="${sessionScope.USER.avatar == 'img/thumbnail_06.jpg'}" >
                                        <div style="color: white" class="small font-italic mb-4" >JPG or PNG no larger than 50 MB</div>
                                    </c:if>
                                    <div style="padding-top: 20px"><button
                                            class="btn btn-primary">Upload new image</button></div>
                                </form>
                                <div style="padding-top: 20px">
                                    <c:if test="${imgmessage!= null}">
                                        <div class="alert alert-danger">
                                            ${imgmessage}
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8">
                        <div class="card mb-4">
                            <div class="card-header">Account Details ${status}</div>
                            <div class="card-body">
                                <form action="updateprofile" method="post">

                                    <div class="row gx-3 mb-3">
                                        <div style="color: white" class="col-md-6"> <label class="small font-italic  mb-4" for="inputFirstName">First
                                                name</label> <input class="form-control" name="nfname" id="inputFirstName" type="text"
                                                                placeholder="Enter your first name" value="${sessionScope.USER.firstName}" required=""></div>
                                        <div style="color: white" class="col-md-6"> <label class="small font-italic  mb-4" for="inputLastName">Last
                                                name</label> <input name="nlname" class="form-control" id="inputLastName" type="text"
                                                                placeholder="Enter your last name" value="${sessionScope.USER.lastName}" required=""></div>
                                    </div>
                                    <div class="row gx-3 mb-3">
                                        <div style="color: white" class="col-md-6"> <label class="small font-italic  mb-4" for="inputOrgName">Account Balance
                                            </label> <input style="color: black"class="form-control" readonly="" id="inputOrgName" type="text"
                                                            value="$ <fmt:formatNumber type="number" pattern="#,##0.0" value="${sessionScope.USER.balance}"/>"> </div>
                                        <div style="color: white" class="col-md-6"> <label class="small font-italic  mb-4"
                                                                                           for="inputLocation">Location</label> <input name="naddress" class="form-control"
                                                                                           id="inputLocation" type="text" placeholder="Enter your locationnn"
                                                                                           value="${sessionScope.USER.address}" required=""></div>
                                    </div>
                                    <div  style="color: white" class="mb-3"> <label class="small font-italic mb-4" for="inputEmailAddress">Email
                                            address</label> <input style="color: black" class="form-control" id="inputEmailAddress" type="email"
                                                               readonly="" value="${sessionScope.USER.email}"></div>
                                    <div style="color: white" class="row gx-3 mb-3">
                                        <div style="color: white" class="col-md-6"> <label class="small font-italic mb-4" for="inputPhone">Phone
                                                number</label> <input class="form-control" name="nphone" id="inputPhone" type="tel"
                                                                  placeholder="Enter your phone number" value="${sessionScope.USER.phone}" required=""></div>
                                        <div style="color: white" class="col-md-6"> <label class="small font-italic  mb-4"
                                                                                           for="inputBirthday">Joined Date</label> <input style="color: black" class="form-control"
                                                                                           id="inputBirthday" type="text" name="birthday"
                                                                                           readonly="" value="${sessionScope.USER.join_date}"></div>
                                    </div> 
                                    <div style="padding-top: 10px"><button class="btn btn-primary" >Save changes</button></div><!-- comment -->
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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

                .card {
                    box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
                    position: relative;
                    display: flex;
                    flex-direction: column;
                    min-width: 0;
                    word-wrap: break-word;
                    background-color: rgb(0 0 0 / 22%);
                    background-clip: border-box;
                    border: 1px solid rgba(0,0,0,.125);
                    border-radius: 0.25rem;
                }
                .card .card-header {
                    font-weight: 500;
                    color: white;
                    font-weight: bolder;
                }
                .small {
                    font-size: .875em;
                    font-weight: bolder;
                }
                .mb-4 {
                    margin-bottom: 0.2rem!important;
                }
                hr {
                    margin: 1rem 0;
                    color: inherit;
                    background-color: white;
                    border: 0;
                    opacity: .25;
                    padding-bottom: 1px;
                }

                .card-header:first-child {
                    border-radius: 0.35rem 0.35rem 0 0;
                }

                .card-header {
                    padding: 1rem 1.35rem;
                    margin-bottom: 0;
                    background-color: #d0001491;
                    border-bottom: 1px solid rgba(33, 40, 50, 0.125);
                }
                .form-control,
                .dataTable-input {
                    display: block;
                    width: 100%;
                    padding: 0.875rem 1.125rem;
                    font-size: 0.875rem;
                    font-weight: 400;
                    line-height: 1;
                    color: white;
                    background-color: rgba(255, 255, 255, 0.1);
                    background-clip: padding-box;
                    border: 1px solid #c5ccd6;
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
                .root {
                    --bs-blue: #0d6efd;
                    --bs-indigo: #6610f2;
                    --bs-purple: #6f42c1;
                    --bs-pink: #d63384;
                    --bs-red: #dc3545;
                    --bs-orange: #fd7e14;
                    --bs-yellow: #ffc107;
                    --bs-green: #198754;
                    --bs-teal: #20c997;
                    --bs-cyan: #0dcaf0;
                    --bs-white: #fff;
                    --bs-gray: #6c757d;
                    --bs-gray-dark: #343a40;
                    --bs-primary: #0d6efd;
                    --bs-secondary: #6c757d;
                    --bs-success: #198754;
                    --bs-info: #0dcaf0;
                    --bs-warning: #ffc107;
                    --bs-danger: #dc3545;
                    --bs-light: #f8f9fa;
                    --bs-dark: #212529;
                    --bs-font-sans-serif: system-ui,-apple-system,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans","Liberation Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
                    --bs-font-monospace: SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace;
                    --bs-gradient: linear-gradient(180deg, rgba(255, 255, 255, 0.15), rgba(255, 255, 255, 0));
                }
                button, input, optgroup, select, textarea {
                    margin: 0;
                    font-family: inherit;
                    font-size: inherit;
                    line-height: inherit;
                    color: white;
                }
                .btn-primary {
                    color: #fff;
                    background-color: #dc3545;
                    border-color: #dc3545;
                }
                #bsaHolder {
                    right: 10px;
                    position: absolute;
                    top: 0;
                    width: 345px;
                    z-index: 10
                }

                #bsa_closeAd {
                    width: 15px;
                    height: 15px;
                    overflow: hidden;
                    position: absolute;
                    top: 10px;
                    right: 110px;
                    border: none !important;
                    z-index: 1;
                    text-decoration: none !important;
                    background: url(https://bootdey.com/img/x_icon.png) red no-repeat
                }

                #carbonads * {
                    margin: initial;
                    padding: initial;
                    text-align: center
                }

                #carbonads {
                    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen-Sans, Ubuntu, Cantarell, 'Helvetica Neue', Helvetica, Arial, sans-serif;
                    display: inline-block;
                    font-size: 14px;
                    text-shadow: 0 1px hsla(0, 0%, 100%, .8)
                }

                #carbonads a,
                #carbonads a:hover {
                    color: #444;
                    text-decoration: none
                }

                #carbonads>span {
                    display: grid;
                    background-color: #f9f9fa;
                    max-width: 250px;
                    padding: 1em;
                    box-sizing: border-box;
                    border-radius: 4px;
                    box-shadow: 0 0 1px hsl(0deg 0% 0% / .075), 0 0 2px hsl(0deg 0% 0% / .075), 0 0 4px hsl(0deg 0% 0% / .075), 0 0 8px hsl(0deg 0% 0% / .075), 0 0 16px hsl(0deg 0% 0% / .075)
                }

                #carbonads .carbon-wrap {
                    display: grid;
                    row-gap: 1em
                }

                #carbonads .carbon-text {
                    font-size: 1em;
                    margin-bottom: .5em
                }

                #carbonads .carbon-poweredby {
                    opacity: .5;
                    font-size: .725em;
                    text-transform: uppercase;
                    font-weight: 600;
                    letter-spacing: .05ch
                }

            </style>
            <script type="text/javascript"></script>
        </div>
        <script async src="https://www.googletagmanager.com/gtag/js?id=G-F1RTS0P1CD"></script>
        <script>window.dataLayer = window.dataLayer || [];
                                                     function gtag() {
                                                         dataLayer.push(arguments);
                                                     }
                                                     gtag('js', new Date());

                                                     gtag('config', 'G-F1RTS0P1CD');</script>

    </body>

</html>
