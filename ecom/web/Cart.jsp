<%-- 
    Document   : Cart
    Created on : Feb 11, 2018, 10:55:50 AM
    Author     : Dell Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link rel="stylesheet" href="css/jstarbox.css" type="text/css" media="screen" charset="utf-8" />
        <script type="text/javascript">

        </script>
        <!---//End-rate---->

    </head>
    <body onload="creditCh(${balance})">
        <c:if test="${user.email==null}">
        <c:redirect url="index"></c:redirect>
    </c:if>
    <c:if test="${user.password==null}">
        <c:redirect url="index"></c:redirect>
    </c:if>
        <c:if test="${balance==-1}">
            <c:set var="balance" scope="session" value="0"/>
        </c:if>
        <a><img src="images/download.png" class="img-head" alt=""></a>
        <div class="header">

            <div class="container">
                <div class="logo">
                    <h1 ><a href="index"><b>T<br>H<br>E</b>Big Store<span>The Best Supermarket</span></a></h1>
                </div>
                <c:choose>
                    <c:when test="${user.id >=0}">
                        <a href="setProfile" ><i class="fa fa-arrow-right" aria-hidden="true"></i>Profile</a>s
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

                    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav ">
                            <li ><a href="index" class="hyper "><span>Home</span></a></li>	
                        </ul>
                    </div>
                    </nav>

                </div>

            </div>			
        </div>
        <!---->

        <!--banner-->
        <div class="banner-top">
            <div class="container">
                <h3 >Cart</h3>
                <h4><a href="index">Home</a><label>/</label>Cart</h4>
                <div class="clearfix"> </div>
            </div>
        </div>

        <!--login-->
        <c:choose>
            <c:when test="${user.id >= 0}">
                <script>
                    function setHref(x, p) {
                    x = x.toString();
                    avq = document.getElementById(p.toString() + "q").innerHTML;
                    console.log(x);
                    console.log(avq.toString());
                    if (parseInt(x) >= 0 && !x.includes(".")) {
                    if (parseInt(avq) >= parseInt(x)) {
                    lnk = document.getElementById(p.toString()).href.toString();
                    lnk = lnk.slice(0, 1 + parseInt(lnk.lastIndexOf("=")));
                    lnk = lnk.concat(x);
                    document.getElementById(p.toString()).href = lnk;
                    document.getElementById(p.toString() + "t").innerHTML = "";
                    } else {
                    document.getElementById(p.toString() + "t").innerHTML = "quantity is not avaialable";
                    }
                    } else if (x == "") {
                    lnk = document.getElementById(p.toString()).href.toString();
                    lnk = lnk.slice(0, 1 + parseInt(lnk.lastIndexOf("=")));
                    lnk = lnk.concat("0");
                    document.getElementById(p.toString()).href = lnk;
                    } else {
                    alert("invalid entry");
                    }
                    }

                </script>
                <c:choose>
                    <c:when test="${fn:length(cartx) > 0}">
                        <div class="login">
                            <div class="main-agileits">
                                <div class="form-w3agile form1">
                                    <h3>Cart</h3>
                                    <div style="color: red;" id="creditC" hidden="true">Insufficient credit</div>
                                    <form action="CheckoutSer" method="post">
                                        <table>
                                            <c:forEach items="${cartx}" var="c">
                                                <tr>
                                                    <td td style="width: 25%; border-left: 1px;">
                                                        <img onload ="setHref(${c.quantity},${c.id})" src="images/${c.image}" style="height: 140px; width: 140px; padding-bottom: 14px;padding-right: 14px"/>
                                                    </td>
                                                    <td colspan="2">
                                                        <div>${c.name}</div>
                                                        <div><h7><span style="color: green">Description: </span><div  style="overflow-y: auto; height: 40px; word-wrap: break-word;"> <c:out value="${c.description}"/></div></h7></div>
                                                        <div>Price: </div><div>${c.price}</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="key">
                                                            <input type="text"  onblur="setHref(this.value,${c.id})" placeholder="Quantity" value="${c.quantity}" style="color: black; height: 42px">
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </td>
                                                    <td><a id="${c.id}" class="hyper" href="AddToCart?prodId=${c.id}&quant=${c.quantity}" value="${c.quantity}"><span><input type="button" value="Update"  style="background: #fdb515; color: #FFFFFF; text-align: center;border: none; font-size: 1em; outline: none;cursor: pointer;" id=""/></span></a></td>
                                                </tr>
                                                <tr>
                                                    <td><span id="${c.id}t" style="color: red;"></span><span id="${c.id}q" hidden="true">${c.avQuantity}</span>  </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                        <input type="submit" value="Check out">
                                    </form>
                                    <hr>
                                    <div style="color: #090;">Total price: 
                                        <c:set var="total" scope="page" value="${0*0}"/>
                                        <c:forEach items="${cartx}" var="c">
                                             <c:set var="total" value="${total+(c.price*c.quantity)}"/>
                                        </c:forEach>
                                    <span style="color: #333;">
                                        <c:out value="${total}"/> LE
                                        </span>
                                    </div> 
                                </div>

                            </div>
                        </div>

                    </c:when>
                </c:choose>
            </c:when>
        </c:choose>
        <script>
            function creditCh(x){
            if (x == - 1){
                document.getElementById("creditC").hidden=false;
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

        <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
        <!-- //smooth scrolling -->
        <!-- for bootstrap working -->


    </body>
</html>
