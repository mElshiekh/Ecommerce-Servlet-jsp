<%-- 
    Document   : editProducts
    Created on : Feb 12, 2018, 1:54:48 PM
    Author     : Java Champion 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
    <c:if test="${userAdmin.email!='admin'}">
        <c:redirect url="index"></c:redirect>
    </c:if>
    <c:if test="${userAdmin.password!='admin'}">
        <c:redirect url="index"></c:redirect>
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
<!-- js -->
   <script src="js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
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
<a href="offer.html"><img src="images/download.png" class="img-head" alt=""></a>
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
			<div class="head-t">
					
			</div>
			
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
		<h3 >Edit Product</h3>
                <h4><a href="HomeAdmin">Home</a><label>/</label>Edit product</h4> 
                <div class="clearfix"> </div>
	</div>
</div>

<!--login-->

	<div class="login">
		<div class="main-agileits">
				<div class="form-w3agile form1">
					<h3>Edit Product</h3>
                                       
					<form action="updateProductServ?prodId=${product.id}"   id="usrform" enctype="multipart/form-data" method="post">
                                                Product Name:
						<div class="key">
							<i  aria-hidden="true"></i>
                                                       <input type="text" name="ProductName" maxlength="25" value="${product.name}" required="">
						       <div class="clearfix"></div>
						</div>
                                                Product Category:
						<div class="key">
							<i  aria-hidden="true"></i>
							<input  type="text" name="ProductCategory" maxlength="14" value="${product.category}" required="">
							<div class="clearfix"></div>
						</div>
                                                Product Price:
						<div class="key">
							<i  aria-hidden="true"></i>
							<input  type="number" maxlength="7" name="ProductPrice" size="50" value="${product.price}">
							<div class="clearfix"></div>
						</div>
						
                                               Product Quantity:
                                            <div class="key">
							<i  aria-hidden="true"></i>
							<input  type="number" maxlength="7" name="ProductQuantity" size="50" value="${product.quantity}" required="">
							<div class="clearfix"></div>
						</div>
                                              Product Description:          
                                              
							
							<textarea name="ProductDescription"  rows="4" cols="44"  form="usrform">${product.description}</textarea>
							
						 
                                         
                                               Product Photo:
                                            
							<input  type="file" name="photo"  placeholder="Upload Your Image" required="" >
							<div class="clearfix"></div>
						
                                                        <br><br>
                                                        <p style="text-align: center;"><input type="submit" value="Submit"></p> 
					</form>
                                                        <br/> 
                                              <form action="deleteProductServ"   id="usrform" enctype="multipart/form-data">
                                            <p style="text-align: center; color: red;">Delete ${product.name}.</p>
                                            <p style="text-align: center;"> <input style="background-color: red;" type="submit" value="Delete"></p>
                                        </form>  
                                                  
                                   
				</div>
				
			</div>
		</div>
<!--footer-->
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
	<script type="text/javascript">
		$(document).ready(function() {
		/*
			var defaults = {
			containerID: 'toTop', // fading element id
			containerHoverID: 'toTopHover', // fading element hover id
			scrollSpeed: 1200,
			easingType: 'linear' 
			};
		*/								
		$().UItoTop({ easingType: 'easeOutQuart' });
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

    var goToCartIcon = function($addTocartBtn){
      var $cartIcon = $(".my-cart-icon");
      var $image = $('<img width="30px" height="30px" src="' + $addTocartBtn.data("image") + '"/>').css({"position": "fixed", "z-index": "999"});
      $addTocartBtn.prepend($image);
      var position = $cartIcon.position();
      $image.animate({
        top: position.top,
        left: position.left
      }, 500 , "linear", function() {
        $image.remove();
      });
    }

    $('.my-cart-btn').myCart({
      classCartIcon: 'my-cart-icon',
      classCartBadge: 'my-cart-badge',
      affixCartIcon: true,
      checkoutCart: function(products) {
        $.each(products, function(){
          console.log(this);
        });
      },
      clickOnAddToCart: function($addTocart){
        goToCartIcon($addTocart);
      },
      getDiscountPrice: function(products) {
        var total = 0;
        $.each(products, function(){
          total += this.quantity * this.price;
        });
        return total * 1;
      }
    });

  });
  </script>

</body>
</html>
