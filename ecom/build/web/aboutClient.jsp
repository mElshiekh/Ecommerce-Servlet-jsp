<%-- 
    Document   : aboutClient
    Created on : Feb 16, 2018, 4:56:25 PM
    Author     : Java Champion 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
    <head>
        <title>Big store a Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | About :: w3layouts</title>
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
        <script type="text/javascript">
            jQuery(function () {
                jQuery('.starbox').each(function () {
                    var starbox = jQuery(this);
                    starbox.starbox({
                        average: starbox.attr('data-start-value'),
                        changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
                        ghosting: starbox.hasClass('ghosting'),
                        autoUpdateAverage: starbox.hasClass('autoupdate'),
                        buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
                        stars: starbox.attr('data-star-count') || 5
                    }).bind('starbox-value-changed', function (event, value) {
                        if (starbox.hasClass('random')) {
                            var val = Math.random();
                            starbox.next().text(' ' + val);
                            return val;
                        }
                    })
                });
            });
        </script>
        <!---//End-rate---->

    </head>
    <body>
        <a ><img src="images/download.png" class="img-head" alt=""></a>
        <div class="header">

            <div class="container">

                <div class="logo">
                    <h1 ><a href="HomeAdmin"><b>T<br>H<br>E</b>Big Store<span>The Best Supermarket</span></a></h1>
                </div>
                   <c:choose>
                    <c:when test="${user.id >=0}">
                        <a href="Logout"><i class="fa fa-user" aria-hidden="true"></i>Logout</a>
                        <a href="setProfile" ><i class="fa fa-arrow-right" aria-hidden="true"></i>Profile</a>
                        <a href="Cart" ><i class="fa fa-shopping-cart my-cart-icon" aria-hidden="true"></i>Cart</a>
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

                <div class="header-ri">
                 
               	
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
                                <li ><a href="index" class="hyper "><span>Home</span></a></li>	

                            </ul>
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
                <h3 >About</h3>
                <h4><a href="index">Home</a><label>/</label>About</h4>
                <div class="clearfix"> </div>
            </div>
        </div>

        <!-- faqs -->
        <div class="about-w3 ">


            <!--about-->
            <div class="container">
                <div  class="about">
                    <div class="spec ">
                        <h3>About</h3>
                        <div class="ser-t">
                            <b></b>
                            <span><i></i></span>
                            <b class="line"></b>
                        </div>
                    </div>

                   
            </div>
            <!--//about-->

            <!--work-experience-->
            <div  class="work">
                <div class="container">
                    <div class="spec spec-w3ls">
                        <h3>Our Journey</h3>
                        <div class="ser-t">
                            <b></b>
                            <span><i></i></span>
                            <b class="line"></b>
                        </div>
                    </div>



                    <div class="work-info"> 
                        <div class="col-md-6 work-left"> 
                            <div class=" work-w3 "> 
                                <h5> February 2018</h5>
                                <p>we are a mobile and web track ,, seeking for developing a website like a souq.com </p>
                            </div>
                            <label></label>
                        </div>
                        <div class="col-md-6 work-right"> 
                          
                            <label></label>
                        </div>
                        <div class="clearfix"> </div>
                       
                       
                    </div>
                </div>
            </div>
            <!--//work-experience-->
            <!--advantages--> 
            <div class="container">
                <div class="advantages">
                    <div class="col-md-6 advantages-left ">
                       
                                <div class="clearfix"></div>
                            </div>
                            <div class="ad-mian">
                              
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="ad-mian">
                             
                                
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 advantages-left about-agi">
                        
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!--advantages--> 

        </div>
        <!-- // Terms of use -->

        <!--footer-->
         <div class="footer">
              <div align="center" >
                    <a href="about.html"> <h3>About Us</h3></a>
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
        <script src="js/bootstrap.js"></script>
        <!-- //for bootstrap working -->
        <script type='text/javascript' src="js/jquery.mycart.js"></script>
        <script type="text/javascript">
            $(function () {

                var goToCartIcon = function ($addTocartBtn) {
                    var $cartIcon = $(".my-cart-icon");
                    var $image = $('<img width="30px" height="30px" src="' + $addTocartBtn.data("image") + '"/>').css({"position": "fixed", "z-index": "999"});
                    $addTocartBtn.prepend($image);
                    var position = $cartIcon.position();
                    $image.animate({
                        top: position.top,
                        left: position.left
                    }, 500, "linear", function () {
                        $image.remove();
                    });
                }

                $('.my-cart-btn').myCart({
                    classCartIcon: 'my-cart-icon',
                    classCartBadge: 'my-cart-badge',
                    affixCartIcon: true,
                    checkoutCart: function (products) {
                        $.each(products, function () {
                            console.log(this);
                        });
                    },
                    clickOnAddToCart: function ($addTocart) {
                        goToCartIcon($addTocart);
                    },
                    getDiscountPrice: function (products) {
                        var total = 0;
                        $.each(products, function () {
                            total += this.quantity * this.price;
                        });
                        return total * 1;
                    }
                });

            });
        </script>

    </body>
</html>