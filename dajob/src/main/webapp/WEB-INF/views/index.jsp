<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>DA JOB : find Direct your job</title>
	<link rel="shortcut icon" type="image/x-icon" href="/dajob/resources/images/sitelogo2_fix.png"/>
	<!-- CSS FILES -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>" media="screen" data-name="skins">

    <link rel="stylesheet"  type="text/css" href="<c:url value='/resources/css/flexslider.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/animate.css'/>"/>

    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/switcher.css'/>" media="screen" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="home">
<!--Start Header-->
	<header>
		<c:import url="./header.jsp"/>
		<!------/Flex-Slider---------/-->
        <div class="slider_block">
            <div class="flexslider top_slider">
                <ul class="slides">
                    <li class="slide1">
                        <div class="container">
                            <div class="flex_caption1 FromLeft">
                                <p class="slide-heading">누구보다 빠른 구직, DA JOB!</p><br/>
                                <p class="sub-line">내 능력 분석과 면접을 한 방에!</p><br/>
                            </div>
                            <div class="flex_caption2 FromRight"></div>
                        </div>
                    </li>
                    <li class="slide2">
                        <div class="container">
                            <div class="slide flex_caption1 FromTop">
                                <p class="slide-heading">Direct Job : DA JOB</p><br/>
                                <p class="sub-line">당신의 시간을 절약해드립니다!</p><br/>
                            </div>
                            <div class="flex_caption2 FromBottom"></div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- //Slider Wraper -->
	</header>
	<!--End Header-->
<section class="wrapper">
	<!--start info service-->
    <section class="info_service">
        <div class="container">
            <div class="row sub_content">
                <div class="col-lg-12 col-md-12 col-sm-12 wow fadeInDown">
                    <h1 class="intro text-center">DA JOB : Direct Find Your Job Place!</h1>
                    <p class="lead text-center">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa nesciunt odit sunt vitae voluptatibus. Ad animi dicta dolore et illo incidunt sint.</p>
                </div>
                <div class="rs_box wow bounceInRight" data-wow-offset="200">
                    <div class="col-sm-4 col-md-4  col-lg-4 col-sm-4 ">
                        <div class="serviceBox_1">
                            <div class="icon_service">
                                <div class="service_icon">
                                    <i class="fa fa-laptop"></i>
                                </div>
                                <h3>Modern Design</h3>
                            </div>
                            <div class="service_content">
                                <p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean commodo ligula eget dolor. Cum sociis natoque penatibus mag dis parturient.</p>
                                <a class="read" href="#">Read more</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-md-4  col-lg-4 col-sm-4 ">
                        <div class="serviceBox_1">
                            <div class="icon_service">
                                <div class="service_icon">
                                    <i class="fa fa-heart"></i>
                                </div>
                                <h3>Clean &amp; Minimal</h3>
                            </div>
                            <div class="service_content">
                                <p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean commodo ligula eget dolor. Cum sociis natoque penatibus mag dis parturient.</p>
                                <a class="read" href="#">Read more</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-md-4  col-lg-4 col-sm-4 ">
                        <div class="serviceBox_1">
                            <div class="icon_service">
                                <div class="service_icon">
                                    <i class="fa fa-trophy"></i>
                                </div>
                                <h3>Branding Theme</h3>
                            </div>
                            <div class="service_content">
                                <p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean commodo ligula eget dolor. Cum sociis natoque penatibus mag dis parturient.</p>
                                <a class="read" href="#">Read more</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row sub_content">
                <div class="rs_box wow bounceInLeft" data-wow-offset="200">
                    <div class="col-sm-4 col-md-4  col-lg-4 col-sm-4 ">
                        <div class="serviceBox_1">
                            <div class="icon_service">
                                <div class="service_icon">
                                    <i class="fa fa-gear"></i>
                                </div>
                                <h3>Easy To Customize</h3>
                            </div>
                            <div class="service_content">
                                <p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean commodo ligula eget dolor. Cum sociis natoque penatibus mag dis parturient.</p>
                                <a class="read" href="#">Read more</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-md-4  col-lg-4 col-sm-4 ">
                        <div class="serviceBox_1">
                            <div class="icon_service">
                                <div class="service_icon">
                                    <i class="fa fa-volume-off"></i>
                                </div>
                                <h3>Multimedia Support</h3>
                            </div>
                            <div class="service_content">
                                <p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean commodo ligula eget dolor. Cum sociis natoque penatibus mag dis parturient.</p>
                                <a class="read" href="#">Read more</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-md-4  col-lg-4 col-sm-4 ">
                        <div class="serviceBox_1">
                            <div class="icon_service">
                                <div class="service_icon">
                                    <i class="fa fa-suitcase"></i>
                                </div>
                                <h3>Documentation</h3>
                            </div>
                            <div class="service_content">
                                <p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean commodo ligula eget dolor. Cum sociis natoque penatibus mag dis parturient.</p>
                                <a class="read" href="#">Read more</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
		<!--end info service-->
    <section class="parallax parallax-1">
        <div class="container">
            <!--<h2 class="center">Testimonials</h2>-->
            <div class="row">
                <div id="parallax-testimonial-carousel" class="parallax-testimonial carousel">
                    <div class="carousel-inner">
                        <div class="active item">
                            <div class="parallax-testimonial-item">
                                <blockquote>
                                    <p>Donec convallis, metus nec tempus aliquet, nunc metus adipiscing leo, a lobortis nisi dui ut odio. Nullam ultrices, eros accumsan vulputate faucibus, turpis tortor dictum.</p>
                                </blockquote>
                                <p>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </p>
                                <div class="parallax-testimonial-review">
                                    <img src="/dajob/resources/images/testimonials/1.png" alt="testimonial">
                                    <span>Jonathan Dower</span>
                                    <small>Company Inc.</small>
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="parallax-testimonial-item">
                                <blockquote>
                                    <p>Metus aliquet tincidunt metus, sit amet mattis lectus sodales ac. Suspendisse rhoncus dictum eros, ut egestas eros luctus eget. Nam nibh sem, mattis et feugiat ut, porttitor nec risus.</p>
                                </blockquote>
                                <p>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </p>
                                <div class="parallax-testimonial-review">
                                    <img src="/dajob/resources/images/testimonials/2.png" alt="testimonial">
                                    <span>Jonathan Dower</span>
                                    <small>Leopard</small>
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="parallax-testimonial-item">
                                <blockquote>
                                    <p>Nunc aliquet tincidunt metus, sit amet mattis lectus sodales ac. Suspendisse rhoncus dictum eros, ut egestas eros luctus eget. Nam nibh sem, mattis et feugiat ut, porttitor nec risus.</p>
                                </blockquote>
                                <p>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </p>
                                <div class="parallax-testimonial-review">
                                    <img src="/dajob/resources/images/testimonials/3.png" alt="testimonial">
                                    <span>Jonathan Dower</span>
                                    <small>Leopard</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <ol class="carousel-indicators">
                        <li data-slide-to="0" data-target="#parallax-testimonial-carousel" class=""></li>
                        <li data-slide-to="1" data-target="#parallax-testimonial-carousel" class="active"></li>
                        <li data-slide-to="2" data-target="#parallax-testimonial-carousel" class=""></li>
                    </ol>
                </div>
            </div>
        </div>
    </section>
		<!--Start recent work-->
		<section class="latest_work">
			<div class="container">
				<div class="row sub_content">
					<div class="carousel-intro">
						<div class="col-md-12">
							<div class="dividerHeading">
								<h4><span>Recent Work</span></h4>
							</div>
							<div class="carousel-navi">
								<div id="work-prev" class="arrow-left jcarousel-prev"><i class="fa fa-angle-left"></i></div>
								<div id="work-next" class="arrow-right jcarousel-next"><i class="fa fa-angle-right"></i></div>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
					
					<div class="jcarousel recent-work-jc">
                        <ul class="jcarousel-list">
                            <!-- Recent Work Item -->
                            <li class="col-lg-3 col-md-3 col-sm-3">
                                <div class="recent-item">
                                    <figure>
                                        <img src="/dajob/resources/images/portfolio/portfolio_1.png" alt="" />
                                        <div class="ImageOverlay"></div>
                                        <div class="option">
                                            <a href="/dajob/resources/images/portfolio/full/portfolio_1.png" class="mfp-image" ><i class="fa fa-search"></i></a>
                                            <a href="portfolio_single.html"><i class="fa fa-link"></i></a>
                                        </div>
                                    </figure>
                                </div>
                            </li>

                            <!-- Recent Work Item -->
                            <li class="col-lg-3 col-md-3 col-sm-3">
                                <div class="recent-item">
                                    <figure>
                                        <img src="/dajob/resources/images/portfolio/portfolio_2.png" alt="" />
                                        <div class="ImageOverlay"></div>
                                        <div class="option">
                                            <a href="/dajob/resources/images/portfolio/full/portfolio_1.png" class="mfp-image" ><i class="fa fa-search"></i></a>
                                            <a href="portfolio_single.html"><i class="fa fa-link"></i></a>
                                        </div>
                                    </figure>
                                </div>
                            </li>

                            <!-- Recent Work Item -->
                            <li class="col-lg-3 col-md-3 col-sm-3">
                                <div class="recent-item">
                                    <figure>
                                        <img src="/dajob/resources/mages/portfolio/portfolio_3.png" alt="" />
                                        <div class="ImageOverlay"></div>
                                        <div class="option">
                                            <a href="/dajob/resources/images/portfolio/full/portfolio_1.png" class="mfp-image" ><i class="fa fa-search"></i></a>
                                            <a href="portfolio_single.html"><i class="fa fa-link"></i></a>
                                        </div>
                                    </figure>
                                </div>
                            </li>

                            <!-- Recent Work Item -->
                            <li class="col-lg-3 col-md-3 col-sm-3">
                                <div class="recent-item">
                                    <figure>
                                        <img src="/dajob/resources/images/portfolio/portfolio_4.png" alt="" />
                                        <div class="ImageOverlay"></div>
                                        <div class="option">
                                            <a href="/dajob/resources/images/portfolio/full/portfolio_1.png" class="mfp-image" ><i class="fa fa-search"></i></a>
                                            <a href="portfolio_single.html"><i class="fa fa-link"></i></a>
                                        </div>
                                    </figure>
                                </div>
                            </li>

                            <!-- Recent Work Item -->
                            <li class="col-lg-3 col-md-3 col-sm-3">
                                <div class="recent-item">
                                    <figure>
                                        <img src="/dajob/resources/images/portfolio/portfolio_5.png" alt="" />
                                        <div class="ImageOverlay"></div>
                                        <div class="option">
                                            <a href="/dajob/resources/images/portfolio/full/portfolio_1.png" class="mfp-image" ><i class="fa fa-search"></i></a>
                                            <a href="portfolio_single.html"><i class="fa fa-link"></i></a>
                                        </div>
                                    </figure>
                                </div>
                            </li>

                            <!-- Recent Work Item -->
                            <li class="col-lg-3 col-md-3 col-sm-3">
                                <div class="recent-item">
                                    <figure>
                                        <img src="/dajob/resources/images/portfolio/portfolio_6.png" alt="" />
                                        <div class="ImageOverlay"></div>
                                        <div class="option">
                                            <a href="/dajob/resources/images/portfolio/full/portfolio_1.png" class="mfp-image" ><i class="fa fa-search"></i></a>
                                            <a href="portfolio_single.html"><i class="fa fa-link"></i></a>
                                        </div>
                                    </figure>
                                </div>
                            </li>

                            <!-- Recent Work Item -->
                            <li class="col-lg-3 col-md-3 col-sm-3">
                                <div class="recent-item">
                                    <figure>
                                        <img src="/dajob/resources/images/portfolio/portfolio_7.png" alt="" />
                                        <div class="ImageOverlay"></div>
                                        <div class="option">
                                            <a href="/dajob/resources/images/portfolio/full/portfolio_1.png" class="mfp-image" ><i class="fa fa-search"></i></a>
                                            <a href="portfolio_single.html"><i class="fa fa-link"></i></a>
                                        </div>
                                    </figure>
                                </div>
                            </li>

                            <!-- Recent Work Item -->
                            <li class="col-lg-3 col-md-3 col-sm-3">
                                <div class="recent-item">
                                    <figure>
                                        <img src="/dajob/resources/images/portfolio/portfolio_8.png" alt="" />
                                        <div class="ImageOverlay"></div>
                                        <div class="option">
                                            <a href="/dajob/resources/images/portfolio/full/portfolio_1.png" class="mfp-image" ><i class="fa fa-search"></i></a>
                                            <a href="portfolio_single.html"><i class="fa fa-link"></i></a>
                                        </div>
                                    </figure>
                                </div>
                            </li>
                        </ul>
					</div>
				</div>
			</div>
		</section>
		<!--Start recent work-->
		
		<section class="fetaure_bottom">
			<div class="container">
				<div class="row sub_content">
					<div class="col-lg-6 col-sm-6 wow slideInLeft" data-wow-duration="1s">
						<div class="dividerHeading">
							<h4><span>Why Choose Us?</span></h4>
						</div>
						<ul class="list_style">
							<li><a href="#">Donec convallis, metus nec tempus aliquet</a></li>
							<li><a href="#">Aenean commodo ligula eget dolor</a></li>
							<li><a href="#">Cum sociis natoque penatibus mag ipsum</a></li>
							<li><a href="#">Lorem ipsum dolor sit amet cons adipiscing</a></li>
							<li><a href="#">Accumsan vulputate faucibus turpis dictum</a></li>
							<li><a href="#">Nullam ultrices eros accumsan vulputate</a></li>
							<li><a href="#">Nunc aliquet tincidunt metus sit amet</a></li>
						</ul>
					</div>
					
					<!-- TESTIMONIALS -->
					<div class="col-lg-6 col-sm-6 wow slideInRight" data-wow-duration="1s">
						<div class="dividerHeading">
							<h4><span>What Client's Say</span></h4>
						</div>
						
						<div id="testimonial-carousel" class="testimonial carousel slide">
							<div class="carousel-inner">
								<div class="active item">
									<div class="testimonial-item">
										<div class="icon"><i class="fa fa-quote-right"></i></div>
										<blockquote>
											<p>Donec convallis, metus nec tempus aliquet, nunc metus adipiscing leo, a lobortis nisi dui ut odio. Nullam ultrices, eros accumsan vulputate faucibus, turpis tortor dictum.</p>
										</blockquote>
										<div class="testimonial-review">
											<img src="/dajob/resources/images/testimonials/1.png" alt="testimoni">
											<h1>Jonathan Dower,<small>Company Inc.</small></h1>
										</div>
									</div>
								</div>
								
								<div class="item">
									<div class="testimonial-item">
										<div class="icon"><i class="fa fa-quote-right"></i></div>
										<blockquote>
											<p>Metus aliquet tincidunt metus, sit amet mattis lectus sodales ac. Suspendisse rhoncus dictum eros, ut egestas eros luctus eget. Nam nibh sem, mattis et feugiat ut, porttitor nec risus.</p>
										</blockquote>
										<div class="testimonial-review">
											<img src="/dajob/resources/images/testimonials/2.png" alt="testimoni">
											<h1>Jonathan Dower<small>Leopard</small></h1>
										</div>
									</div>
								</div>

								<div class="item">
									<div class="testimonial-item">
										<div class="icon"><i class="fa fa-quote-right"></i></div>
										<blockquote>
											<p>Nunc aliquet tincidunt metus, sit amet mattis lectus sodales ac. Suspendisse rhoncus dictum eros, ut egestas eros luctus eget. Nam nibh sem, mattis et feugiat ut, porttitor nec risus.</p>
										</blockquote>
										<div class="testimonial-review">
											<img src="/dajob/resources/images/testimonials/3.png" alt="testimoni">
											<h1>Jonathan Dower<small>Leopard</small></h1>
										</div>
									</div>
								</div>
							</div>
							<div class="testimonial-buttons"><a href="#testimonial-carousel" data-slide="prev"><i class="fa fa-chevron-left"></i></a>&#32;
							<a href="#testimonial-carousel" data-slide="next"><i class="fa fa-chevron-right"></i></a></div>
						</div>
					</div><!-- TESTIMONIALS END -->
				</div>
			</div>
		</section>
		<section class="clients">
			<div class="container">
				<div class="row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="dividerHeading">
							<h4><span>Our Clients</span></h4>
						</div>
						
						<div class="our_clients">
							<ul class="client_items clearfix">
								<li class="col-lg-3 col-md-3 col-sm-3"><a href="services.html"  data-placement="bottom" data-toggle="tooltip" title="Client 1" ><img src="images/clients/1.png" alt="" /></a></li>
								<li class="col-lg-3 col-md-3 col-sm-3"><a href="services.html" data-placement="bottom" data-toggle="tooltip" title="Client 2" ><img src="images/clients/2.png" alt="" /></a></li>
								<li class="col-lg-3 col-md-3 col-sm-3"><a href="services.html" data-placement="bottom" data-toggle="tooltip" title="Client 3" ><img src="images/clients/3.png" alt="" /></a></li>
								<li class="col-lg-3 col-md-3 col-sm-3"><a href="services.html" data-placement="bottom" data-toggle="tooltip" title="Client 4" ><img src="images/clients/4.png" alt="" /></a></li>
							</ul><!--/ .client_items-->
						</div>
					</div>
				</div>
			</div>
		</section>

        <section class="promo_box wow bounceInUp" data-wow-offset="50">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-md-9 col-sm-9 ">
                        <div class="promo_content">
                            <h3>Stylo is awesome responsive template, with clean design.</h3>
                            <p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean commodo ligula eget dolor. </p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="pb_action">
                            <a class="btn btn-lg btn-default" href="#fakelink">
                                <i class="fa fa-shopping-cart"></i>
                                Download Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <!--    </section>-->
    </section>
    <!--end wrapper-->
<c:import url="./footer.jsp"/>
</body>
</html>


