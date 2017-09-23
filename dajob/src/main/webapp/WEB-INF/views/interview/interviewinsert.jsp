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
   
	<link rel="stylesheet" href="<c:url value='/resources/css/calender/bootstrap-datetimepicker.min.css'/>"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <c:set var="interview" value="${interview}"/>
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
    
    <div class="container clearfix" style="width:70%;">
    <table class="table table-bordered">
	  <thead>
	    <tr>
	      <th>
		      <div class="col-lg-12 col-md-12 col-sm-12" id="local">
			    <video
			     width="100%" height="100%" id="localVideo" autoplay="autoplay" style="opacity: 0;
			     -webkit-transition-property: opacity;
			     -webkit-transition-duration: 2s;">
			    </video>
			  </div>
		  </th>
	      <th>
	      	<div class="col-lg-12 col-md-12 col-sm-12" id="remote">
			    <video width="100%" height="100%" id="remoteVideo" autoplay="autoplay"
			     style="opacity: 0;
			     -webkit-transition-property: opacity;
			     -webkit-transition-duration: 2s;">
			    </video>
		    </div>
	      </th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	    <c:if test="${member.member_type_code eq 'U'}">
	      <td align="center">${member.member_name}</td>
	         <c:forEach var="comp" items="${interviewname}">
		        <c:if test="${interview.interviewer eq comp.member_id}">
		        <td align="center">${comp.company_name}</td>
		        </c:if>
        	</c:forEach>
	    </c:if>
	    <c:if test="${member.member_type_code eq 'C'}">
	      <td align="center">${interview.interviewee}</td>
	      <td align="center">${interview.interviewer}</td>
	    </c:if>
	    </tr>
	  </tbody>
    </table>
 
 	<button id="join">join</button>
</div>
    
    
	<!--start footer-->
	<c:import url="../footer.jsp"/>
	<!--end footer-->
		<script src="${pageContext.request.contextPath}/resources/api/CKeditor/ckeditor.js"></script>
			<!-- summer note korean language pack -->
			<script src="${pageContext.request.contextPath}/resources/api/CKeditor/lang/ko.js"></script>
			<script src="${pageContext.request.contextPath}/resources/api/CKeditor/config.js"></script>
			<script>
			CKEDITOR.config.customConfig = '${pageContext.request.contextPath}/resources/api/CKeditor/config.js';
			CKEDITOR.replace( 'editor1', {
				filebrowserImageUploadUrl: '${pageContext.request.contextPath}/resources/up',
				height: 400
			});
			</script>
</body>
</html>