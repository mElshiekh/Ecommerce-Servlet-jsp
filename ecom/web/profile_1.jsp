<%-- 
    Document   : profile
    Created on : Feb 8, 2018, 4:29:32 PM
    Author     : omnia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <a ><img src="images/download.png" class="img-head" alt=""></a>
        <div class="header">

            <div class="container">

                <div class="logo">
                    <h1 ><a href="main.jsp"><b>T<br>H<br>E</b>Big Store<span>The Best Supermarket</span></a></h1>
                </div>
                <div class="head-t">
                    <ul class="card">
                        <li><a href="login.html" ><i class="fa fa-user" aria-hidden="true"></i>Login</a></li>
                        <li><a href="register.jsp" ><i class="fa fa-arrow-right" aria-hidden="true"></i>Register</a></li>
                        <li><a href="about.html" ><i class="fa fa-file-text-o" aria-hidden="true"></i>about</a></li>
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


                    </nav>

                    <div class="clearfix"></div>
                </div>

            </div>			
        </div>
        <!---->

        <!--banner-->
        <div class="banner-top">
            <div class="container">
                <h3 >Profile</h3>
                <h4><a href="main.jsp">Home</a><label>/</label>Register</h4>
                <div class="clearfix"> </div>
            </div>
        </div>

        <!--login-->

        <div class="login">
            <div class="main-agileits">
                <div class="form-w3agile form1">
                    <h3>Profile</h3>
                    <form action="Profile" method="post">
                        Username:
                        <div class="key">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <input  type="text" value="${user.getName()}" name="name" required="">
                            <div class="clearfix"></div>
                        </div>
                        Email:        
                        <div class="key">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <input  type="text" value="${user.getEmail()}" name="email" required="">
                            <div class="clearfix"></div>
                        </div>
                        Password:
                        <div class="key">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                            <input  type="password" value="${user.getPassword()}" name="pass" required="">
                            <div class="clearfix"></div>
                        </div>
                        Job:
                        <div class="key">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <input  type="text" value="${user.getJob()}" name="job" required="">
                            <div class="clearfix"></div>
                        </div>
                        Address:       
                        <div class="key">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <input  type="text" value="${user.getAddress()}" name="address" required="">
                            <div class="clearfix"></div>
                        </div>
                        Interests:     
                        <div class="key">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <input  type="text" value="${user.getInterests()}" name="interest" required="">
                            <div class="clearfix"></div>
                        </div>
                        Date of Birth:
                        <div class="key">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <input  type="text" value="${user.getBod()}" name="dob" required="">
                            <div class="clearfix"></div>
                        </div>
                        Credit:
                        <div class="key">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <input  type="number" min="100000" max="10000" value="${user.getCredit()}" name="credit" required="">
                            <div class="clearfix"></div>
                        </div>



                        <input type="submit" value="Save">
                    </form>
                </div>

            </div>
        </div>
        <!--footer-->
        <div class="footer">
            <div class="container">
                <div class="col-md-3 footer-grid">
                    <h3>About Us</h3>
                    <p>Nam libero tempore, cum soluta nobis est eligendi 
                        optio cumque nihil impedit quo minus id quod maxime 
                        placeat facere possimus.</p>
                </div>
                <div class="col-md-3 footer-grid ">
                    <h3>Menu</h3>
                    <ul>
                        <li><a href="main.jsp">Home</a></li>
                        <li><a href="kitchen.html">Kitchen</a></li>
                        <li><a href="care.html">Personal Care</a></li>
                        <li><a href="hold.html">Household</a></li>						 
                        <li><a href="codes.html">Short Codes</a></li> 
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
                </div>
                <div class="col-md-3 footer-grid ">
                    <h3>Customer Services</h3>
                    <ul>
                        <li><a href="shipping.html">Shipping</a></li>
                        <li><a href="terms.html">Terms & Conditions</a></li>
                        <li><a href="faqs.html">Faqs</a></li>
                        <li><a href="contact.html">Contact</a></li>
                        <li><a href="offer.html">Online Shopping</a></li>						 

                    </ul>
                </div>
                <div class="col-md-3 footer-grid">
                    <h3>My Account</h3>
                    <ul>
                        <li><a href="login.html">Login</a></li>
                        <li><a href="register.jsp">Register</a></li>
                        <li><a href="wishlist.html">Wishlist</a></li>

                    </ul>
                </div>
                <div class="clearfix"></div>
                <div class="footer-bottom">
                    <h2 ><a href="main.jsp"><b>T<br>H<br>E</b>Big Store<span>The Best Supermarket</span></a></h2>
                </div>
                <div class="copy-right">
                    <p> &copy; 2018 Big store. All Rights Reserved | Design by Alaa,Omnia,Abanoub,Mohamed</a></p>
                </div>
            </div>
        </div>
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
