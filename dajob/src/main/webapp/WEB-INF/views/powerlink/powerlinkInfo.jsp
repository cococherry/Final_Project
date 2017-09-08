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
	<!-- CSS FILES -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>" media="screen" data-name="skins">

    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/animate.css'/>"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
       #map {
        height: 400px;
        width: 100%;
       }
       .promo_box .pb_action a.btn{
       float: none;
       }
    </style>
</head>
<body>
	<!--Start Header-->
	<header>
	<c:import url="../header.jsp"/>
        <div class="container page_head">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <h2>Contact Us</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li>You are here:</li>
                            <li><a href="index.do">Home</a></li>
                            <li>PowerLink Infomation</li>
                        </ul>
                    </nav>
                </div>
            </div> <!--./row-->
        </div> <!--./Container-->
        </header>
        
        <div class="row sub_content">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="promo_box">
                            <div class="col-sm-12">
                                <div class="promo_content">
                                    <h1 align="center" style="font-weight: bolder;">POWERLINK</h1>
                                    <p style="font-size: 15pt; line-height:35px;" align="center">여러분은 이제, 직접 일일이 구직자를 찾아 방황하실 필요가 없습니다!<br>
                                    단 돈 60만원에 상위 랭크로 갱신되는 여러분의 구인글을 만나보세요!!<br>
                                    여러분께서 구직목록을 직접 재작성하실 필요가 없이 PowerLink를 등록<br>하시면 별도 Premium Service로
                                    5일간 여러분의 최신 구인글 목록을 관리해<br>드립니다.  단, 돈 60만원에, DAJOB 만의 멋진 서비스를 만나 보세요!<br>
                                    <font style="font-size: 10pt;"><b>※</b> 함께하시는 기업 담당자 분들께는 저희 사이트의 다이얼로그 책자도 매 달 1개 분씩 배달해드립니다.</font></p>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="pb_action">
                                <c:set var="pl" value="${ requestScope.powerlink }" />
                                <c:if test="${pl.powerlink_time eq 0}">
                                    <p align="center"><br><a href="powerLink_offer.do" class="btn btn-default btn-lg">
                                        <i class="fa fa-rocket"></i>
                                        신청하기
                                    </a></p>
                               </c:if>
                               <c:if test="${pl.powerlink_time ne 0}">
                               		<p align="center"><br>
                               		<font style="font-size: 13pt;">이미 신청을 하셨습니다 ^-^</font>
                               		<br>
                               		<fmt:formatNumber var="test" value="${(pl.powerlink_time / 24) - ((pl.powerlink_time / 24) % 1)}" pattern="#"></fmt:formatNumber>
                               		<c:set var="plDate" value="${test }" />
                               		<c:set var="plHour" value="${pl.powerlink_time mod 24}"/>
                               		<a class="btn btn-default btn-lg">* 남은시간 : ${plDate}일 ${plHour} 시간 *</a>
                               		</p>
                               </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        
        <c:import url="../footer.jsp"/>
</body>
</html>