<%-- 
    Document   : login
    Created on : Feb 6, 2018, 9:25:27 PM
    Author     : Alaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Big store a Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | Login :: w3layouts</title>
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
        <!-- js -->
        <script src="js/jquery-1.11.1.min.js"></script>
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
        <!--- start-rate---->
        <script src="js/jstarbox.js"></script>
        <link rel="stylesheet" href="css/jstarbox.css" type="text/css" media="screen" charset="utf-8" />

        <!---//End-rate---->

    </head>
    <body>
        <c:if test="${userAdmin.email=='admin' || user.email!=null}">
        <c:redirect url="index"></c:redirect>
        </c:if>
        <a ><img src="images/download.png" class="img-head" alt=""></a>
        <div class="header">

            <div class="container">

                <div class="logo">
                    <h1 ><a href="index"><b>T<br>H<br>E</b>Big Store<span>The Best Supermarket</span></a></h1>
                </div>
                <div class="head-t">
                    <ul class="card">
                        <li><a href="login.jsp" ><i class="fa fa-user" aria-hidden="true"></i>Login</a></li>
                        <li><a href="register.jsp" ><i class="fa fa-arrow-right" aria-hidden="true"></i>Register</a></li>
                        <li><a href="aboutClient.jsp" ><i class="fa fa-file-text-o" aria-hidden="true"></i>about</a></li>
                    </ul>	
                </div>

                <div class="header-ri">
                    <ul class="social-top">
                         </ul>	
                </div>


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

                        </div>


                        <div class="clearfix"></div>
                </div>	
            </div>
        </nav>

        <div class="clearfix"></div>
    </div>

</div>			
</div>
<!---->
<!--banner-->
<div class="banner-top">
    <div class="container">
        <h3 >Login</h3>
        <h4><a href="index">Home</a><label>/</label>Login</h4>
        <div class="clearfix"> </div>
    </div>
</div>
<!--login-->

<div class="login">

    <div class="main-agileits">
        <div class="form-w3agile">
            <h3>Login</h3>
            <form action="UserLogin" method="post">
                <div class="key">
                    <i class="fa fa-envelope" aria-hidden="true"></i>
                    <input  type="text" value="Email" name="email" onfocus="this.value = '';" onblur="if (this.value == '')
                                this.value = 'Email';
                            }" required="">
                    <div class="clearfix"></div>
                </div>
                <div class="key">
                    <i class="fa fa-lock" aria-hidden="true"></i>
                    <input  type="password" value="Password" name="pass" onfocus="this.value = '';" onblur="if (this.value == '') {
                                this.value = 'Password';
                            }" required="">
                    <div class="clearfix"></div>
                </div>
                <input type="submit" value="Login">



            </form>
            <p style="color:red;">
                <c:out value="${param.flage}" /> 
            </p>

        </div>
        <div class="forg">
            <a href="register.jsp" class="forg-right">Register</a>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
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
<!-- for bootstrap working -->
<!-- //for bootstrap working -->


</body>
</html>
