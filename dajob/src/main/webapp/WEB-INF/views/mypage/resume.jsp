<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>DA JOB : find Direct your job</title>
	<link rel="shortcut icon" type="image/x-icon" href="/dajob/resources/images/sitelogo2_fix.png"/>
	
	<!-- 기본CSS FILES -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>" media="screen" data-name="skins">
    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/animate.css'/>"/>

	<!-- CKeditor CSS FILES -->
	<link href="${pageContext.request.contextPath}/resources/api/CKeditor/contents.css"" rel="stylesheet">
	<%-- <link rel="stylesheet" href="<c:url value='/resources/css/sntest.css'/>"/> --%>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
</head>
<body>

	<!--Start Header-->
	<header>
	<c:import url="../header.jsp"/>
        <div class="container page_head">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <h2>개인 이력서</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li>You are here:</li>
                            <li><a href="index.html">Home</a></li>
                            <li><a href="index.html">Mypage</a></li>
                            <li>My resume</li>
                        </ul>
                    </nav>
                </div>
            </div> <!--./row-->
        </div> <!--./Container-->
    </header>
	
	<!--start wrapper-->
	<section class="wrapper">
		<section class="content contact">
			<div class="container">
		        <!-- ===========================
		        HEADER
		        ============================ -->
		        <div id="header" class="row">
		            <div class="col-lg-2">
		                <img class="propic" src="/dajob/resources/images/img-style.png" alt="" height="165px" width="165px" style="padding-top:15px">
		            </div>
		            <!-- photo end-->
		
		            <div class="col-lg-10">
		                    <div class="row">
		                        <div class="col-lg-7">
		                            <h1>나상민</h1>
		                        </div>
		                    </div>
		                    <h2>UI/UX Designer</h2>
		                <!-- Title end-->
		
		                <!-- ===========================
		                SOCIAL & CONTACT
		                ============================ -->
		                <div class="row">
		                	<div style="pointer-events: none">
			                    <div class="col-sm-4">
			                        <ul class="list-unstyled">
			                            <li><a><span class="social fa fa-envelope-o"></span> : me@mail.com</a>
			                            </li>
			                            <li><a><span class="social fa fa-phone"></span> : 010 0123 45678</a>
			                            </li>
			                            <li><a><span class="social fa fa-location-arrow"></span> : 서울시 송파구 가락동 6-7번지 세명빌라 302호</a>
			                            </li>
			                        </ul>
			                    </div><!-- social 1st col end-->
			
			                    <div class="col-sm-4">
			                        <ul class="list-unstyled">
			                            <li><a><span class="social fa fa-child"></span> : 남</a>
			                            </li>
			                            <li><a><span class="social fa fa-calendar"></span> : 1991-09-13</a>
			                            </li>
			                            <li><a><span class="social fa fa-linkedin"></span> : Linkedin</a>
			                            </li>
			                        </ul>
			                    </div><!-- social 2nd col end-->
			
			                    <div class="col-sm-4">
			                        <ul class="list-unstyled">
			                            <li><a><span class="social fa fa-behance"></span> : Behance</a>
			                            </li>
			                            <li><a><span class="social fa fa-dribbble"></span> : Dribbble</a>
			                            </li>
			                            <li><a><span class="social fa fa-instagram"></span> : Instagram</a>
			                            </li>
			                        </ul>
			                    </div><!-- social 3rd col end-->
		                    </div>
		                </div><!-- header social end-->
		            </div><!-- header right end-->
		        </div><!-- header end-->
		
		        <hr class="firsthr">
		
		        <!-- ===========================
		        BODY LEFT PART
		        ============================ -->
		        <div class="col-md-8 mainleft">
		        
		        	<div>
		        		<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
			            <div id="statement" class="row mobmid">
			                <div class="col-sm-1">
			                    <span class="secicon fa fa-question-circle"><strong>&nbsp;help</strong></span>
			                </div>
			
			                <div class="col-sm-11">
			                    <h3>이력서를 마음껏 꾸며보세요! </h3>
			                    <p>자신의 프로필을 자유롭게 꾸며보세요,</p>
			
			                    <p>자신의 경력, 학력, 프로젝트 참여 등과 같은 자신의 정보를 사진과 함께 자유롭게 만들어 보세요!</p>
			                </div>
			            </div>
			            <hr>
					</div>
					<!-- <div class="mytest"> -->
						<textarea cols="100" id="editor1" name="editor1" rows="10">&lt;p&gt;This is some &lt;strong&gt;sample text&lt;/strong&gt;.		You are using &lt;a href="http://ckeditor.com/"&gt;CKEditor&lt;/a&gt;.&lt;/p&gt;
						CKeditor 사용은 api 내의 samples를 활용해주세요~!</textarea>
					<!-- </div> -->
		        </div><!--left end-->
		        
		        <!-- ===========================
		        SIDEBAR
		        =========================== -->
		        <div class="col-md-4 mainright">
		            <div class="row">
		                <div class="col-sm-1 col-md-2 mobmid">
		                    <span class="secicon fa fa-magic"></span>
		                </div><!--icon end-->
		                <div class="col-sm-11 col-md-10">
		                    <h3 class="mobmid">Technical skills </h3>
							<!-- <blockquote> -->
		                    <p>Photoshop</p>
		                    <div class="progress">
		                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100" style="width: 65%">
		                            <span class="sr-only">65% Complete (success)</span>
		                        </div>
		                    </div><!--skill end-->
		
		
		                    <p>Illustrator</p>
		                    <div class="progress">
		                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%">
		                            <span class="sr-only">85% Complete</span>
		                        </div>
		                    </div><!--skill end-->
		
		                    <p>InDesign</p>
		                    <div class="progress">
		                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
		                            <span class="sr-only">60% Complete (warning)</span>
		                        </div>
		                    </div><!--skill end-->
		
		                    <p>Flash</p>
		                    <div class="progress">
		                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
		                            <span class="sr-only">30% Complete (danger)</span>
		                        </div>
		                    </div><!--skill end-->
		                    <!-- </blockquote> -->
		                </div><!--info end-->
		            </div><!--tech skills end-->
		            
		            <hr>
		
		            <div class="row mobmid">
		                <div class="col-sm-1 col-md-2">
		                    <span class="secicon fa fa-star"></span>
		                </div><!--icon end-->
		
		                <div class="col-sm-11 col-md-10 ">
		                    <h3>관심 기업모집요강</h3>
		
		                    <div class="award">
		                        <h4>Best Designer 2012</h4>
		                        <p class="sub"><a href="">Life View Media Ltd.</a></p>
		                        <p>Studying all aspect of Graphic Design Including Advertising Design, Branding, Copy Exhibition Design, Ilustration.</p>
		                    </div>
		                    <!--1st award end-->
		
		                    <div class="award">
		                        <h4>Best Designer 2011</h4>
		                        <p class="sub"><a href="">Alexa Design Solution</a></p>
		                        <p>Studying all aspect of Graphic Design Including Advertising Design, Branding, Copy Exhibition Design, Ilustration, Information Design, Packaging Design and Website Design</p>
		                    </div><!--1st award end-->
		                </div><!--awards end-->
		
		            </div>
		            
		             <hr>
		
		        </div><!--right end-->
		    </div><!--container end-->
		</section>
	</section>
	<!--end wrapper-->

	
	<!--start footer-->
	<c:import url="../footer.jsp"/>
	<!--end footer-->
		<!-- include summernote css/js-->

	<script src="${pageContext.request.contextPath}/resources/api/CKeditor/ckeditor.js"></script>
	<!-- summer note korean language pack -->
	<script src="${pageContext.request.contextPath}/resources/api/CKeditor/lang/ko.js"></script>
	<script>
		CKEDITOR.replace( 'editor1', {
			height: 400
		} );
	</script>
</body>
</html>