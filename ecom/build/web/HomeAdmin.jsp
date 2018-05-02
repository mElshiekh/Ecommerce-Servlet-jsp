<%-- 
    Document   : main
    Created on : Feb 6, 2018, 6:41:33 PM
    Author     : Alaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>]
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Big store a Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template| Home :: w3layouts</title>
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
        <!--<script type="text/javascript" src="js/easing.js"></script>
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
        <c:if test="${userAdmin.email!='admin'}">
        <c:redirect url="index"></c:redirect>
    </c:if>
    <c:if test="${userAdmin.password!='admin'}">
        <c:redirect url="index"></c:redirect>
    </c:if>
        <img src="images/download.png" class="img-head" alt="">
        <div class="header">

            <div class="container">

                <div class="logo">
                    <h1 ><a href="HomeAdmin"><b>T<br>H<br>E</b>Big Store<span>The Best Supermarket</span></a></h1>
                </div>
                <c:choose>
                    <c:when test="${userAdmin.email=='admin'}">
                        <a href="Logout"><i class="fa fa-arrow-left" aria-hidden="true"></i>Logout</a>
                        <a href="showAllUsers"><i class="fa fa-file-text" aria-hidden="true"></i>Show All Users</a>
                        <a href="addproducts.jsp"><i class="fa fa-coffee" aria-hidden="true"></i>Add Product</a>


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
                                <li class=" active"><a href="HomeAdmin" class="hyper "><span>Home</span></a></li>
                                <li name="allcat" id="allcat" value ="allcat" onclick="getCat(this)"><a class="hyper"><span>all</span></a></li>                               
                                    <c:forEach items="${categories}" var="category">
                                    <li  style="cursor: pointer;" name="${category}" id="${category}" value ="${category}" onclick="getCat(this)"><a class="hyper"><span><c:out value="${category}"/></span></a></li>
                                            </c:forEach>
                                <li name="maxP" ><a class="hyper" ><span><input type="text" placeholder="Max price" style="color: black;" id="maxP"/></span></a></li>
                                <li name="maxPBut" ><a class="hyper" ><span><input type="button" value="Search" onclick="searchP()" style="background: #fdb515; color: #FFFFFF; text-align: center;border: none; font-size: 1em; outline: none;cursor: pointer;" id="maxPBut" on/></span></a></li>
                            </ul>   

                        </div>

                    </nav>

<!--                    <div class="cart" >

                        <a href="Cart" ><span class="fa fa-shopping-cart my-cart-icon"><span class="badge badge-notify my-cart-badge"></span></span></a>
                    </div>-->
                    <div class="clearfix"></div>
                </div>

            </div>			
        </div>
        <div data-vide-bg="video/video">
            <div class="container">
                <div class="banner-info">
                    <h3>Welcome to Big Store </h3>	
                    <div class="search-form">
                        <form>
                            <input type="text" placeholder="Search..." value="" id="searchtxt">
                            <input type="button" value=" " onclick="searchFor()">
                        </form>
                    </div>		
                </div>	
            </div>
        </div>
        <script>
            function searchFor() {
                txt = document.getElementById("searchtxt").value;
                if (txt != "") {
            <c:forEach items="${categories}" var="category">
                    arr = document.getElementsByName("${category}");
                    for (var i = 0; i < arr.length; i++) {
                        arr[i].hidden = true;
                    }
            </c:forEach>
            <c:forEach items="${products}" var="prod">
                <c:if test="${prod.quantity>-1}">
                    p = document.getElementById("${prod.name}").id;
                    if (String(p).indexOf(txt) >= 0) {
                        document.getElementById("${prod.name}").hidden = false;
                    }
                </c:if>
            </c:forEach>
                }
                if (txt == "") {
            <c:forEach items="${categories}" var="category">
                    arr = document.getElementsByName("${category}");
                    for (var i = 0; i < arr.length; i++) {
                        arr[i].hidden = false;
                    }
            </c:forEach>
                }
            }

        </script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.1.min.js"><\/script>')</script>
        <script src="js/jquery.vide.min.js"></script>

        <!--content-->
        <div class="content-mid">
            <div class="container ">
                <div class="spec ">
                    <h3>Products</h3>
                    <div class="ser-t">
                        <b></b>
                        <span><i></i></span>
                        <b class="line"></b>
                    </div>
                </div>
                <div class="tab-head ">
                    <nav class="nav-sidebar">
                        <ul class="nav tabs ">

                        </ul>
                    </nav>

                    <div class=" tab-content tab-content-t ">
                        <div class="tab-pane active text-style" id="tab1">
                            <div class=" con-w3l">

                                <c:forEach items="${products}" var="product">
                                    <c:if test="${product.quantity>-1}">
                                        <div class="col-md-3 m-wthree" name = "${product.category}" id="${product.name}" price="${product.quantity}">
                                            <div class="col-m">								
                                                <a data-toggle="modal" data-target="#myModal1" class="offer-img">
                                                    <img src="images/${product.image}" class="img-responsive"  style="height: 140px; width: 210px;" alt="">
                                                    <div class="offer"><p><span><c:out value="${product.category}"/></span></p></div>
                                                </a>
                                                <div class="mid-1">
                                                    <div class="women">
                                                        <h6><c:out value="${product.name}"/></h6>							
                                                    </div>
                                                    <div><h7><span style="color: green">Description: </span><div  style="overflow-y: scroll; height: 40px; word-wrap: break-word;"> <c:out value="${product.description}"/></div></h7></div>
                                                    <h7><span style="color: green">Avaialable pieces: </span><c:out value="${product.quantity}"/></h7>
                                                    <div class="mid-2">
                                                        <p ><em class="item_price">$<c:out value="${product.price}"/></em></p>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="add">
                                                       
                                                                <a href="EditProductServ?prodId=${product.id}" class="btn btn-danger my-cart-btn my-cart-b " value="${product.id}"  id="${product.id}" data-id="${product.id}" data-name="${product.name}" data-price="${product.price}" data-quantity="1" data-image="images/of.png">Edit Product</a>
                                                    </div>

                                                </div>
      
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>

                                <script>
                                    function plzLogin(){
                                        alert("Please Login");
                                    }
                                    function searchP() {
                                        price = parseInt(document.getElementById("maxP").value);
                                    <c:forEach items="${categories}" var="category">
                                        arr = document.getElementsByName("${category}");
                                        for (var i = 0; i < arr.length; i++) {
                                            arr[i].hidden = false;
                                        }
                                    </c:forEach>
                                    <c:forEach items="${products}" var="product">
                                        <c:if test="${product.quantity>-1}">
                                        if (price < ${product.price}) {
                                            document.getElementById("${product.name}").hidden = true;
                                        }
                                        </c:if>
                                    </c:forEach>
                                    }
                                    function getCat(x) {
                                        categ = x.firstChild.firstChild.textContent;
                                        if (String(categ) != null) {
                                    <c:forEach items="${categories}" var="category">
                                            arr = document.getElementsByName("${category}");
                                            for (var i = 0; i < arr.length; i++) {
                                                arr[i].hidden = true;
                                            }
                                    </c:forEach>
                                            var elems = document.getElementsByName(categ);
                                            for (var i = 0; i < elems.length; i++) {
                                                elems[i].hidden = false;
                                            }
                                            if (categ == "all") {
                                    <c:forEach items="${categories}" var="category">
                                                arr = document.getElementsByName("${category}");
                                                for (var i = 0; i < arr.length; i++) {
                                                    arr[i].hidden = false;
                                                }
                                    </c:forEach>
                                            }

                                    <%--document.getElementsByName("clothes")[0].style.visibility = "hidden";--%>
                                        }
                                    }
                                </script>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>  
         <div class="footer">
              <div align="center" >
                    <a href="aboutAdmin.jsp"> <h3>About Us</h3></a>
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
