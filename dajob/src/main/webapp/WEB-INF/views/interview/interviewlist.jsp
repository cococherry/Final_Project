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
    <link rel="stylesheet" href="<c:url value='/resources/css/interview/interviewlist.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>" media="screen" data-name="skins">

    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/animate.css'/>"/>
	<c:set var="interviewlist" value="${interviewlist}"/>
	<c:set var="company" value="${company}"/>
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
    </style>
</head>
<body>

	<!--Start Header-->
	<header>
	<c:import url="../header.jsp"/>
        <div class="container page_head">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <h2>인터뷰 List</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li>You are here:</li>
                            <li><a href="index.do">Home</a></li>
                            <li>Interview</li>
                        </ul>
                    </nav>
                </div>
            </div> <!--./row-->
        </div> <!--./Container-->
    </header>
	<div class="container">
  <h2>${company.company_name}</h2>      
  <table class="table table-hover">
    <thead>
      <tr>
        <th>인터뷰 번호</th>
        <th>회사 이름</th>
        <th>신청자 이름</th>
        <th>면접 상태</th>
      </tr>
    </thead>
    <tbody>
   		 <c:forEach var="interviewlist" items="${interviewlist}">
      <tr>
        <td>${interviewlist.interview_no }</td>
        <c:forEach var="comp" items="${interviewname}">
        <c:if test="${interviewlist.interviewer eq comp.member_id}">
        <td>${comp.company_name}</td>
        </c:if>
        </c:forEach>
        <c:forEach var="user" items="${interviewee}">
        <c:if test="${interviewlist.interviewee eq user.member_id}">
        <td>${user.member_name }</td>
        </c:if>
        </c:forEach>
        <td>
        <c:url var="interDetail" value="/interviewDetail.do">
        	<c:param name="interview_no" value="${interviewlist.interview_no}"/>
        </c:url>
        <c:if test="${interviewlist.interview_status eq 'H' }">대기</c:if>
        <c:if test="${interviewlist.interview_status eq 'E' }"><a href="${interDetail}">입장 가능</a></c:if>
        <c:if test="${interviewlist.interview_status eq 'Q' }">종료</c:if>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
	

	
	<!--start footer-->
	<c:import url="../footer.jsp"/>
	<!--end footer-->


</body>
</html>