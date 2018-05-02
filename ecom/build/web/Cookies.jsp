<%-- 
    Document   : profile
    Created on : Feb 8, 2018, 4:29:32 PM
    Author     : Java Champion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <title>Big store a Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | Register :: w3layouts</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta property="og:title" content="Vide" />
        <meta name="keywords" content="Big store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />

        <!-- //js -->
        <!-- start-smoth-scrolling -->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!-- start-smoth-scrolling -->
        <link href="css/font-awesome.css" rel="stylesheet"> 
        <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Noto+Sans:400,700' rel='stylesheet' type='text/css'>


    </head>
    <body onload="checkC(${charged})">          <%-- dool bzbt fel credit is not enough--%>
        <c:if test="${charged==-1}">
            <c:set var="charged" scope="session" value="0"/>
        </c:if>
        <a ><img src="images/download.png" class="img-head" alt=""></a>
        <div class="header">

            <div class="container">

                <div class="logo">
                    <h1 ><a href="index"><b>T<br>H<br>E</b>Big Store<span>The Best Supermarket</span></a></h1>
                </div>
                <c:choose>
                    <c:when test="${user.id >=0}">
                        <a href="index"><i class="fa fa-user" aria-hidden="true"></i>Home</a>
                        <a href="Logout"><i class="fa fa-user" aria-hidden="true"></i>Logout</a>
                    </c:when>
                    <c:otherwise>
                        <div class="head-t">
                            <ul class="card">
                                <li><a href="login.jsp" ><i class="fa fa-user" aria-hidden="true"></i>Login</a></li>
                                <li><a href="register.jsp" ><i class="fa fa-arrow-right" aria-hidden="true"></i>Register</a></li>
                            </ul>	
                        </div>
                    </c:otherwise>
                </c:choose>

                <div class="nav-top">
                    <nav class="navbar navbar-default">

                        <div class="navbar-header nav_2">
                            <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>


                        </div> 
                        <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                            <ul class="nav navbar-nav ">
                            </ul>
                    </nav>
                    <div class="clearfix"></div>
                </div>

            </div>			
        </div>
        <!---->

        <!--banner-->
        <div class="banner-top">
            <div class="container">
                <h3 >Cookies</h3>
                <h4><a href="main">Home</a><label>/</label>Cookies</h4>
                <div class="clearfix"> </div>
            </div>
        </div>
        <BR/><BR/><BR/><BR/><BR/>
        <div color="red" align="center">

            <h1 style="color:red;">Please enable Cookies of your browser.</h1>
        </div>
        <BR/><BR/><BR/><BR/><BR/>

        <!--footer-->
        <div class="footer">
            <div align="center" >
                <a href="aboutClient.jsp"> <h3>About Us</h3></a>
                <p>we are a mobile and web track seeking for developing a website like a souq.com</p>
            </div>

            <div class="container">

                <div class="clearfix"></div>
                <div class="footer-bottom">
                    <h2 ><a href="index"><b>T<br>H<br>E</b>Big Store<span>The Best Supermarket</span></a></h2>

                    <div class=" address">
                        <div class="col-md-4 fo-grid1">
                            <p><i class="fa fa-home" aria-hidden="true"></i>ITI</p>
                        </div>
                        <div class="col-md-4 fo-grid1">
                            <p><i class="fa fa-phone" aria-hidden="true"></i>+03598465</p>	
                        </div>
                        <div class="col-md-4 fo-grid1">
                            <p><a href="mailto:BigStore@Gmail.com"><i class="fa fa-envelope-o" aria-hidden="true"></i>BigStore@Gmail.com</a></p>
                        </div>
                        <div class="clearfix"></div>


                    </div>
                </div>
                <div class="copy-right">
                    <p> &copy; 2018 Big store. All Rights Reserved | Design by Alaa & Abanoub & El sheikh & Omnia</p>
                </div>
            </div>
        </div>
        <!-- //footer-->
        <!-- //footer-->
        <!-- smooth scrolling -->
        <script type="text/javascript">
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear' 
                 };
                 */
                $().UItoTop({easingType: 'easeOutQuart'});
            });
        </script>
        <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
        <!-- //smooth scrolling -->


    </body>
</html>
