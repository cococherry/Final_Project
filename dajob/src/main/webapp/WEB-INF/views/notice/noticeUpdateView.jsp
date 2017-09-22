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
	<title>Update Notice : find Direct your job</title>
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
                    <h2>Notice Update</h2>
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
		<section class="content">
			<div class="container">
			<div class="row sub_content">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="dividerHeading">
                        <h4><span>공지사항 수정</span></h4>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                <c:set var="n" value="${notice}"/>
                <form action="nupdate.do" method="post">
                	<input type="hidden" name="notice_no" value="${n.notice_no}">
                    <table class="table table-hover">
                        <tbody>
                        <tr>
                            <td style="width:10%;">제목 :</td>
                            <td><input type="text" name="notice_title" style="width:100%; height:25px;" value="${n.notice_title}"></td>
                        </tr>
                        <tr>
                            <td style="margin-top: 15px;">내용 : </td>
                            <td><textarea id="editor" name="notice_content">${n.notice_content}</textarea></td>
                        </tr>
                        <tr>
                        	<td colspan="2"><p align="center">
                        	<button class="btn btn-success btn-sm" id="nupdate" type="submit">글 수정하기</button>
                        	&nbsp;&nbsp;&nbsp;
                        	<button class="btn btn-warning btn-sm" id="cancel" type="button" onclick="javascript:history.back();">작성 취소</button>
                        	</p></td>
                        </tr>
                        <tr>
                        	<td colspan="2"></td>
                        </tr>
                        </tbody>
                    </table>
                    </form>
                    <p align="center">
					<a href="javascript:history.back();" class="btn btn-default btn-lg back_home">
					<i class="fa fa-arrow-circle-o-left"></i> Go to Back</a>
				</p>
				</div>
                </div>
            </div> <!--./row-->
		</section>
	</section>
	<!--end wrapper-->

	<!--start footer-->
	<c:import url="../footer.jsp"/>
	<!--end footer-->
	<script src="${pageContext.request.contextPath}/resources/api/CKeditor/ckeditor.js"></script>
	<!-- CKeditor korean language pack -->
	<script src="${pageContext.request.contextPath}/resources/api/CKeditor/lang/ko.js"></script>
	<script>
	$(function(){
		CKEDITOR.config.customConfig = '${pageContext.request.contextPath}/resources/api/CKeditor/config.js';
		CKEDITOR.replace( 'editor', {
			enterMode : 2,
			height: 200
		});
	});
	</script>
</body>
</html>