<%-- 
    Document   : profile1.jsp
    Created on : Sep 22, 2023, 9:54:21 AM
    Author     : MILAMILO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head itemscope itemtype="http://schema.org/WebSite">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title itemprop="name">PROFILE</title>
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

    <body class="img js-fullheight" style="background-image: url(images/profile.jpg);">

        <div id="snippetContent">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
            <script src="js/js-bootstrap.bundle.min.js"></script>
            <div class="container-xl px-4 mt-4">
                <nav class="nav nav-borders"> <a class="nav-link active ms-0" href="profile.jsp"
                                                 target="__blank">Profile</a> <a class="nav-link" href="#"
                                                 target="__blank">Billing</a> <a class="nav-link" href="changepassword.jsp"
                                                 target="__blank">Security</a> <a class="nav-link" href="index.jsp"
                                                 target="__blank">Home</a> </nav>
                <hr class="mt-0 mb-4">
                <div style="padding-top: 20px" class="row">
                    <div class="col-xl-4">
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Profile Picture</div>
                            <div class="card-body text-center"> <img class="img-account-profile rounded-circle mb-2"
                                                                     src="images/${sessionScope.USER.avatar}" alt>
                                <form action="image" method="post" enctype="multipart/form-data">
                                    <input style="padding-top: 20px; padding-bottom: 20px" name="photo" type="file">
                                    <button class="btn btn-primary">Upload new image</button>
                                </form>
                                <div style="padding-top: 20px">
                                    <c:if test="${imgmessage!= null}">
                                        <div class="alert alert-danger">
                                            ${imgmessage}
                                        </div>
                                    </c:if>
                                    <c:if test="${sessionScope.USER.avatar == null}" >
                                        <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div> 
                                    </c:if>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8">
                        <div class="card mb-4">
                            <div class="card-header">Account Details ${status}

                            </div>
                            <div class="card-body">
                                <form action="updateprofile" method="post">
                                    <input type="hidden" name="email" value="${sessionScope.USER.email}" />

                                    <div class="row gx-3 mb-3">
                                        <div class="col-md-6"> <label class="small mb-1" for="inputFirstName">First
                                                name</label> <input class="form-control" id="name" name="nfname" type="text"
                                                                placeholder="Enter your first name" value="${sessionScope.USER.firstName}" required=""></div>
                                        <div class="col-md-6"> <label class="small mb-1" for="inputLastName">Last
                                                name</label> <input class="form-control" id="inputLastName" name="nlname" type="text"
                                                                placeholder="Enter your last name" value="${sessionScope.USER.lastName}" required=""></div>
                                    </div>
                                    <div class="row gx-3 mb-3">
                                        <div class="col-md-6"> <label class="small mb-1" for="inputOrgName">Account Balance
                                            </label> <input class="form-control" id="inputOrgName" type="text"
                                                            placeholder="" readonly="" value="${sessionScope.USER.balance} $"></div>
                                        <div class="col-md-6"> <label class="small mb-1"
                                                                      for="inputLocation">Location</label> <input class="form-control"
                                                                      id="inputLocation" name="naddress" type="text" placeholder="Enter your location"
                                                                      value="${sessionScope.USER.address}" required=""></div>
                                    </div>
                                    <div class="mb-3"> <label class="small mb-1" for="inputEmailAddress">Email
                                            address</label> <input class="form-control" id="inputEmailAddress" type="email"
                                                               placeholder="Enter your email address" value="${sessionScope.USER.email}" readonly=""></div>
                                    <div class="row gx-3 mb-3">
                                        <div class="col-md-6"> <label class="small mb-1" for="inputPhone">Phone
                                                number</label> <input class="form-control" name="nphone" id="inputPhone" type="text"
                                                                  placeholder="Enter your phone number" value="${sessionScope.USER.phone}" required=""></div>
                                        <div class="col-md-6"> <label class="small mb-1"
                                                                      for="inputBirthday">Joined Date</label> <input class="form-control"
                                                                      id="inputBirthday" type="text" readonly="" name="joindate"
                                                                      placeholder="" value="${sessionScope.USER.join_date}"></div>
                                    </div> 
                                    <div style="padding-left: 300px; padding-top: 20px">
                                        <div>
                                            <button class="btn btn-primary">Save changes</button> 

                                        </div>






                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <style type="text/css">

                body {
                    margin-top: 20px;
                    background-color: #f2f6fc;
                    color: #69707a;
                }

                .img-account-profile {
                    height: 10rem;
                }

                .rounded-circle {
                    border-radius: 10% !important;
                }

                .card {
                    box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
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
                }

                .form-control,
                .dataTable-input {
                    display: block;
                    width: 100%;
                    padding: 0.875rem 1.125rem;
                    font-size: 0.875rem;
                    font-weight: 400;
                    line-height: 1;
                    color: #69707a;
                    background-color: #fff;
                    background-clip: padding-box;
                    border: 1px solid #c5ccd6;
                    -webkit-appearance: none;
                    -moz-appearance: none;
                    appearance: none;
                    border-radius: 0.35rem;
                    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
                }

                .nav-borders .nav-link.active {
                    color: #0061f2;
                    border-bottom-color: #0061f2;
                }

                .nav-borders .nav-link {
                    
                    color: whitesmoke;
                    border-bottom-width: 0.325rem;
                    border-bottom-style: solid;
                    border-bottom-color: transparent;
                    padding-top: 0.5rem;
                    padding-bottom: 0.5rem;
                    padding-left: 0;
                    padding-right: 0;
                    margin-left: 1rem;
                    margin-right: 1rem;
                    
                }
            </style>
            <script type="text/javascript"></script>
            <div id="bsaHolder"> <a id="bsa_closeAd" title="Hide this ad!" href="#"
                                    onclick="$(this).closest('#bsaHolder').remove();"></a>
                <script async type="text/javascript" src="js/carbon.js" id="_carbonads_js"></script>
            </div>
            <style>
                #bsaHolder {
                    right: 10px;
                    position: absolute;
                    top: 0;
                    width: 345px;
                    z-index: 10
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
