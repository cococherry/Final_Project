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
    <c:set var="startdate" value="${startdate}"/>
    <c:set var="enddate" value="${enddate}"/>
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
	<div>
        <div class="panel panel-default">
                <form method="POST" action="/made/ninsert" >
                    <div class="panel-body article">
                        <h4>화상채팅방 수정하기</h4>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                               <div class="row">
									    <div class="col-md-4 mb-4">
									      <label for="validationServer02">면접자 아이디</label>
									      <input type="text" class="form-control is-valid" id="validationServer02" placeholder="Last name" value="${interview.interviewee }" required>
									    </div>
									    
								        <div class="form-group col-md-4 mb-4">
							                <label for="dtp_input1" class="control-label">시작 시간</label>
							                <div class="input-group date form_datetime" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy년 MM dd일  p HH:ii" data-link-field="dtp_input1">
							                    <input class="form-control" size="16" type="text" value="${startdate }" readonly>
							                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
												<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
							                </div>
											<input type="hidden" id="dtp_input1" value="" /><br/>
							            </div>
							 			
							 			<div class="form-group col-md-4 mb-4">
							                <label for="dtp_input1" class="control-label">끝나는 시간</label>
							                <div class="input-group date form_datetime" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy년 MM dd일  p HH:ii" data-link-field="dtp_input1">
							                    <input class="form-control" size="16" type="text" value="${enddate }" readonly>
							                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
												<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
							                </div>
											<input type="hidden" id="dtp_input1" value="" /><br/>
							            </div>
							 			
									  </div>				                                
                              </div>
              	                 <textarea cols="100" id="editor1" name="editor1" rows="10">
									${interview.interview_question}
							</textarea>
                        </div>
                        <ul class="pager">
                            <li>
                                <input type="submit" class="btn btn-default" value="수정하기">
                            </li>
                            </form>
                            <li>
                               <button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">취소하기</button>
                            </li>
                        </ul>
                    </div>
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

		<!-- CALENDER -->
	<script src="<c:url value='/resources/js/calender/bootstrap-datetimepicker.min.js'/>"></script>
	<script src="<c:url value='/resources/js/calender/bootstrap-datetimepicker.ko.js'/>"></script>
	<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        language:  'ko',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
    </script>
</body>
</html>