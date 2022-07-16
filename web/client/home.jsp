<%-- 
    Document   : home.jsp
    Created on : Jul 13, 2022, 12:55:37 AM
    Author     : kaiok
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Bellaria - a Delicious Cakes and Bakery | Home Shop</title>

        <!-- Stylesheets -->
        <link href="client/css/bootstrap.css" rel="stylesheet">
        <link href="client/plugins/revolution/css/settings.css" rel="stylesheet" type="text/css"><!-- REVOLUTION SETTINGS STYLES -->
        <link href="client/plugins/revolution/css/layers.css" rel="stylesheet" type="text/css"><!-- REVOLUTION LAYERS STYLES -->
        <link href="client/plugins/revolution/css/navigation.css" rel="stylesheet" type="text/css"><!-- REVOLUTION NAVIGATION STYLES -->

        <link href="client/css/style.css" rel="stylesheet">
        <link href="client/css/responsive.css" rel="stylesheet">

        <link rel="shortcut icon" href="client/images/favicon.png" type="image/x-icon">
        <link rel="icon" href="client/images/favicon.png" type="image/x-icon">

        <!-- Responsive -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script><![endif]-->
        <!--[if lt IE 9]><script src="js/respond.js"></script><![endif]-->
    </head>

    <body>
        <c:import url="/client/products.xml" var="products" charEncoding="UTF-8" />
        <x:parse xml="${products}" var="productlist"/>

        <div class="page-wrapper">

            <!-- Preloader -->
            <div class="preloader">
                <div class="loader_overlay"></div>
                <div class="loader_cogs">
                    <div class="loader_cogs__top">
                        <div class="top_part"></div>
                        <div class="top_part"></div>
                        <div class="top_part"></div>
                        <div class="top_hole"></div>
                    </div>
                    <div class="loader_cogs__left">
                        <div class="left_part"></div>
                        <div class="left_part"></div>
                        <div class="left_part"></div>
                        <div class="left_hole"></div>
                    </div>
                    <div class="loader_cogs__bottom">
                        <div class="bottom_part"></div>
                        <div class="bottom_part"></div>
                        <div class="bottom_part"></div>
                        <div class="bottom_hole"></div>
                    </div>
                </div>
            </div>

            <!-- Main Header-->
            <header class="main-header">
                <!-- Menu Wave -->
                <div class="menu_wave"></div>

                <!-- Main box -->
                <div class="main-box">
                    <div class="menu-box">
                        <div class="logo"><a href="home"><img src="client/images/logo.png" alt="" title=""></a></div>

                        <!--Nav Box-->
                        <div class="nav-outer clearfix">
                            <!-- Main Menu -->
                            <nav class="main-menu navbar-expand-md navbar-light">
                                <div class="collapse navbar-collapse clearfix" id="navbarSupportedContent">
                                    <ul class="navigation menu-left clearfix">
                                        <li class="current dropdown"><a href="home">Home</a>

                                        </li>
                                        <li class="dropdown"><a href="client/our-staff.jsp">Pages</a>
                                            <ul>
                                                <li><a href="client/our-staff.jsp">Our Staff</a></li>
                                                <li><a href="client/recipes-list.jsp">Recipes Grid</a></li>
                                            </ul>
                                        </li>

                                    </ul>

                                    <ul class="navigation menu-right clearfix">

                                        <li class="dropdown"><a href="home">Shop</a>
                                            <ul>
                                                <li><a href="Cart">Cart</a></li>
                                                <li><a href="checkout.html">Checkout</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="client/contact.jsp">Contacts</a></li>
                                    </ul>
                                </div>
                            </nav>
                            <!-- Main Menu End-->

                            <div class="outer-box clearfix">
                                <!-- Shoppping Car -->
                                <div class="cart-btn">
                                    <c:if test="${sessionScope.listCart != null}" >
                                        <a href="Cart"><i class="icon flaticon-commerce"></i> <span class="count">${sessionScope.listCart.size()}</span></a>
                                        </c:if>

                                    <c:if test="${sessionScope.listCart == null}" >
                                        <a href="Cart"><i class="icon flaticon-commerce"></i> <span class="count">0</span></a>
                                        </c:if>

                                    <div class="shopping-cart">
                                        <c:if test="${sessionScope.listCart.size() != null}" >
                                            <ul class="shopping-cart-items">
                                                <c:forEach var="cartItem" items="${sessionScope.listCart}">
                                                    <li class="cart-item">
                                                        <img src="${cartItem.productImage}" alt="#" class="thumb" />
                                                        <span class="item-name">${cartItem.productName}</span>
                                                        <span class="item-quantity">${cartItem.quantity} x <span class="item-amount">$${cartItem.productPrice}</span></span>
                                                        <a href="product-detail?productId=${cartItem.productId}" class="product-detail"></a>
                                                        <!--<button class="remove-item"><span class="fa fa-times"></span></button>-->
                                                    </li>
                                                </c:forEach>

                                            </ul>
                                        </c:if>
                                        <c:if test="${sessionScope.listCart == null}" >
                                            <span class="item-name">There are no product here!</span>
                                        </c:if>


                                        <div class="cart-footer">
                                            <!--<div class="shopping-cart-total"><strong>Subtotal:</strong> $97.00</div>-->
                                            <a href="Cart" class="theme-btn">View Cart</a>
                                            <a href="checkout.html" class="theme-btn">Checkout</a>
                                        </div>
                                    </div> <!--end shopping-cart -->
                                </div>

                                <!-- Search Btn -->
                                <div class="search-box">
                                    <button class="search-btn"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sticky Header  -->
                <div class="sticky-header">
                    <div class="auto-container clearfix">
                        <!--Logo-->
                        <div class="logo">
                            <a href="#" title="Sticky Logo"><img src="client/images/logo-small.png" alt="Sticky Logo"></a>
                        </div>

                        <!--Right Col-->
                        <div class="nav-outer">
                            <!--Mobile Navigation Toggler-->
                            <div class="mobile-nav-toggler"><span class="icon flaticon-menu"></span></div>

                            <!-- Main Menu -->
                            <nav class="main-menu">
                                <!--Keep This Empty / Menu will come through Javascript-->
                            </nav><!-- Main Menu End-->
                        </div>
                    </div>
                </div><!-- End Sticky Menu -->

                <!-- Sticky Header  -->
                <div class="sticky-header">
                    <div class="auto-container clearfix">
                        <!--Logo-->
                        <div class="logo">
                            <a href="#" title="Sticky Logo"><img src="client/images/logo-small.png" alt="Sticky Logo"></a>
                        </div>

                        <!--Right Col-->
                        <div class="nav-outer">
                            <!--Mobile Navigation Toggler-->
                            <div class="mobile-nav-toggler"><span class="icon flaticon-menu"></span></div>

                            <!-- Main Menu -->
                            <nav class="main-menu">
                                <!--Keep This Empty / Menu will come through Javascript-->
                            </nav><!-- Main Menu End-->
                        </div>
                    </div>
                </div><!-- End Sticky Menu -->

                <!-- Mobile Header -->
                <div class="mobile-header">
                    <div class="logo"><a href="home"><img src="client/images/logo-small.png" alt="" title=""></a></div>

                    <!--Nav Box-->
                    <div class="nav-outer clearfix">
                        <!--Keep This Empty / Menu will come through Javascript-->
                    </div>
                </div>

                <!-- Mobile Menu  -->
                <div class="mobile-menu">
                    <nav class="menu-box">
                        <div class="nav-logo"><a href="home"><img src="client/images/logo-small.png" alt="" title=""></a></div> 
                        <!--Here Menu Will Come Automatically Via Javascript / Same Menu as in Header-->
                    </nav>
                </div><!-- End Mobile Menu -->

                <!-- Header Search -->
                <div class="search-popup">
                    <span class="search-back-drop"></span>

                    <div class="search-inner">
                        <button class="close-search"><span class="fa fa-times"></span></button>
                        <form method="get" action="search">
                            <div class="form-group">
                                <input type="search" name="search-field" value="" placeholder="Search..." required="">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- End Header Search -->

            </header>
            <!--End Main Header -->

            <!--Main Slider-->
            <section class="main-slider">
                <div class="slider_wave"></div>
                <div class="rev_slider_wrapper fullwidthbanner-container"  id="rev_slider_one_wrapper" data-source="gallery">
                    <div class="rev_slider fullwidthabanner" id="rev_slider_one" data-version="5.4.1">
                        <ul>
                            <li data-index="rs-16" data-transition="zoomout" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="default" data-easeout="default" data-masterspeed="850"  data-thumb=""  data-delay="5999"  data-rotate="0"  data-saveperformance="off"  data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                                <!-- MAIN IMAGE -->
                                <img src="http://html.cwsthemes.com/bellaria/images/main-slider/home_07_slider_03.jpg"  alt="" title="Home Shop"  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
                                <!-- LAYERS -->

                                <!-- LAYER NR. 1 -->
                                <div class="tp-caption tp-shape tp-shapewrapper  tp-resizeme" 
                                     id="slide-16-layer-44" 
                                     data-x="center" data-hoffset="" 
                                     data-y="center" data-voffset="-7" 
                                     data-width="['full','full','full','full']"
                                     data-height="['full','full','full','full']" 
                                     data-type="shape" 
                                     data-basealign="slide" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":10,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                                     data-textAlign="['inherit','inherit','inherit','inherit']"
                                     data-paddingtop="[0,0,0,0]"
                                     data-paddingright="[0,0,0,0]"
                                     data-paddingbottom="[0,0,0,0]"
                                     data-paddingleft="[0,0,0,0]"
                                     style="z-index: 5;background-color:rgba(80,81,92,0.15);"> 
                                </div>

                                <!-- LAYER NR. 2 -->
                                <div class="tp-caption   tp-resizeme" 
                                     id="slide-16-layer-51" 
                                     data-x="center" data-hoffset="-120" 
                                     data-y="center" data-voffset="-97" 
                                     data-width="['none','none','none','none']"
                                     data-height="['none','none','none','none']" 
                                     data-type="image" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":500,"speed":1000,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                                     data-textAlign="['inherit','inherit','inherit','inherit']"
                                     data-paddingtop="[0,0,0,0]"
                                     data-paddingright="[0,0,0,0]"
                                     data-paddingbottom="[0,0,0,0]"
                                     data-paddingleft="[0,0,0,0]"
                                     style="z-index: 6;"><img src="client/images/main-slider/devider_home_07_icon.png" alt="" data-ww="125px" data-hh="60px" width="125" height="60" data-no-retina> 
                                </div>

                                <!-- LAYER NR. 3 -->
                                <div class="tp-caption   tp-resizeme" 
                                     id="slide-16-layer-33" 
                                     data-x="center" data-hoffset="-120" 
                                     data-y="center" data-voffset="83" 
                                     data-width="['auto']"
                                     data-height="['auto']"
                                     data-visibility="['on','on','off','off']" 
                                     data-type="text" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":500,"speed":1000,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"nothing"}]'
                                     data-textAlign="['center','center','center','center']"
                                     data-paddingtop="[0,0,0,0]"
                                     data-paddingright="[0,0,0,0]"
                                     data-paddingbottom="[0,0,0,0]"
                                     data-paddingleft="[0,0,0,0]"
                                     style="z-index: 7; white-space: nowrap; font-size: 16px; line-height: 24px; font-weight: 400; color: #ffffff; font-family:ABeeZee;">We offer now a great range of different<br> flavoured bite-size pastries and cakes 
                                </div>

                                <!-- LAYER NR. 4 -->
                                <div class="tp-caption   tp-resizeme" 
                                     id="slide-16-layer-31" 
                                     data-x="center" data-hoffset="-120" 
                                     data-y="center" data-voffset="" 
                                     data-width="['442']"
                                     data-height="['104']" 
                                     data-type="text" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":500,"speed":1000,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"nothing"}]'
                                     data-textAlign="['center','center','center','center']"
                                     data-paddingtop="[0,0,0,0]"
                                     data-paddingright="[0,0,0,0]"
                                     data-paddingbottom="[0,0,0,0]"
                                     data-paddingleft="[0,0,0,0]"
                                     style="z-index: 8; min-width: 442px; max-width: 442px; max-width: 104px; max-width: 104px; white-space: normal; font-size: 85px; line-height: 85px; font-weight: 400; color: #ffffff; font-family:Leckerli One;">Just Treats 
                                </div>

                                <!-- LAYER NR. 5 -->
                                <div class="tp-caption rev-btn " 
                                     id="slide-16-layer-49" 
                                     data-x="center" data-hoffset="-120" 
                                     data-y="center" data-voffset="163" 
                                     data-width="['auto']"
                                     data-height="['auto']" 
                                     data-type="button" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":500,"speed":1000,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"300","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgb(255,255,255);bg:rgb(75,67,66);"}]'
                                     data-textAlign="['inherit','inherit','inherit','inherit']"
                                     data-paddingtop="[12,12,12,12]"
                                     data-paddingright="[35,35,35,35]"
                                     data-paddingbottom="[12,12,12,12]"
                                     data-paddingleft="[35,35,35,35]"
                                     style="z-index: 9; white-space: nowrap; font-size: 17px; line-height: 17px; font-weight: 500; color: #4b4342; font-family:Roboto;background-color:rgba(255,255,255,0.75);border-color:rgb(75,67,66);border-style:solid;border-width:2px 2px 2px 2px;border-radius:30px 30px 30px 30px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">Shop Now 
                                </div>
                            </li>

                            <!-- SLIDE  -->
                            <li data-index="rs-17" data-transition="zoomout" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="default" data-easeout="default" data-masterspeed="850"  data-thumb=""  data-delay="5999"  data-rotate="0"  data-saveperformance="off"  data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                                <!-- MAIN IMAGE -->
                                <img src="http://html.cwsthemes.com/bellaria/images/main-slider/home_07_slider_02.jpg"  alt="" title="Home Shop"  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
                                <!-- LAYERS -->

                                <!-- LAYER NR. 6 -->
                                <div class="tp-caption tp-shape tp-shapewrapper  tp-resizeme" 
                                     id="slide-17-layer-44" 
                                     data-x="center" data-hoffset="" 
                                     data-y="center" data-voffset="-7" 
                                     data-width="['full','full','full','full']"
                                     data-height="['full','full','full','full']" 
                                     data-type="shape" 
                                     data-basealign="slide" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":10,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                                     data-textAlign="['inherit','inherit','inherit','inherit']"
                                     data-paddingtop="[0,0,0,0]"
                                     data-paddingright="[0,0,0,0]"
                                     data-paddingbottom="[0,0,0,0]"
                                     data-paddingleft="[0,0,0,0]"
                                     style="z-index: 5;background-color:rgba(80,81,92,0.15);"> 
                                </div>

                                <!-- LAYER NR. 7 -->
                                <div class="tp-caption   tp-resizeme" 
                                     id="slide-17-layer-51" 
                                     data-x="center" data-hoffset="" 
                                     data-y="center" data-voffset="-97" 
                                     data-width="['none','none','none','none']"
                                     data-height="['none','none','none','none']" 
                                     data-type="image" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":500,"speed":1010,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                                     data-textAlign="['inherit','inherit','inherit','inherit']"
                                     data-paddingtop="[0,0,0,0]"
                                     data-paddingright="[0,0,0,0]"
                                     data-paddingbottom="[0,0,0,0]"
                                     data-paddingleft="[0,0,0,0]"
                                     style="z-index: 6;"><img src="client/images/main-slider/devider_home_07_icon.png" alt="" data-ww="125px" data-hh="60px" width="125" height="60" data-no-retina>
                                </div>

                                <!-- LAYER NR. 8 -->
                                <div class="tp-caption   tp-resizeme" 
                                     id="slide-17-layer-33" 
                                     data-x="center" data-hoffset="1" 
                                     data-y="center" data-voffset="82" 
                                     data-width="['auto']"
                                     data-height="['auto']"
                                     data-visibility="['on','on','off','off']" 
                                     data-type="text" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":500,"speed":1000,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"nothing"}]'
                                     data-textAlign="['center','center','center','center']"
                                     data-paddingtop="[0,0,0,0]"
                                     data-paddingright="[0,0,0,0]"
                                     data-paddingbottom="[0,0,0,0]"
                                     data-paddingleft="[0,0,0,0]"
                                     style="z-index: 7; white-space: nowrap; font-size: 16px; line-height: 24px; font-weight: 400; color: #ffffff; font-family:ABeeZee;">We offer now a great range of different<br> flavoured bite-size pastries and cakes 
                                </div>

                                <!-- LAYER NR. 9 -->
                                <div class="tp-caption   tp-resizeme" 
                                     id="slide-17-layer-31" 
                                     data-x="center" data-hoffset="" 
                                     data-y="center" data-voffset="" 
                                     data-width="['442']"
                                     data-height="['104']" 
                                     data-type="text" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":500,"speed":1000,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"nothing"}]'
                                     data-textAlign="['center','center','center','center']"
                                     data-paddingtop="[0,0,0,0]"
                                     data-paddingright="[0,0,0,0]"
                                     data-paddingbottom="[0,0,0,0]"
                                     data-paddingleft="[0,0,0,0]"
                                     style="z-index: 8; min-width: 442px; max-width: 442px; max-width: 104px; max-width: 104px; white-space: normal; font-size: 85px; line-height: 85px; font-weight: 400; color: #ffffff; font-family:Leckerli One;">Just Treats 
                                </div>

                                <!-- LAYER NR. 10 -->
                                <div class="tp-caption rev-btn " 
                                     id="slide-17-layer-49" 
                                     data-x="center" data-hoffset="-1" 
                                     data-y="center" data-voffset="163" 
                                     data-width="['auto']"
                                     data-height="['auto']" 
                                     data-type="button" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":500,"speed":1000,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"300","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgb(255,255,255);bg:rgb(75,67,66);"}]'
                                     data-textAlign="['inherit','inherit','inherit','inherit']"
                                     data-paddingtop="[12,12,12,12]"
                                     data-paddingright="[35,35,35,35]"
                                     data-paddingbottom="[12,12,12,12]"
                                     data-paddingleft="[35,35,35,35]"
                                     style="z-index: 9; white-space: nowrap; font-size: 17px; line-height: 17px; font-weight: 500; color: #4b4342; font-family:Roboto;background-color:rgba(255,255,255,0.75);border-color:rgb(75,67,66);border-style:solid;border-width:2px 2px 2px 2px;border-radius:30px 30px 30px 30px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">Shop Now 
                                </div>
                            </li>

                            <!-- SLIDE  -->
                            <li data-index="rs-18" data-transition="zoomout" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="default" data-easeout="default" data-masterspeed="850"  data-thumb=""  data-delay="5999"  data-rotate="0"  data-saveperformance="off"  data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                                <!-- MAIN IMAGE -->
                                <img src="http://html.cwsthemes.com/bellaria/images/main-slider/home_07_slider_01.jpg"  alt="" title="Home Shop"  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
                                <!-- LAYERS -->

                                <!-- LAYER NR. 11 -->
                                <div class="tp-caption tp-shape tp-shapewrapper  tp-resizeme" 
                                     id="slide-18-layer-44" 
                                     data-x="center" data-hoffset="" 
                                     data-y="center" data-voffset="-7" 
                                     data-width="['full','full','full','full']"
                                     data-height="['full','full','full','full']" 
                                     data-type="shape" 
                                     data-basealign="slide" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":10,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                                     data-textAlign="['inherit','inherit','inherit','inherit']"
                                     data-paddingtop="[0,0,0,0]"
                                     data-paddingright="[0,0,0,0]"
                                     data-paddingbottom="[0,0,0,0]"
                                     data-paddingleft="[0,0,0,0]"
                                     style="z-index: 5;background-color:rgba(80,81,92,0.15);"> 
                                </div>

                                <!-- LAYER NR. 12 -->
                                <div class="tp-caption   tp-resizeme" 
                                     id="slide-18-layer-51" 
                                     data-x="center" data-hoffset="" 
                                     data-y="center" data-voffset="-97" 
                                     data-width="['none','none','none','none']"
                                     data-height="['none','none','none','none']" 
                                     data-type="image" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":500,"speed":1010,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                                     data-textAlign="['inherit','inherit','inherit','inherit']"
                                     data-paddingtop="[0,0,0,0]"
                                     data-paddingright="[0,0,0,0]"
                                     data-paddingbottom="[0,0,0,0]"
                                     data-paddingleft="[0,0,0,0]"
                                     style="z-index: 6;"><img src="client/images/main-slider/devider_home_07_icon.png" alt="" data-ww="125px" data-hh="60px" width="125" height="60" data-no-retina> 
                                </div>

                                <!-- LAYER NR. 13 -->
                                <div class="tp-caption   tp-resizeme" 
                                     id="slide-18-layer-33" 
                                     data-x="center" data-hoffset="" 
                                     data-y="center" data-voffset="82" 
                                     data-width="['auto']"
                                     data-height="['auto']"
                                     data-visibility="['on','on','off','off']" 
                                     data-type="text" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":500,"speed":1000,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"nothing"}]'
                                     data-textAlign="['center','center','center','center']"
                                     data-paddingtop="[0,0,0,0]"
                                     data-paddingright="[0,0,0,0]"
                                     data-paddingbottom="[0,0,0,0]"
                                     data-paddingleft="[0,0,0,0]"
                                     style="z-index: 7; white-space: nowrap; font-size: 16px; line-height: 24px; font-weight: 400; color: #ffffff; font-family:ABeeZee;">We offer now a great range of different<br> flavoured bite-size pastries and cakes 
                                </div>

                                <!-- LAYER NR. 14 -->
                                <div class="tp-caption   tp-resizeme" 
                                     id="slide-18-layer-31" 
                                     data-x="center" data-hoffset="" 
                                     data-y="center" data-voffset="" 
                                     data-width="['442']"
                                     data-height="['104']" 
                                     data-type="text" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":500,"speed":1000,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"nothing"}]'
                                     data-textAlign="['center','center','center','center']"
                                     data-paddingtop="[0,0,0,0]"
                                     data-paddingright="[0,0,0,0]"
                                     data-paddingbottom="[0,0,0,0]"
                                     data-paddingleft="[0,0,0,0]"
                                     style="z-index: 8; min-width: 442px; max-width: 442px; max-width: 104px; max-width: 104px; white-space: normal; font-size: 85px; line-height: 85px; font-weight: 400; color: #ffffff; font-family:Leckerli One;">Just Treats 
                                </div>

                                <!-- LAYER NR. 15 -->
                                <div class="tp-caption rev-btn " 
                                     id="slide-18-layer-49" 
                                     data-x="center" data-hoffset="-1" 
                                     data-y="center" data-voffset="163" 
                                     data-width="['auto']"
                                     data-height="['auto']" 
                                     data-type="button" 
                                     data-responsive_offset="on" 
                                     data-frames='[{"delay":500,"speed":1000,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"300","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgb(255,255,255);bg:rgb(75,67,66);"}]'
                                     data-textAlign="['inherit','inherit','inherit','inherit']"
                                     data-paddingtop="[12,12,12,12]"
                                     data-paddingright="[35,35,35,35]"
                                     data-paddingbottom="[12,12,12,12]"
                                     data-paddingleft="[35,35,35,35]"
                                     style="z-index: 9; white-space: nowrap; font-size: 17px; line-height: 17px; font-weight: 500; color: #4b4342; font-family:Roboto;background-color:rgba(255,255,255,0.75);border-color:rgb(75,67,66);border-style:solid;border-width:2px 2px 2px 2px;border-radius:30px 30px 30px 30px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">Shop Now 
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!--End Main Slider-->

            <!--Sidebar Page Container-->
            <div class="sidebar-page-container">
                <div class="auto-container">
                    <div class="row clearfix">
                        <!--Content Side-->
                        <div class="content-side col-lg-9 col-md-12 col-sm-12">
                            <div class="our-shop">
                                <div class="row clearfix">
                                    <!--  Shop Item -->
                                    <c:forEach items="${listProduct}" var="p">
                                        <div class="shop-item col-lg-4 col-md-6 col-sm-12" id="1">
                                            <div class="inner-box">
                                                <div class="image-box">
                                                    <figure class="image"><a href="product-detail?productId=${p.id}"><img src="${p.image}" alt=""></a></figure>
                                                    <div class="btn-box"><a href="add-to-cart?productId=${p.id}">Add To Cart</a></div>
                                                </div>
                                                <div class="lower-content clearfix">
                                                    <h4 class="name"><a href="product-detail?productId=${p.id}"></a>${p.name}</h4>
                                                    <div class="rating"><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span></div>
                                                    <div class="price">$${p.price}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>          
                            </div>
                        </div> 
                        <!--Sidebar Side-->
                        <div class="sidebar-side sticky-container col-lg-3 col-md-12 col-sm-12">
                            <aside class="sidebar theiaStickySidebar">
                                <div class="sticky-sidebar">
                                    <!-- Search Widget -->
                                    <div class="sidebar-widget search-widget">
                                        <form method="get" action="search">
                                            <div class="form-group">
                                                <input type="text" name="search-field" value="" placeholder="Search products…" required>
                                                <button type="submit"><span class="icon fa fa-search"></span></button>
                                            </div>
                                        </form>
                                    </div>

                                    <!-- Cart Widget -->
                                    <div class="sidebar-widget cart-widget">
                                        <div class="widget-content">
                                            <h3 class="widget-title">Best Selling</h3>

                                            <div class="shopping-cart">
                                                <ul class="shopping-cart-items">
                                                    <li class="cart-item">
                                                        <img src="http://html.cwsthemes.com/bellaria/images/resource/products/9.jpg" alt="#" class="thumb" />
                                                        <span class="item-name">Lemon Lollipop</span>
                                                        <span class="item-quantity"><span class="item-amount">$35.00</span></span>
                                                        <a href="product-detail?productId=9" class="product-detail"></a>
                                                        <button class="remove-item"><span class="fa fa-times"></span></button>
                                                    </li>

                                                    <li class="cart-item">
                                                        <img src="http://html.cwsthemes.com/bellaria/images/resource/products/11.jpg" alt="#" class="thumb"  />
                                                        <span class="item-name">Authentic Macaroons</span>
                                                        <span class="item-quantity"><span class="item-amount">$25.00</span></span>
                                                        <a href="product-detail?productId=12" class="product-detail"></a>
                                                        <button class="remove-item"><span class="fa fa-times"></span></button>
                                                    </li>
                                                </ul>

                                            </div> <!--end shopping-cart -->
                                        </div>
                                    </div>

                                    <!-- Tags Widget -->
                                    <div class="sidebar-widget tags-widget">
                                        <h3 class="widget-title">Tags</h3>
                                        <ul class="tag-list clearfix">
                                            <li><a href="tag?txtTag=Yami" >Yami</a></li>
                                            <li><a href="tag?txtTag=Premium" >Premium</a></li>
                                            <li><a href="tag?txtTag=French" >French</a></li>
                                            <li><a href="tag?txtTag=Classic" >Classic</a></li>
                                            <li><a href="tag?txtTag=Candy" >Candy</a></li>
                                            <li><a href="tag?txtTag=Happy" >Happy</a></li>
                                            <li><a href="tag?txtTag=Hearts" >Hearts</a></li>
                                            <li><a href="tag?txtTag=Coffee" >Coffee</a></li>
                                            <li><a href="tag?txtTag=Lemon" >Lemon</a></li>
                                            <li><a href="tag?txtTag=Birthday" >Birthday</a></li>
                                            <li><a href="tag?txtTag=Limo" >Limo</a></li>
                                            <li><a href="tag?txtTag=Authentic">Authentic</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Sidebar Page Container-->

            <!-- Main Footer -->
            <footer class="main-footer style-seven">
                <div class="shape_wrapper wave_up">
                    <div class="shape_inner" style="background-image: url(http://html.cwsthemes.com/bellaria/images/background/5.jpg);"><div class="overlay"></div></div>
                </div>

                <!--Widgets Section-->
                <div class="widgets-section">
                    <div class="auto-container">
                        <div class="row">
                            <!--Footer Column-->
                            <div class="footer-column col-lg-4 col-md-12 col-sm-12">
                                <div class="footer-widget social-widget">
                                    <div class="widget-title">
                                        <h3>Our Contacts</h3>
                                        <svg viewBox="0 0 850.4 410.3">
                                        <path d="M351.6,300.8c45.5,20.8,90.4,42.8,136.4,62.5c23,9.8,43.7,15,68.7,16.8c24.2,1.7,26.9-11.4,47.7-17.2 c36.4-10.2,50.6,30.7,12.4,39.4c-47,10.7-90.1,11.7-135.8-5.3c-43.6-16.2-84-40.4-125.5-61.1c-19.3-9.6-41-21.4-63.2-19.4 c-25.3,2.3-48.4,14.1-74.3,15.3c-33.4,1.5-101.6-4.4-107.8-47.3c-8-55.4,62.8-44,94.4-37.5c27.8,5.7,54.3,16.5,81.9,22 c27.9,5.7,49.2-4.2,74.5-15.3c49.2-21.6,108.5-37,152.6-67.4c-73-44.3-144.1-91.2-222.1-126.4c-68.4-30.9-157.2-64-226-12.7 c-11.1,8.3-20.3,19.6-26,32.2c-6.4,14-2.7,29.4-7.8,42.9C27.4,133.4,16,141,4.9,129.5c-10.1-10.4-2-33.4,2.1-44.6 C28.2,27.4,86.9,0.5,145,0c78.1-0.7,153.1,31.3,222.4,64.4c35.5,16.9,70.1,35.7,103.2,56.8c30.6,19.5,61.9,54.4,100.8,39.3 c68.6-26.4,131.4-75.9,210-57.7c57.6,13.4,99.3,84.7,40.5,125.7c-32.5,22.7-74.6,30.1-113.6,30c-42.6-0.1-77.9-19.1-117-32.7 c-41.5-14.4-84.9,10.2-124.1,24.2C448.9,256.6,351.9,281.1,351.6,300.8z M604.7,191.1c24.8,28.8,71.1,34.9,107.4,34.4 c31.8-0.4,94.3-7.9,110.4-41.2c23.9-49.5-49.1-56-77.9-51.8C695.1,139.9,649,169.4,604.7,191.1z M131.1,283.8 c25.5,27.4,91,30.7,122.6,7.1C212.6,263.8,153.1,259.8,131.1,283.8z"></path>
                                        </svg>
                                    </div>

                                    <div class="text-box">
                                        <p>Đại Học FPT Hòa Lạc <br>Hello Word</p>
                                        <p><a href="tel:305-333-5522">(037) 566-1741</a></p>
                                        <p><a href="mailto:info@your-site.com">absite@fpt.edu.vn</a></p>
                                    </div>

                                    <div class="social-box">
                                        <ul class="social-icon-two">
                                            <li><a href="#"><span class="fab fa-facebook-f"></span></a></li>
                                            <li><a href="#"><span class="fab fa-pinterest-p"></span></a></li>
                                            <li><a href="#"><span class="fab fa-twitter"></span></a></li>
                                            <li><a href="#"><span class="fab fa-instagram"></span></a></li>
                                            <li><a href="#"><span class="fab fa-dribbble"></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <!--Footer Column-->
                            <div class="footer-column col-lg-4 col-md-12 col-sm-12">
                                <div class="footer-widget gallery-widget">
                                    <div class="widget-title">
                                        <h3>Made For You</h3>
                                        <svg viewBox="0 0 850.4 410.3">
                                        <path d="M351.6,300.8c45.5,20.8,90.4,42.8,136.4,62.5c23,9.8,43.7,15,68.7,16.8c24.2,1.7,26.9-11.4,47.7-17.2 c36.4-10.2,50.6,30.7,12.4,39.4c-47,10.7-90.1,11.7-135.8-5.3c-43.6-16.2-84-40.4-125.5-61.1c-19.3-9.6-41-21.4-63.2-19.4 c-25.3,2.3-48.4,14.1-74.3,15.3c-33.4,1.5-101.6-4.4-107.8-47.3c-8-55.4,62.8-44,94.4-37.5c27.8,5.7,54.3,16.5,81.9,22 c27.9,5.7,49.2-4.2,74.5-15.3c49.2-21.6,108.5-37,152.6-67.4c-73-44.3-144.1-91.2-222.1-126.4c-68.4-30.9-157.2-64-226-12.7 c-11.1,8.3-20.3,19.6-26,32.2c-6.4,14-2.7,29.4-7.8,42.9C27.4,133.4,16,141,4.9,129.5c-10.1-10.4-2-33.4,2.1-44.6 C28.2,27.4,86.9,0.5,145,0c78.1-0.7,153.1,31.3,222.4,64.4c35.5,16.9,70.1,35.7,103.2,56.8c30.6,19.5,61.9,54.4,100.8,39.3 c68.6-26.4,131.4-75.9,210-57.7c57.6,13.4,99.3,84.7,40.5,125.7c-32.5,22.7-74.6,30.1-113.6,30c-42.6-0.1-77.9-19.1-117-32.7 c-41.5-14.4-84.9,10.2-124.1,24.2C448.9,256.6,351.9,281.1,351.6,300.8z M604.7,191.1c24.8,28.8,71.1,34.9,107.4,34.4 c31.8-0.4,94.3-7.9,110.4-41.2c23.9-49.5-49.1-56-77.9-51.8C695.1,139.9,649,169.4,604.7,191.1z M131.1,283.8 c25.5,27.4,91,30.7,122.6,7.1C212.6,263.8,153.1,259.8,131.1,283.8z"></path>
                                        </svg>
                                    </div>

                                    <div class="instagram-gallery">
                                        <div class="outer-box clearfix">
                                            <figure class="image"><a href="http://html.cwsthemes.com/bellaria/images/resource/gw-7.jpg" class="lightbox-image" data-fancybox='instagram'><img src="http://html.cwsthemes.com/bellaria/images/resource/gw-7.jpg" alt=""></a></figure>

                                            <figure class="image"><a href="http://html.cwsthemes.com/bellaria/images/resource/gw-8.jpg" class="lightbox-image" data-fancybox='instagram'><img src="http://html.cwsthemes.com/bellaria/images/resource/gw-8.jpg" alt=""></a></figure>

                                            <figure class="image"><a href="http://html.cwsthemes.com/bellaria/images/resource/gw-9.jpg" class="lightbox-image" data-fancybox='instagram'><img src="http://html.cwsthemes.com/bellaria/images/resource/gw-9.jpg" alt=""></a></figure>

                                            <figure class="image"><a href="http://html.cwsthemes.com/bellaria/images/resource/gw-10.jpg" class="lightbox-image" data-fancybox='instagram'><img src="http://html.cwsthemes.com/bellaria/images/resource/gw-10.jpg" alt=""></a></figure>

                                            <figure class="image"><a href="http://html.cwsthemes.com/bellaria/images/resource/gw-11.jpg" class="lightbox-image" data-fancybox='instagram'><img src="http://html.cwsthemes.com/bellaria/images/resource/gw-11.jpg" alt=""></a></figure>

                                            <figure class="image"><a href="http://html.cwsthemes.com/bellaria/images/resource/gw-12.jpg" class="lightbox-image" data-fancybox='instagram'><img src="http://html.cwsthemes.com/bellaria/images/resource/gw-12.jpg" alt=""></a></figure>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--Footer Column-->
                            <div class="footer-column col-lg-4 col-md-12 col-sm-12">
                                <div class="footer-widget contact-widget">
                                    <div class="widget-title">
                                        <h3>Order Your Sweet</h3>
                                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewBox="0 0 850.4 410.3">
                                        <path d="M351.6,300.8c45.5,20.8,90.4,42.8,136.4,62.5c23,9.8,43.7,15,68.7,16.8c24.2,1.7,26.9-11.4,47.7-17.2 c36.4-10.2,50.6,30.7,12.4,39.4c-47,10.7-90.1,11.7-135.8-5.3c-43.6-16.2-84-40.4-125.5-61.1c-19.3-9.6-41-21.4-63.2-19.4 c-25.3,2.3-48.4,14.1-74.3,15.3c-33.4,1.5-101.6-4.4-107.8-47.3c-8-55.4,62.8-44,94.4-37.5c27.8,5.7,54.3,16.5,81.9,22 c27.9,5.7,49.2-4.2,74.5-15.3c49.2-21.6,108.5-37,152.6-67.4c-73-44.3-144.1-91.2-222.1-126.4c-68.4-30.9-157.2-64-226-12.7 c-11.1,8.3-20.3,19.6-26,32.2c-6.4,14-2.7,29.4-7.8,42.9C27.4,133.4,16,141,4.9,129.5c-10.1-10.4-2-33.4,2.1-44.6 C28.2,27.4,86.9,0.5,145,0c78.1-0.7,153.1,31.3,222.4,64.4c35.5,16.9,70.1,35.7,103.2,56.8c30.6,19.5,61.9,54.4,100.8,39.3 c68.6-26.4,131.4-75.9,210-57.7c57.6,13.4,99.3,84.7,40.5,125.7c-32.5,22.7-74.6,30.1-113.6,30c-42.6-0.1-77.9-19.1-117-32.7 c-41.5-14.4-84.9,10.2-124.1,24.2C448.9,256.6,351.9,281.1,351.6,300.8z M604.7,191.1c24.8,28.8,71.1,34.9,107.4,34.4 c31.8-0.4,94.3-7.9,110.4-41.2c23.9-49.5-49.1-56-77.9-51.8C695.1,139.9,649,169.4,604.7,191.1z M131.1,283.8 c25.5,27.4,91,30.7,122.6,7.1C212.6,263.8,153.1,259.8,131.1,283.8z"></path>
                                        </svg>
                                    </div>

                                    <div class="footer-form">
                                        <form action="#" method="post" id="email-form">
                                            <div class="form-group">
                                                <div class="response"></div>
                                            </div>

                                            <div class="form-group">
                                                <input type="text" name="username" class="username" placeholder="Your Name *">
                                            </div>

                                            <div class="form-group">
                                                <input type="email" name="email" class="email" placeholder="Your Email *">
                                            </div>

                                            <div class="form-group">
                                                <textarea name="contact_message" placeholder="Text Message"></textarea>
                                            </div>

                                            <div class="form-group">
                                                <button class="theme-btn" type="button" id="submit" name="submit-form">Send</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Footer Bottom-->
                <div class="footer-bottom">
                    <div class="auto-container">
                        <div class="copyright-text">
                            <p>Bellaria - A Delicious Cakes and Bakery ABboy</p>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- End Footer -->

        </div><!-- End Page Wrapper -->

        <!-- Scroll To Top -->
        <div class="scroll-to-top scroll-to-target" data-target="html">
            <svg viewBox="0 0 500 500">
            <path d="M488.5,274.5L488.5,274.5l1.8-0.5l-2,0.5c-2.4-8.7-4.5-16.9-4.5-24.5c0-8,2.3-16.5,4.7-25.5
                  c3.5-13,7.1-26.5,3.7-39.5c-3.6-13.2-13.5-23.1-23.1-32.7c-6.5-6.5-12.6-12.6-16.6-19.4c-3.9-6.8-6.1-15.2-8.5-24.1
                  c-3.5-13.1-7.1-26.7-16.7-36.3c-9.5-9.5-22.9-13.1-35.9-16.6c-9-2.4-17.5-4.6-24.4-8.7c-6.5-3.8-12.5-9.8-18.9-16.2
                  c-9.7-9.8-19.6-19.8-33.2-23.4c-13.5-3.7-27.3,0.1-40.4,3.7c-8.7,2.4-16.9,4.6-24.5,4.6c-8,0-16.5-2.3-25.5-4.7
                  c-9.3-2.5-18.8-5-28.1-5c-3.8,0-7.6,0.4-11.3,1.4C172,11.1,162,21.1,152.4,30.7c-6.5,6.5-12.6,12.6-19.4,16.6
                  c-6.8,3.9-15.2,6.1-24.1,8.5c-13.1,3.5-26.7,7.1-36.3,16.7c-9.5,9.5-13.1,23-16.6,36c-2.4,9-4.6,17.5-8.7,24.4
                  c-3.8,6.5-9.8,12.5-16.2,18.9c-9.8,9.7-19.7,19.6-23.4,33.2c-3.7,13.5,0.1,27.3,3.7,40.5c2.4,8.7,4.6,16.9,4.6,24.5
                  c0,8-2.3,16.5-4.6,25.5c-3.5,13-7.1,26.6-3.7,39.5c3.6,13.2,13.5,23.1,23.1,32.7c6.5,6.5,12.6,12.6,16.6,19.4
                  c3.9,6.8,6.1,15.1,8.5,24c3.5,13.1,7.1,26.8,16.7,36.4c9.5,9.5,23,13.1,35.9,16.6c9,2.4,17.5,4.6,24.4,8.7
                  c6.5,3.8,12.5,9.8,18.9,16.2c9.7,9.8,19.6,19.8,33.2,23.5c3.8,1,7.6,1.5,11.8,1.5c9.6,0,19.3-2.7,28.5-5.1c8.8-2.4,17-4.6,24.5-4.6 c8,0,16.5,2.3,25.5,4.6c13,3.6,26.6,7.1,39.5,3.7c13.2-3.6,23.1-13.5,32.7-23.1c6.5-6.5,12.6-12.6,19.4-16.6 c6.7-3.9,15.1-6.1,24-8.5c13.1-3.5,26.8-7.1,36.4-16.8c9.5-9.5,13.1-23,16.6-36c2.4-9,4.6-17.5,8.7-24.4c3.8-6.5,9.8-12.5,16.2-18.9 c9.8-9.7,19.9-19.7,23.6-33.3C495.7,301.4,494.4,287.7,488.5,274.5z"></path>
            </svg>
            <span class="fa fa-angle-up"></span>
        </div>

        <script src="client/js/jquery.js"></script> 
        <script src="client/js/popper.min.js"></script>
        <script src="client/js/bootstrap.min.js"></script>
        <script src="client/js/jquery-ui.min.js"></script> 
        <!--Revolution Slider-->
        <script src="client/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script src="client/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="client/plugins/revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script src="client/plugins/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script src="client/plugins/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script src="client/plugins/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script src="client/plugins/revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script src="client/plugins/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script src="client/plugins/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script src="client/plugins/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script src="client/plugins/revolution/js/extensions/revolution.extension.video.min.js"></script>
        <script src="client/js/main-slider-script.js"></script>
        <!--Revolution Slider-->
        <script src="client/js/jquery.fancybox.js"></script>
        <script src="client/js/owl.js"></script>
        <script src="client/js/wow.js"></script>
        <script src="client/js/appear.js"></script>
        <script src="client/js/sticky_sidebar.min.js"></script>
        <script src="client/js/script.js"></script>
    </body>
</html>
