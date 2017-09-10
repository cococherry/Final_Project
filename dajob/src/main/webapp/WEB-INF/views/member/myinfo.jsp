<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>My info : Da Job</title>
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
	background: url("/dajob/resources/images/page-header6.jpg") no-repeat;
}

font {
	font-size: 14pt;
}

table {
	margin-left: auto;
	margin-right: auto;
}

table tr td {
	size: 7px;
	padding-bottom: 5px;
	text-align: left;
}

table input {
	height: 34px;
}

label {
	vertical-align: -1px
}

.inputBtn {
	width: 13px;
	height: 13px;
	vertical-align: text-top
}
</style>
</head>
<body>
	<!--Start Header-->
	<header>
	<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/header.jsp"/> --%>
		<c:import url="../header.jsp" />
		<div class="container page_head">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h2>My info</h2>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav id="breadcrumbs">
						<ul>
							<li>You are here:</li>
							<li><a href="index.do">Home</a></li>
							<li>My info</li>
						</ul>
					</nav>
				</div>
			</div>
			<!--./row-->
		</div>
		<!--./Container-->
	</header>

	<!--start wrapper-->
	<section class="wrapper">
		<section class="content contact">
			<div class="container">
				<div class="row sub_content">
					<c:if test="${sessionScope.member.member_type_code eq 'U'}">
						<c:set var="certList" value="${requestScope.certVaules}" />
						<c:set var="userCert" value="${requestScope.certList}" />
					<form action="userUpdate.do" method="post" id="userUpdate">
						<input type="number" name="certCnt" id="certCnt" style="display: none;">
							<table style="align-content: center; padding: 8px;">
								<tr><td>아이디 : </td>
									<td><input type="text" class="id" name="member_id"
									 size="52%" value="${myinfo.member_id}" readonly></td>
								</tr>
								<tr><td>비밀번호 : </td>
									<td><input type="password" name="member_password"
										onkeyup="passcheck(this)" size="52%" value="${myinfo.member_password}"></td>
								</tr>
								<tr>
									<td colspan="2"><span class="passcheckLayer"></span></td>
								</tr>
								<tr><td>비밀번호확인 : </td>
									<td><input type="password" name="member_password2"
										placeholder="비밀번호 확인" onkeyup="passcheck2(this)" size="52%"></td>
								</tr>
								<tr>
									<td colspan="2"><span class="passcheckLayer2"></span></td>
								</tr>
								<tr><td>프로필<br>이미지 : </td>
									<td><p align="center"><input type="file" name="member_profile_img"></p></td>
								</tr>
								<tr><td>회원이름 : </td>
									<td><input type="text" name="member_name"
									 size="52%" readonly value="${myinfo.member_name}"></td>
								</tr>
								<tr><td>E-Mail : </td>
									<td>
									<c:forTokens var="email" items="${myinfo.member_email}" delims="@" varStatus="status">
									<c:if test="${status.count eq 1}">
									<input type="text" name="email1" size="15" value="${email}">&nbsp;
										@&nbsp;</c:if><c:if test="${status.count eq 2}"> <input type="text" name="email2"
										style="width: 120px" value="${email}" readOnly></c:if>
									</c:forTokens>
										&nbsp; 
										<select	name="email" onchange="email_change(this)">
											<option value="0">변경할 주소를 선택하세요</option>
											<option value="9">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="nate.com">nate.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="gmail.com">gmail.com</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="yahoo.co.kr">yahoo.co.kr</option>
									</select></td>
								</tr>
								<tr><td>연락처 : </td>
									<td><input type="tel" name="member_phone"
										size="52%" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" value="${myinfo.member_phone}"></td>
								</tr>
								
								<tr><td>우편번호 : </td>
									<td>
									<c:forTokens var="addr" items="${myinfo.member_address}" delims="," varStatus="status">
										<c:if test="${ status.count eq 1}">
									<input type="text" name="post_code"
										value="${addr}">&nbsp;&nbsp;<button type="button" class="btn btn-default btn-xs" onclick="execDaumPostcode();">찾기</button>
										</c:if></c:forTokens></td>
								</tr>
								<tr><td>주소 : </td>
									<td><c:forTokens var="addr" items="${myinfo.member_address}" delims="," varStatus="status">
									<c:if test="${ status.count eq 2}">
									<input type="text" name="addr1" value="${addr}" size="22%" ></c:if>
									<c:if test="${ status.count eq 3}">
									&nbsp;<input type="text" name="addr2" value="${addr}" placeholder="상세주소" size="22%">
									</c:if>
										</c:forTokens></td>
								</tr>
								
								<tr><td>성별 : </td>
									<td><c:if test="${myinfo.gender eq 'M'}">
										<input type="radio" class="inputBtn gender" name="gender" value="M" checked>
										<label for="gender" class="inputBtn" style="display:inline;">&nbsp;남성</label>
  										&nbsp;&nbsp; &nbsp;&nbsp;<input class="inputBtn gender" type="radio" name="gender" value="F">
  										<label for="gender" class="inputBtn" style="display:inline;">&nbsp;여성</label>
  										</c:if><c:if test="${myinfo.gender eq 'F'}">
  										<input type="radio" class="inputBtn gender" name="gender" value="M">
										<label for="gender" class="inputBtn" style="display:inline;">&nbsp;남성</label>
  										&nbsp;&nbsp; &nbsp;&nbsp;<input class="inputBtn gender" type="radio" name="gender" value="F" checked>
  										<label for="gender" class="inputBtn" style="display:inline;">&nbsp;여성</label>
  										</c:if></td>
								</tr>
								<tr><td>생년월일 : </td>
									<td><input type="date" name="birthday" value="${myinfo.birthday}"></td>
								</tr>
								<tr>
								<td>보유한 자격증</td>
								<td>
								<c:if test="${!empty userCert}">
									<table>
										<thead>
										<tr><td>자격증 명</td><td>취득일</td></tr>
										</thead>
										<tbody>
									<c:forEach var="cert" items="${userCert}">
										<c:forEach var="certNo" items="${certList}">
										<tr>
											<td class="myCert"><c:if test="${cert.cert_no eq certNo.cert_no}">${certNo.cert_name}</c:if></td>
											<td>${cert.cert_date}</td>
										</tr>
										</c:forEach>
									</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty userCert}">
									<p align="center">보유한 자격증이 없습니다.</p>
								</c:if>
								</td>
								</tr>
								<tr><td>자격증 추가</td><td><input type="checkbox" value="certChk" name="certChk" id="certChk" class="certChk inputBtn"><label for="certChk" class="certChk inputBtn" style="display:inline;">&nbsp;자격증 유/무</label>
									&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default" name="addCert" id="addCert" style="display: none;"><i class="fa fa-plus"></i></button>
        							&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default" name="delCert" id="delCert" style="display: none;"><i class="fa fa-minus"></i></button>
        							<div class="certList" style="margin-top:7px; display: none;">
						        	<select name="cert1" id="cert1" style="text-ailgn:center;">
						        	<option value="">--- 선택 ---</option>
						        	<c:forEach var="certName" items="${certList}">
						        	<option value="${certName.cert_no}">${certName.cert_name}</option>
						        	</c:forEach>
						        	</select>&nbsp;&nbsp;&nbsp;<input type="date" class="certDate" id="certDate1" name="certDate1">
        							</div>
        						</td></tr>
								<tr style="height: 100px;">
									<td colspan="2" style="text-align: center;">
									<button class="btn btn-primary" type="submit">수정하기</button>&nbsp;&nbsp;
									<button class="btn btn-danger" type="button" onclick="javascript:location.href='mdelete.do';">탈퇴하기</button></td>
								</tr>
							</table>
						</form>
					</c:if>
					<c:if test="${sessionScope.member.member_type_code eq 'C'}">
						<c:set var="comTypeList" value="${requestScope.comType}" />
						<form action="compUpdate.do" method="post" id="compUpdate">
							<input type="hidden" id="company_wel" name="company_wel">
							<table style="align-content: center; padding: 8px;">
								<tr><td>아이디 : </td>
									<td><input type="text" class="id" name="member_id"
									 size="52%" value="${myinfo.member_id}" readonly></td>
								</tr>
								<tr><td>비밀번호 : </td>
									<td><input type="password" name="member_password"
										onkeyup="passcheck(this)" size="52%" value="${myinfo.member_password}"></td>
								</tr>
								<tr>
									<td colspan="2"><span class="passcheckLayer"></span></td>
								</tr>
								<tr><td>비밀번호확인 : </td>
									<td><input type="password" name="member_password2"
										placeholder="비밀번호 확인" onkeyup="passcheck2(this)" size="52%"></td>
								</tr>
								<tr>
									<td colspan="2"><span class="passcheckLayer2"></span></td>
								</tr>
								<tr><td>기업<br>이미지 : </td>
									<td><p align="center"><input type="file" name="member_profile_img"></p></td>
								</tr>
								<tr><td>기업 명 : </td>
									<td><input type="text" name="company_name" size="52%" value="${myinfo.company_name}"></td>
								</tr>
								<tr><td>사업자 등록 번호 : </td>
									<td><input type="text" name="company_code"
										 value="${myinfo.company_code}" size="52%" pattern="[0-9]{3}-[0-9]{2}-[0-9]{5}"></td>
								</tr>
								<tr><td>회사 연락처 : </td>
									<td><input type="tel" name="company_tel"
										 value="${myinfo.company_tel}" size="52%" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"></td>
								</tr>
								<tr><td>FAX 번호 : </td>
									<td><input type="tel" name="company_fax"
										 value="${myinfo.company_fax}" size="52%" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"></td>
								</tr>
								<tr><td>담당자이름 : </td>
									<td><input type="text" name="member_name"
										value="${myinfo.member_name}" size="52%"></td>
								</tr>
								<tr><td>연락처 : </td>
									<td><input type="tel" name="member_phone"
										value="${myinfo.member_phone}" size="52%" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"></td>
								</tr>
								<tr><td>E-Mail : </td>
									<td>
									<c:forTokens var="email" items="${myinfo.member_email}" delims="@" varStatus="status">
									<c:if test="${status.count eq 1}">
									<input type="text" name="email1" size="15" value="${email}">&nbsp;
										@&nbsp;</c:if><c:if test="${status.count eq 2}"> <input type="text" name="email2"
										style="width: 120px" value="${email}" readOnly></c:if>
									</c:forTokens>&nbsp; 
										<select	name="email" onchange="email_change(this)" style="height:35px;">
											<option value="0">변경하실 Email</option>
											<option value="9">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="nate.com">nate.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="nate.com">nate.com</option>
											<option value="yahoo.co.kr">yahoo.co.kr</option>
											<option value="gmail.com">gmail.com</option>
									</select></td>
								</tr>
								<tr><td>우편번호 : </td>
									<td>
									<c:forTokens var="addr" items="${myinfo.member_address}" delims="," varStatus="status">
										<c:if test="${ status.count eq 1}">
									<input type="text" name="post_code"
										value="${addr}">&nbsp;&nbsp;<button type="button" class="btn btn-default btn-xs" onclick="execDaumPostcode();">찾기</button>
										</c:if></c:forTokens></td>
								</tr>
								<tr><td>기업 주소 : </td>
									<td><c:forTokens var="addr" items="${myinfo.member_address}" delims="," varStatus="status">
									<c:if test="${ status.count eq 2}">
									<input type="text" name="addr1" value="${addr}" size="22%" ></c:if>
									<c:if test="${ status.count eq 3}">
									&nbsp;<input type="text" name="addr2" value="${addr}" size="22%">
									</c:if>
										</c:forTokens></td>
								</tr>
								<tr><td>기업 규모 : </td>
									<td><select	name="company_type" style="height:35px; width:145px;">
											<option value="0">선택하세요</option>
											<c:forEach var="comType" items="${comTypeList}">
											<c:if test="${comType.company_type eq myinfo.company_type}">
												<option value="${comType.company_type}" selected>${comType.company_tname}</option>
											</c:if>
											<c:if test="${comType.company_type ne myinfo.company_type}">
												<option value="${comType.company_type}">${comType.company_tname}</option>
											</c:if>
											</c:forEach>
									</select></td>
								</tr>
								<tr><td>사원수 : </td>
									<td><input type="number" name="company_staff" value="${myinfo.company_staff}" min="1" style="width:200px;"></td>
								</tr>
								<tr><td>기업자본 : </td>
									<td><input type="number" name="company_capital" value="${myinfo.company_capital}" min="1" style="width:200px;"> (백만원 단위)</td>
								</tr>
								<tr><td>창립연도 : </td>
									<td><input type="date" name="company_date" value="${company_date}"></td>
								</tr>
								<tr><td>복지 정보 : </td>
									<td>
										<table id="inline-table">
											<tr>
												<td>
												<input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="4대보험">
												<label for="company_welfare" class="inputBtn" style="display:inline;">4대보험</label>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</td>
												<td><input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="석식 제공">
												<label for="company_welfare" class="inputBtn" style="display:inline;">석식 제공</label>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td><input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="유류비 지원">
									<label for="company_welfare" class="inputBtn" style="display:inline;">유류비 지원</label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td><input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="숙식 제공">
									<label for="company_welfare" class="inputBtn" style="display:inline;">숙식 제공</label></td>
											</tr>
											<tr>
												<td><input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="상여금 지급">
									<label for="company_welfare" class="inputBtn" style="display:inline;">상여금 지급</label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td><input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="야근 수당">
									<label for="company_welfare" class="inputBtn" style="display:inline;">야근 수당</label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td><input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="자기개발비 지원">
									<label for="company_welfare" class="inputBtn" style="display:inline;">자기개발비 지원</label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td><input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="야근 수당">
									<label for="company_welfare" class="inputBtn" style="display:inline;">자녀 학자금</label></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr style="height: 100px;">
									<td colspan="2" style="text-align: center;">
									<button class="btn btn-primary" type="submit">수정하기</button>&nbsp;&nbsp;
									<button class="btn btn-danger" type="button" onclick="javascript:location.href='mdelete.do';">탈퇴하기</button></td>
								</tr>
							</table>
						</form>
					</c:if>
				</div>
				<div class="row sub_content">
				
				</div>
				<p align="center">
					<a href="javascript:history.back();"
						class="btn btn-default btn-lg back_home"> <i
						class="fa fa-arrow-circle-o-left"></i> Go to Back
					</a>
				</p>
			</div>
		</section>
	</section>
	<!--end wrapper-->

	<!--start footer-->
	<c:import url="../footer.jsp" />
	<!--end footer-->
</body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	var cnt = 0;
	var s_default = {
		"border" : "1px solid #ccc",
		"background-color" : "#fff"
	}; //기본
	var s_fail = {
		"font-size" : "8pt",
		"color" : "red",
		"text-align" : "center"
	}; //실패
	var s_success = {
		"font-size" : "8pt",
		"color" : "green",
		"text-align" : "center"
	}; //성공
	$(function() {
		$('checkbox').attr('checked', false);
	});

	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						$('input[name=post_code]').val(data.zonecode); //5자리 새우편번호 사용
						$('input[name=addr1]').val(fullAddr);

						// 커서를 상세주소 필드로 이동한다.
						$('input[name=addr2]').focus();
					}
				}).open();
	};

	var reg_upw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;//6~16자 영문대소문자, 숫자, 특수문자 혼합하여 사용

	function passcheck(e) {
		console.log($(e).val());
		if (reg_upw.test($(e).val())) {
			$('.passcheckLayer').text("안전한 비밀번호입니다.").css(s_success);
		} else {
			$('.passcheckLayer').text("6~16자 영문대소문자, 숫자, 특수문자 혼합하여 사용하세요").css(
					s_fail);
		}
	};

	function passcheck2(e) {
		console.log($(e).parents());
		if ($(e).parent().parent().parent().find('input[name=member_password]')
				.val() != $(e).val()) {
			$('.passcheckLayer2').text("비밀번호가 일치하지 않습니다.").css(s_fail);
		} else {
			$('.passcheckLayer2').text("비밀번호 확인").css(s_success);
		}
	};

	function email_change(e) {
		var email2 = $(e).parent().find('input[name=email2]');
		if ($(e).val() == '0') {
			email2.attr('readOnly', 'true');
			email2.val('');
		} else if ($(e).val() == '9') {
			email2.removeAttr('readOnly');
			email2.val('');
			email2.focus();
		} else {
			email2.attr('readOnly', 'true');
			email2.val($(e).val());
		}
	};

	function checkDupCert() {
		var temp = [];
		var obj = $('.certList');
		var result = false;
		$(obj).each(function(i) {
			temp[i] = $(this).find("select > option:selected").val();
		});
		$(temp).each(function(i) {
			var x = 0;
			$(obj).each(function() {
				if (temp[i] == $(this).find("select > option:selected").val()) {
					x++;
				}
			});

			// 임시 변수값이 1 이상, 즉 1개 이상 중복되는값이 있으면 바로 종료
			if (x > 1) {
				result = true;
				return result;
			}
		});

		return result;
	};

	$("#userUpdate, #compUpdate").submit(function(event) {
		if ($('input[name=member_password]').val() != $('input[name=member_password2]').val()){
			alert('비밀번호와 확인값이 일치하지 않습니다.');
			event.preventDefault();
		}
		if (checkDupCert()) {
			alert('동일한 자격증이 존재합니다.');
			event.preventDefault();
		};
		return;
	});

	$(function() {
        var checkCompWelfare = "<c:out value='${myinfo.company_welfare}'/>";
		var chkwel = checkCompWelfare.split(',');
        chkwel.forEach(function(value){
           $(".welfare").each(function(){
               if($(this).val == value){
                   $(this).attr("checked");
               }
            }); 
        });
		$('.welfare').click(function() {
			// 배열 선언
			var arrayParam = new Array();
			//each로 loop를 돌면서 checkbox의 check된 값을 가져와 담아준다.
			$(".welfare:checked").each(function() {
				arrayParam.push($(this).val());
			});
			$("#company_wel").val(arrayParam);
		});
		$("#certChk").change(function() {
			if ($("#certChk").is(":checked")) {
				cnt = 1;
				$(".certList").toggle("slow");
				$("#addCert").toggle("fast");
				$("#delCert").toggle("fast");
			} else {
				cnt = 0;
				$(".certList").not(":first").remove();
				$(".certList").toggle("slow");
				$("#addCert").toggle("fast");
				$("#delCert").toggle("fast");
			}
		});

		$("#addCert").on("click", function() {
			cnt++;
			$(".certList:first").clone().insertAfter(".certList:last");
			$(".certList:last select").attr({
				name : 'cert' + cnt,
				id : 'cert' + cnt
			});
			$(".certList:last input[type=date]").attr({
				name : 'certDate' + cnt,
				id : 'certDate' + cnt
			});
		});
		$("#delCert").on("click", function() {
			if (cnt <= 1) {
				alert("더 이상 자격증 목록을 제거할 수 없습니다.\n사용하지 않으신다면\n사용 체크를 해제하세요!");
			} else {
				$(".certList:last").remove();
				cnt--;
			}
		});

		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!
		var yyyy = today.getFullYear();
		if (dd < 10) {
			dd = '0' + dd
		}
		if (mm < 10) {
			mm = '0' + mm
		}

		today = yyyy + '-' + mm + '-' + dd;
		past = (yyyy - 51) + '-' + mm + '-' + dd;
		$("input[type=date]").attr('max', today);
		$("input[type=date]").attr('min', past);
	});
</script>
</html>