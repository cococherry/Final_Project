<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
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
	background: url("/dajob/resources/images/page-header3.jpg") no-repeat;
}
</style>
</head>
<body>
	<!--Start Header-->
	<!--Start Header-->
	<header>
		<c:import url="../header.jsp" />
		<div class="container page_head">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h2>Like Company List</h2>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav id="breadcrumbs">
						<ul>
							<li>You are here:</li>
							<li><a href="index.do">Home</a></li>
							<li>Company Like List</li>
						</ul>
					</nav>
				</div>
			</div>
			<!--./row-->
		</div>
		<!--./Container-->
	</header>
	<!--End Header-->

	<!--start wrapper-->
	<section class="content elements">
		<div class="container">
			<div class="row sub_content">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="dividerHeading">
						<h4>
							<span>Tables</span>
						</h4>
					</div>
				</div>
				<!-- 선호기업리스트 -->
				<div class="col-lg-12 col-md-12 col-sm-12">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>NO</th>
								<th>회사명</th>
								<th>지역</th>
								<th>요구능력</th>
								<th>요구경력</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.list }" var="list">
								<tr>
									<td><a>${ list.work_no }</a></td>
									<td><a>${ list.work_writer }</a></td>
									<td><a>${ list.work_workplace }</a></td>
									<td><a>${ list.work_skill }</a></td>
									<td><a>${ list.work_career }</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div><!--./row-->

			<!-- page Number -->
			<c:set var="startPage" value="${requestScope.startPage }" />
			<c:set var="endPage" value="${requestScope.endPage }" />
			<c:set var="page" value="${requestScope.page }" />
			<c:set var="maxPage" value="${requestScope.maxPage }" />
			<section class="wrapper">
				<section class="content blog">
					<div class="container">
						<div class="row">
							<div class="col-sm-8 col-md-8 col-lg-8">
								<div class="col-lg-12 col-md-12 col-sm-12">
									<ul class="pagination pull-left mrgt-0">
										<c:if test="${page <= 1 }">
											<li class="active"><a>&laquo;</a></li>
										</c:if>
										<c:if test="${page > 1 }">
											<c:url var="blist" value="/blist">
												<c:param name="page" value="${page - 1 }" />
											</c:url>
											<li class="active"><a href="${blist }">&laquo;</a></li>
										</c:if>
										<c:forEach var="p" begin="${startPage }" end="${endPage }">
											<c:if test="${p eq page }">
												<li><a>${p }</a></li>
											</c:if>
											<c:if test="${p ne page }">
												<c:url var="blist" value="/blist">
													<c:param name="page" value="${p }" />
												</c:url>
												<li><a href="${blist }">${p }</a></li>
											</c:if>
										</c:forEach>
										<c:if test="${page >= maxPage }">
											<li class="active"><a>&raquo;</a></li>
										</c:if>
										<c:if test="${page < maxPage }">
											<c:url var="blist" value="/blist">
												<c:param name="page" value="${page + 1}" />
											</c:url>
											<li class="active"><a href="blist">&raquo;</a></li>
										</c:if>
									</ul>
								</div></div></div></div>
								</section></section>
		<c:import url="../footer.jsp" />
</body>
</html>