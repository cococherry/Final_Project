<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html class="no-js" lang="ko">
<!--<![endif]-->
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>DA JOB : find Direct your job</title>
<link rel="shortcut icon" type="image/x-icon"
	href="/dajob/resources/images/sitelogo2_fix.png" />
<!-- CSS FILES -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/style.css'/>" media="screen"
	data-name="skins">

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/flexslider.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/font-awesome.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/animate.css'/>" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/switcher.css'/>" media="screen" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
header {
	background: url("/dajob/resources/images/page-header4.jpg") no-repeat;
}
.itinfo .it a{
	color: #fdffc6;
}
.itinfo .it a:hover{
	color: #64eac6;
}
</style>
</head>
<body>
	<!--Start Header-->
	<header>
		<c:import url="../header.jsp" />
		<div class="container page_head">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h2 style="color:#0e1f3d;">IT Info List</h2>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav id="breadcrumbs">
						<ul>
							<li style="color:#0e1f3d;">You are here:</li>
							<li style="color:#0e1f3d;"><a href="index.do">Home</a></li>
							<li style="color:#0e1f3d;">ITinfo</li>
						</ul>
					</nav>
				</div>
			</div>
			<!--./row-->
		</div>
		<!--./Container-->
	</header>
	<!--End Header-->
	<section class="wrapper">
		<!--start itinfo service-->
		<section class="parallax parallax-1">
			<div class="container">
				<!--<h2 class="center">Testimonials</h2>-->
				<div class="row">
					<div id="parallax-testimonial-carousel"
						class="parallax-testimonial carousel">
						<c:set var="curPage" value="${currentPage}"/>
						<c:set var="max" value="${maxPage}"/>
						<c:set var="listCnt" value="${listCount}"/>
						<div class="col-md-12">
							<div class="clearfix">
								<div class="col-lg-12 col-md-12 col-sm-12">
									<table class="table itinfo">
										<thead style="font-size:15pt;">
											<tr>
												<th></th>
												<th style="text-align: center;">글 제 목</th>
												<!-- <th style="text-align: center;">간 략 내 용</th> -->
												<th style="text-align: center;">작 성 일</th>
											</tr>
										</thead>
										<tbody style="font-size:13pt;">
										<c:forEach var="it" items="${list}" varStatus="status">
											<tr class="it">
												<c:url var="itdetail" value="/itinfoDetail.do">
													<c:param name="page" value="${curPage}"/>
													<c:param name="itinfo_no" value="${it.itinfo_no}"/>
												</c:url>
												<td><img class="img-rounded img-responsive" src="${pageContext.request.contextPath}/resources/images/${it.itinfo_img}" style="width:60px; height:45px;"></td>
												<td style="vertical-align: middle;"><a href="${itdetail}">${it.itinfo_title}</a></td>
												<%-- <td>${fn:substring(it.itinfo_content,0,15)}...</td> --%>
												<td style="vertical-align: middle; font-size:11pt;"><i class="fa fa-calendar"></i>&nbsp;&nbsp;${it.itinfo_date}</td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="3" align="center"> 
											<ul class="pagination pull-center mrgt-0">
				                            <c:if test="${curPage eq 1}">
				                            <li class="active"><a href="#">&laquo;</a></li>
				                            </c:if><c:if test="${curPage ne 1}">
				                            <c:url var="itinfoLt" value="/itinfo.do">
				                            	<c:param name="page" value="${curPage - 1}"/>
				                            </c:url>
				                            <li><a href="${itinfoLt}">&laquo;</a></li>
				                            </c:if>
				                            <c:forEach var="i" begin="1" end="${max}">
				                            <c:if test="${i eq curPage}">
				                            	<li class="active"><a href="#">${i}</a></li>
				                            </c:if>
				                            <c:if test="${i ne curPage}">
				                            <c:url var="itlistPage" value="/itinfo.do">
				                            	<c:param name="page" value="${i}"/>
				                            </c:url>
				                            	<li><a href="${itlistPage}">${i}</a></li>
				                            </c:if>
				                            </c:forEach>
				                            <c:if test="${curPage eq max}">
				                            <li class="active"><a href="#">&raquo;</a></li>
				                            </c:if><c:if test="${curPage ne max}">
				                            <c:url var="itinfoRt" value="/itinfo.do">
				                            	<c:param name="page" value="${curPage + 1}"/>
				                            </c:url>
				                            <li><a href="${itinfoRt}">&raquo;</a></li>
				                            </c:if>
				                            <c:if test="${member.member_type_code eq 'A'}">
				                            &nbsp;&nbsp; &nbsp;
				                            <button class="btn btn-primary" id="insertBtn" type="button" onclick="javascript:location.href='itinsertView.do';">글쓰기</button>
				                            </c:if>
				                        </ul>
											</td>
										</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</section>
	<!--end wrapper-->
	<c:import url="../footer.jsp" />
</body>
</html>