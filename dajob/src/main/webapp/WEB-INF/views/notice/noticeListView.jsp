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
       header{
       	background: url("/dajob/resources/images/page-header7.jpg") no-repeat;
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
                    <h2>Notice</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li>You are here:</li>
                            <li><a href="index.do">Home</a></li>
                            <li>Notice</li>
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
				<div class="row sub_content clearfix">
				<c:set var="list" value="${nlist}"/>
				<c:set var="curPage" value="${currentPage}"/>
				<c:set var="max" value="${maxPage}"/>
				<c:set var="listCnt" value="${listCount}"/>
				<c:url var="ntitle" value="/ntitle.do">
				</c:url>
				<form method="get" id="site-searchform" action="${ntitle}" style="padding-bottom: 30px;margin-bottom: 30px;">
					<div>
						<input class="input-text" name="s" id="s" placeholder="Enter Search keywords..." type="search" />
						<input id="searchsubmit" value="Search" type="submit" />
					</div>
				</form>
				<c:if test="${! empty list}">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th><p align="center">제목</p></th>
								<th><p align="center">작성자</p></th>
								<th><p align="center">날짜</p></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="notice" items="${list}">
							<tr>
								<c:url var="ndetailTitle" value="/ndetail.do">
									<c:param name="page" value="${curPage}"/>
									<c:param name="notice_no" value="${notice.notice_no}"/>
								</c:url>
								<td><a href="${ndetailTitle}">${notice.notice_title}</a></td>
								<td>관리자</td>
								<td>${notice.notice_date}</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="3" align="center"> 
							<ul class="pagination pull-center mrgt-0">
                            <c:if test="${curPage eq 1}">
                            <li class="active"><a href="#">&laquo;</a></li>
                            </c:if><c:if test="${curPage ne 1}">
                            <c:url var="noticeLt" value="/nlist.do">
                            	<c:param name="page" value="${curPage - 1}"/>
                            </c:url>
                            <li><a href="${noticeLt}">&laquo;</a></li>
                            </c:if>
                            <c:forEach var="i" begin="1" end="${max}">
                            <c:if test="${i eq curPage}">
                            	<li class="active"><a href="#">${i}</a></li>
                            </c:if>
                            <c:if test="${i ne curPage}">
                            <c:url var="nlistPage" value="/nlist.do">
                            	<c:param name="page" value="${i}"/>
                            </c:url>
                            	<li><a href="${nlistPage}">${i}</a></li>
                            </c:if>
                            </c:forEach>
                            <c:if test="${curPage eq max}">
                            <li class="active"><a href="#">&raquo;</a></li>
                            </c:if><c:if test="${curPage ne max}">
                            <c:url var="noticeRt" value="/nlist.do">
                            	<c:param name="page" value="${curPage + 1}"/>
                            </c:url>
                            <li><a href="${noticeRt}">&raquo;</a></li>
                            </c:if>
                            <c:if test="${member.member_type_code eq 'A'}">
                            &nbsp;&nbsp; &nbsp;
                            <button class="btn btn-primary" id="insertBtn" type="button" onclick="javascript:location.href='ninsertView.do';">글쓰기</button>
                            </c:if>
                        </ul>
							</td>
						</tr>
						</tbody>
					</table>
				</c:if><c:if test="${empty list}">
				<p align="center"><h1>현재 공지사항이 없습니다.</h1></p>
				</c:if>
				</div>
			</div>
		</section>
	</section>
	<!--end wrapper-->

	
	<!--start footer-->
	<c:import url="../footer.jsp"/>
	<!--end footer-->
</body>
</html>