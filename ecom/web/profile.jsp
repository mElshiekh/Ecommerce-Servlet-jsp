<%-- 
    Document   : profile
    Created on : Feb 8, 2018, 4:29:32 PM
    Author     : omnia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <c:if test="${user.email==null}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>
    <c:if test="${user.password==null}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>

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
                <h3 >Profile</h3>
                <h4><a href="index">Home</a><label>/</label>Register</h4>
                <div class="clearfix"> </div>
            </div>
        </div>

        <!--login-->
        <table style="width: 100%">
            <tr>
                <td style="width: 50%">
                    <div class="login" style="margin-left: 25px;">
                        <div class="main-agileits" style="width: 90%;">
                            <div class="form-w3agile form1">
                                <h3>Profile</h3>
                                <form action="Profile" method="post">
                                    Username:
                                    <div class="key">
                                        <i class="fa fa-user" maxlength="25" aria-hidden="true"></i>
                                        <input  type="text" value="${user.getName()}" name="name" required="">
                                        <div class="clearfix"></div>
                                    </div>
                                    Email:        
                                    <div class="key">
                                        <i class="fa fa-envelope" maxlength="25" aria-hidden="true"></i>
                                        <input  type="text" value="${user.getEmail()}"  name="email" required="" readonly>
                                        <div class="clearfix"></div>
                                    </div>
                                    Password:
                                    <div class="key">
                                        <i class="fa fa-lock" maxlength="25" aria-hidden="true"></i>
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
                                        <i class="fa fa-user" maxlength="25" aria-hidden="true"></i>
                                        <input  type="text" value="${user.getAddress()}" name="address" required="">
                                        <div class="clearfix"></div>
                                    </div>
                                    Interests:     
                                    <div class="key">
                                        <i class="fa fa-user" maxlength="25" aria-hidden="true"></i>
                                        <input  type="text" value="${user.getInterests()}" name="interest" required="">
                                        <div class="clearfix"></div>
                                    </div>
                                    Date of Birth:
                                    <div class="key">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        <input  type="date" value="${user.getBod()}" name="dob" required="">
                                        <div class="clearfix"></div>
                                    </div>
                                    Credit:

                                    <div class="key">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        <input  type="text" value="${user.getCredit()}" name="credit" required="" readonly>
                                        <div class="clearfix"></div>
                                    </div>
                                    <input type="submit" value="Save">
                                </form>
                            </div>

                        </div>
                    </div>
                </td>
                <td rowspan="2"
                    <div class="login" style="margin-left: 25px;">
                        <div class="main-agileits" style="width: 90%;">
                            <div class="form-w3agile form1">
                                <h3>History</h3>
                                <form style="height: 1100px; overflow-y: scroll;">
                                    <table border="2" style="border-color: #CCC">
                                        <c:forEach items="${bProds}" var="b">
                                            <tr>
                                                <td style="width: 25%; border-left: 1px;">
                                                    <img src="images/${b.image}" style="height: 140px; width: 210px; padding-right: 14px"/>
                                                </td>
                                                <td colspan="2">
                                                    <div><span style="color: green;">${b.name}</span></div>
                                                    <div><span style="color: green;">Category: </span><span>${b.category}</div>
                                                    <div><h7><span style="color: green">Description: </span><div  style="overflow-y: scroll; height: 40px; word-wrap: break-word;"> <c:out value="${b.description}"/></div></h7></div>
                                                    <div><span style="color: green;">Quantity: </span><span>${b.quantity}</span></div>
                                                    <div><span style="color: green;">Date: </span><span>${b.date}</span></div>
                                                </td>
                                                
                                            </tr>
                                            
                                        </c:forEach>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="login" style="margin-left: 25px; margin-top: -150px;">
                        <div class="main-agileits" style="width: 90%;">
                            <div class="form-w3agile form1">
                                <h3>Credit Charge</h3>
                                <form action="Charge" method="post">
                                    Card Number:
                                    <div class="key">
                                        <i class="" aria-hidden="true"></i>
                                        <input  type="text" pattern="\d*" minlength="14" maxlength="14" placeholder="Please enter the 14 numbers of scratch card" value="" name="card" required="">
                                        <div class="clearfix"></div>
                                    </div>
                                        <div style="color: red;" id="cardC" hidden="true">Invalid card</div>
                                    <input type="submit" value="Charge">
                                </form>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
                                        <script>
                                            function checkC(x){
                                                if(x==-1){
                                                    document.getElementById("cardC").hidden=false;
                                                }
                                            }
                                        </script>

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
