<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<link rel="stylesheet"
	href="<c:url value='/resources/css/interview/interviewlist.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/style.css'/>" media="screen"
	data-name="skins">
<link rel="stylesheet"
	href="<c:url value='/resources/css/font-awesome.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/animate.css'/>" />

<link rel="stylesheet"
	href="<c:url value='/resources/css/calender/bootstrap-datetimepicker.min.css'/>" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<c:set var="skill" value="${skill}" />
<c:set var="job" value="${job}" />
<c:set var="workhere" value="${workhere}" />
</head>
<body>

	<!--Start Header-->
	<header>
		<c:import url="../header.jsp" />
		<div class="container page_head">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h2>채용공고 등록</h2>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav id="breadcrumbs">
						<ul>
							<li>You are here:</li>
							<li><a href="index.do">Home</a></li>
							<li>workboard</li>
						</ul>
					</nav>
				</div>
			</div>
			<!--./row-->
		</div>
		<!--./Container-->
	</header>
	<div>
		<div class="panel panel-default">
			<div class="panel-body article">
				<form method="post" action="workboardUpdate.do">
					<h4>채용공고 수정하기</h4>
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="row">
							<input type="hidden" id="no" name="no" value="${workhere.work_no }" readonly />
								<div class="col-md-2 mb-2">
									<label>회사 아이디</label>
									<input type="text" class="form-control is-valid" id="validationServer02" placeholder="Last name" value="${workhere.member_id}" readonly>
								</div>
								<div class="col-md-2 mb-2">
									<label>회사 창립일</label>
									<input type="date" class="form-control is-valid" id="validationServer02" placeholder="Last name" value="${workhere.company_date}" readonly> 
								</div>
								<div class="form-group col-md-4 mb-4">
									<label for="dtp_input1" class="control-label">채용시작 시간</label>
									<fmt:formatDate var="today" value="${now}" type="both"
										pattern="yyyy-MM-ddTHH:mm:ssZ" />
									<c:set var="toDay" value="${today}"/>
									<div class="input-group date form_datetime1" data-date="${toDay}" data-date-format="yyyy년 MM dd일  p HH:ii" data-link-field="dtp_input1">
										<input class="form-control" size="16" type="text" name="dateFormat1"  readonly> 
										<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> 
										<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span> 
										<input type="hidden" id="start" name="start" value="" readonly />
									</div>
								</div>

								<div class="form-group col-md-4 mb-4">
									<label for="dtp_input1" class="control-label">채용마감 시간</label>
									<div class="input-group date form_datetime2" data-date="${toDay}" data-date-format="yyyy년 MM dd일  p HH:ii" data-link-field="dtp_input1">
										<input class="form-control" size="16" type="text" name="dateFormat2"  readonly>
										<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> 
										<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span> 
										<input type="hidden" id="end" name="end" value="" readonly />
									</div>
								</div>
								<div class="col-md-2 mb-2">
									<label>회사 경력</label>
									<input type="hidden" id="career" name="career" value=""> 
									<select class="form-control is-valid" id="IVcareer" name="IVcareer">
										<option value="">회사경력선택</option>
										<option value="신입">신입</option>
										<option value="경력">경력</option>
									</select>
								</div>
								<div class="col-md-4 mb-4">
									<label>회사 위치</label>
									<input type="text" name="workplace" class="form-control is-valid"  onclick="execDaumPostcode();" placeholder="주소를 입력하시오." value="${workhere.work_workplace }"> 
								</div>
								
								
								<div class="col-md-3 mb-3">
									<label>직무</label>
									<input type="hidden" id="job" name="job" value=""> 
									<select class="form-control is-valid" id="IVjob" name="IVjob">
										<option value="">직무선택</option>
										<c:forEach var="j" items="${job }">
										<option value="${j.job_code }">${j.job_name }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-3 mb-3">
									<label>필요 기술</label>
									<input type="hidden" id="skill" name="skill" value=""> 
									<select class="form-control is-valid" id="IVskill" name="IVskill"> 
										<option value="">기술선택</option>
										
										<c:forEach var="s" items="${skill }">
										<option value="${s.skill_code }">${s.skill_name }</option>
										</c:forEach>
										
									</select>	
								</div>
								<div class="col-md-12 mb-12">
									<label>제목</label>
									<input type="text" class="form-control is-valid" name="title" id="validationServer02" placeholder="제목을 입력하시오" value="${workhere.work_title }"> 
								</div>
							</div>
						</div>
						
						<textarea cols="100" id="editor" rows="10" name="content" >${workhere.work_content }</textarea>
					</div>
					<ul class="pager">
						<li><input type="submit" class="btn btn-default" value="수정하기"></li>
						<li>
							<button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">취소하기</button>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>

	<!--start footer-->
	<c:import url="../footer.jsp" />
	<!--end footer-->
	<script
		src="${pageContext.request.contextPath}/resources/api/CKeditor/ckeditor.js"></script>
	<!-- summer note korean language pack -->
	<script
		src="${pageContext.request.contextPath}/resources/api/CKeditor/lang/ko.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/api/CKeditor/config.js"></script>
	<script>
			CKEDITOR.config.customConfig = '${pageContext.request.contextPath}/resources/api/CKeditor/config.js';
			CKEDITOR.replace( 'editor', {
				filebrowserImageUploadUrl: '${pageContext.request.contextPath}/resources/up',
				height: 400
			});
			</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- CALENDER -->
	<script
		src="<c:url value='/resources/js/calender/bootstrap-datetimepicker.min.js'/>"></script>
	<script
		src="<c:url value='/resources/js/calender/bootstrap-datetimepicker.ko.js'/>"></script>
	<script type="text/javascript">
	$('#IVstatus').on('change',function(){
		$('#interview_status').val($('#IVstatus option:selected').val());
	});
	$('.form_datetime1').datetimepicker({
        language:  'ko',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		startDate: new Date(),
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1,
        linkField: "start",
        linkFormat: "yyyy-mm-dd hh:ii"
    });
	$('.form_datetime2').datetimepicker({
        language:  'ko',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		startDate: new Date(),
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1,
        linkField: "end",
        linkFormat: "yyyy-mm-dd hh:ii"
    });
	function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('input[name=workplace]').val(fullAddr);
            }
        }).open();
    };
    $('#IVcareer').on('change',function(){
		$('#career').val($('#IVcareer option:selected').val());
	});
    $('#IVskill').on('change',function(){
		$('#skill').val($('#IVskill option:selected').val());
	});
    $('#IVjob').on('change',function(){
		$('#job').val($('#IVjob option:selected').val());
	});
    </script>
</body>
</html>