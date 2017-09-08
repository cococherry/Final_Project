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
header{
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
table input{
	height: 34px;
}
label{vertical-align:-1px}.inputBtn{width:13px;height:13px;vertical-align:text-top}
</style>
</head>
<body>
	<!--Start Header-->
	<header>	
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
<c:set var="certList" value="${requestScope.certList}"/>
<c:set var="comTypeList" value="${requestScope.comTypeList}"/>
	<!--start wrapper-->
	<section class="wrapper">
		<section class="content contact">
			<div class="container">
				<div class="row sub_content mtype">
					<c:if test="${member.member_type_code}"></c:if>
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
		$('input[name=member_id]').keyup(function() {
			$.ajax({
				url : "dupid.do",
				type : "post",
				data : {
					userid : $('#member_id').val()
				},
				dataType : "text",
				success : function(value) {
					//alert("서블릿이 보낸 값 : " + data);
					var regex = /^[A-Za-z0-9]{5,14}$/;
					if ($('#member_id').val().length < 5) {
						var str = "아이디는 5자 이상이어야 합니다.";
						$('.idchk').html(str).css(s_fail);
					} else if (!regex.test($('#member_id').val())) {
						var str = "아이디는 영문자와 숫자만 가능합니다.";
						$('.idchk').html(str).css(s_fail);
					} else if (value === "ok") {
						var str = "사용 가능한 아이디입니다.";
						$('.idchk').html(str).css(s_success);
					} else {
						var str = "이미 존재하는 아이디입니다. 다른 아이디로 정하십시오.";
						$('.idchk').html(str).css(s_fail);
					}
				},
				error : function(value) {
					alert("에러 : " + value);
				}
			});
			return false;
		});
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
                $('input[name=post_code]').val(data.zonecode); //5자리 새우편번호 사용
                $('input[name=addr1]').val(fullAddr);

                // 커서를 상세주소 필드로 이동한다.
                $('input[name=addr2]').focus();
            }
        }).open();
    };
	
	$(function() {
		$(".user").click(function() {
			reset();
			$(".enrollCompany").css('display', 'none');
			$(".enrollCompany .id").removeAttr('id', 'member_id');
			$(".enrollUser .id").attr('id', 'member_id');
			$(".enrollUser").show('slow');
		});
		$(".company").click(function() {
			reset();
			$(".enrollUser").css('display', 'none');
			$(".enrollUser .id").removeAttr('id', 'member_id');
			$(".enrollCompany .id").attr('id', 'member_id');
			$(".enrollCompany").show('slow');
		});
	});

	var reg_upw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;//6~16자 영문대소문자, 숫자, 특수문자 혼합하여 사용

	function passcheck(e) {
		console.log($(e).val());
		if (reg_upw.test($(e).val())) {
			$('.passcheckLayer').text("안전한 비밀번호입니다.").css(s_success);
		} else {
			$('.passcheckLayer').text("6~16자 영문대소문자, 숫자, 특수문자 혼합하여 사용하세요").css(	s_fail);
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
		}
		else if ($(e).val() == '9') {
			email2.removeAttr('readOnly');
			email2.val('');
			email2.focus();
		} else {
			email2.attr('readOnly', 'true');
			email2.val($(e).val());
		}
	};
	
	function reset() {
		$(".enrollUser input").not(".gender, .certChk, .welfare").each(function() {
			$(this).val('');
		});
		$(".enrollCompany input").not(".gender, .certChk, .welfare").each(function() {
			$(this).val('');
		});
		if($("#certChk").is(":checked")){
			$("#certChk").removeAttr('checked');
		}
		$('.passcheckLayer').text('');
		$('.passcheckLayer2').text('');
		$('.idchk').html('');
	};
	
	function checkDupCert(){
		var temp = [];
	    var obj = $('.certList');
	    var result = false;
	    $(obj).each(function(i) {
            temp[i] = $(this).find("select > option:selected").val();
        });
	    $(temp).each(function(i) {
            var x = 0;
            $(obj).each(function() {
            	if( temp[i] == $(this).find("select > option:selected").val() ) {
                    x++;
                }
            });
             
            // 임시 변수값이 1 이상, 즉 1개 이상 중복되는값이 있으면 바로 종료
            if(x > 1) {
            	result = true;
                return result;
            }
        });
	    
	    return result;
	};
	
	$("#userInsert").submit(function(event){
		$("#certCnt").val(cnt);
		if(checkDupCert()){
			alert('동일한 자격증이 존재합니다.');
			event.preventDefault();
		};
		
		return;
	});
	
	$(function() {
		$('.welfare').click(function(){
			// 배열 선언
			var arrayParam = new Array();

			//each로 loop를 돌면서 checkbox의 check된 값을 가져와 담아준다.
			$(".welfare:checked").each(function(){
				arrayParam.push($(this).val());
			});
			$("#company_wel").val(arrayParam);
		});
	      $("#certChk").change(function(){
	        if($("#certChk").is(":checked")){
	            cnt = 1;
	            $(".certList").toggle("slow");
	            $("#addCert").toggle("fast");
	            $("#delCert").toggle("fast");
	        }else{
	            cnt = 0;
	            $(".certList").not(":first").remove();
	            $(".certList").toggle("slow");
	            $("#addCert").toggle("fast");
	            $("#delCert").toggle("fast");
	        }
	    });
	     
	    $("#addCert").on("click",function(){
	    	cnt++;
	    	$(".certList:first").clone().insertAfter(".certList:last");
	        $(".certList:last select").attr({
	            name : 'cert'+cnt,
	            id : 'cert'+cnt
	        });
	        $(".certList:last input[type=date]").attr({
	            name : 'certDate'+cnt,
	            id : 'certDate'+cnt
	        });
	    });
	    $("#delCert").on("click",function(){
	    	if(cnt <= 1){
	            alert("더 이상 자격증 목록을 제거할 수 없습니다.\n사용하지 않으신다면\n사용 체크를 해제하세요!");
	        } else {
	            $(".certList:last").remove();
	    		cnt--;
	    	}
	    });
	    
	    var today = new Date();
	    var dd = today.getDate();
	    var mm = today.getMonth()+1; //January is 0!
	    var yyyy = today.getFullYear();
	     if(dd<10){
	            dd='0'+dd
	        } 
	        if(mm<10){
	            mm='0'+mm
	        } 

	    today = yyyy+'-'+mm+'-'+dd;
	    past = (yyyy-51)+'-'+mm+'-'+dd;
	    $("input[type=date]").attr('max', today);
	    $("input[type=date]").attr('min', past);
	});
</script>
</html>