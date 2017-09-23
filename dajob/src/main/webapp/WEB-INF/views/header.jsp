<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.10.2.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
    	<c:set var="member" value="${sessionScope.member}"/>
    	<c:if test="${empty member}">
	        <div id="top-info" class="hidden-xs clearfix">
	            <span><a href="enrollView.do"><i class="fa fa-edit"></i>Sign up</a></span>
	            <span><a href='#login-modal' data-toggle='modal' data-target='#login-modal'><i class="fa fa-sign-in"></i>Login</a></span>
	        </div>
		</c:if><c:if test="${!empty member}">
			<div id="top-info" class="hidden-xs clearfix">
	            <span>${member.member_name}님 환영합니다! &nbsp;&nbsp; <a href="logout.do"><i class="fa fa-sign-out"></i>Logout</a></span>
	        </div>
		</c:if>
		
        <div id="logo">
             <h1><a href="index.do"><img src="/dajob/resources/images/Pagelogo.png" alt="DaJob"/></a></h1>
        </div>

<!--================================
            Navigation
-------------------------------------->

        <div class="navbar navbar-default navbar-static-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle main" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            
            <div class="navbar-collapse collapse">
                <div class="navbar-header visible-xs">
                    <div class="navbar-brand" style="height:75px;">DA JOB Menu<br>
                    <c:if test="${empty member}">
	        		<div id="top-info" class="visible-xs clearfix">
	            		<span><a href="enrollView.do"><i class="fa fa-edit"></i>Sign up</a></span>
	            		<span><a href='#login-modal' data-toggle='modal' data-target='#login-modal'><i class="fa fa-sign-in"></i>Login</a></span>
	        		</div>
					</c:if><c:if test="${!empty member}">
					<div id="top-info" class="visible-xs clearfix">
	        		    <span>${member.member_name}님 환영합니다! &nbsp;&nbsp; <a href="logout.do"><i class="fa fa-sign-out"></i>Logout</a></span>
	        		</div>
					</c:if>
                    </div>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.do">Home</a></li>

                    <li><a href="nlist.do" id="notice">공지사항</a></li>

                    <li><a href="#" id="workhere">Work Here</a>
                    	<ul class="dropdown-menu">
                            <li><a href="jobList.do">직업별 분류</a></li>
                            <li><a href="skillList.do">능력별 분류</a></li>
                        </ul>
                    </li>
                    <li><a href="#" id="mypage">마이페이지</a>
                        <ul class="dropdown-menu">
                        <!--------- 일반 회원 메뉴 구성 --------->
                        <c:if test="${ member.member_type_code == 'U' }" >
                            <li><a href="myinfo.do">내 정보 수정/탈퇴</a></li>
                            <li><a href="resume.do">내 이력서 조회</a></li>
                             <li><a href="likeCompList.do">선호 기업 리스트</a></li>
                            <li><a href="#">입사 신청 기업 목록</a></li>
                            <li><a href="#">내 능력 분석</a></li>
                            <li><a href="interviewList.do">화상 면접 대기실</a></li>
                            </c:if>
                         <!---------/ 일반 회원 메뉴 구성 --------->
                         
                         <!--------- 기업 회원 메뉴 구성 --------->
                   			<c:if test="${ member.member_type_code == 'C' }" >
                   				<li><a href="myinfo.do">기업 정보 수정/탈퇴</a></li>
                            <li><a href="#">등록한 구인 정보 list</a>
                                <ul class="dropdown-menu">
                                    <li><a href="portfolio_masonry_2.html">Masonry portfolio 2</a></li>
                                    <li><a href="portfolio_masonry_3.html">Masonry portfolio 3</a></li>
                                    <li><a href="portfolio_masonry_4.html">Masonry portfolio 4</a></li>
                                </ul>
                            </li>
                            <li><a href="powerlink.do">PowerLink 정보</a></li>
                            <li><a href="#">구직 신청자 리스트</a></li>
                            <li><a href="interviewList.do">화상 면접 대기실</a></li>
                            
                   			</c:if>
                         <!---------/ 기업 회원 메뉴 구성 --------->
                        </ul>
                    </li>
                    <li><a href="#" id="itinfo">IT정보</a></li>
                    <li><a href="contact.do">Contact</a></li>
                </ul>
            </div>
        </div>
        <!---------------//Navigation------------>
        
        <!-- 서브메뉴 색상 변경 jQuery -->
<script>
	/* $(function() {
		//console.log("현 경로 : "+currentPath);
		$(".navbar-nav > li").each(
				function() {
					$(this).on('click',function(){
						$(".navbar-nav > li").not($(this)).removeClass('active');
			        	$(this).addClass('active');
					});
				});
	}); */
	 var currentPath = window.location.pathname.substr(window.location.pathname.lastIndexOf("/")+1);
	//console.log(currentPath);
	//console.log(window.location.pathname);
	$(function(){
		//console.log("현 경로 : "+currentPath);
		$(".navbar-nav > li").each(function(){
	        var usePage = $(this).children('a').attr('href').substr($(this).children('a').attr('href').lastIndexOf("/")+1);
	        //console.log(usePage);
	        if(currentPath == usePage){
	        	$(".navbar-nav > li").not($(this)).removeClass('active');
	        	$(this).addClass('active');
	        } else if(currentPath.indexOf("notice") != -1 || currentPath.indexOf("nlist") != -1 || currentPath.indexOf("ndetail") != -1){
                $(".navbar-nav > li").removeClass('active');
	        	$("li#notice").addClass('active');
            } else if(currentPath.indexOf("workhere") != -1 || currentPath.indexOf("nlist") != -1 || currentPath.indexOf("ndetail") != -1){
                $(".navbar-nav > li").removeClass('active');
	        	$("li#workhere").addClass('active');
            } else if(currentPath.indexOf("mypage") != -1 || currentPath.indexOf("nlist") != -1 || currentPath.indexOf("ndetail") != -1){
                $(".navbar-nav > li").removeClass('active');
	        	$("li#mypage").addClass('active');
            } else if(currentPath.indexOf("itinfo") != -1 || currentPath.indexOf("nlist") != -1 || currentPath.indexOf("ndetail") != -1){
                $(".navbar-nav > li").removeClass('active');
	        	$("li#itinfo").addClass('active');
            } else {
            	$(".navbar-nav > li").removeClass('active');
            	$(".navbar-nav > li").eq(0).addClass('active');
            }
	        //console.log("참조할 경로 : "+$(this).children('a').attr('href').substr($(this).children('a').attr('href').lastIndexOf("/")+1));
	    });
	}); 
</script>
<!-- 서브메뉴 색상 변경 End -->

<!-- Modal Start -->
<style type="text/css">
.modal-dialog {
    width: 300px;
}
.modal-footer {
    height: 70px;
    margin: 0;
}
.modal-footer .btn {
    font-weight: bold;
}
.input-group-addon {
    color: #fff;
    background: #3276B1;
}
.prettyline {
  height: 5px;
  border-top: 0;
  background: #c4e17f;
  border-radius: 5px;
  background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
}
</style>
<script type="text/javascript">
$(function(){
    $('.modal-footer > button').click(function(){
    	login();
	});
});
function chkEnter(){
	 var keycode = event.keyCode;
	 if( keycode == 13 ){
	  login();
	}else{
	  return false;
	}
};
function login(){
	$.ajax({
		url : "login.do",
		data : {member_id : $('#uLogin').val(), member_password : $('#uPassword').val()},
		type : "post",
		success : function(result){
			if(result == "ok"){
				alert("로그인 성공!");
				location.href = "index.do";
			} else {
				alert("로그인 실패!! 입력값을 재확인 하세요!");
				location.href = "index.do";
			}
		}, error : function(request,status,error) {
			alert("ERROR code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			location.href = "404-page.do?message='로그인 서비스 실패'";
		}
	});
	$('#login-modal').modal('hide');
};
</script>
 <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<p class="modal-title" id="myModalLabel" align="center">
				<img src="/dajob/resources/images/frontlogo3_fix.png" style="height:30px; width:auto; margin-top: -6px;">
				&nbsp;&nbsp;<b style="font-size: 16pt;">Log in</b></p>
			</div> <!-- /.modal-header -->

			<div class="modal-body">
				<form role="form" id="loginform">
					<div class="form-group">
						<div class="input-group">
							<label for="uLogin" class="input-group-addon glyphicon glyphicon-user"></label>
							<input type="text" class="form-control" id="uLogin" placeholder="Login">
						</div>
					</div> <!-- /.form-group -->

					<div class="form-group">
						<div class="input-group">
							<label for="uPassword" class="input-group-addon glyphicon glyphicon-lock"></label>
							<input type="password" class="form-control" id="uPassword" placeholder="Password" onkeydown="chkEnter();">
						</div> <!-- /.input-group -->
					</div> <!-- /.form-group -->
				</form>

			</div> <!-- /.modal-body -->

			<div class="modal-footer">
				<button class="form-control btn btn-default btn-block">Ok</button>
			</div> <!-- /.modal-footer -->

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- Modal End -->

<!-- 로그인 여부를 확인하고 로그인 모달 창 호출 -->
<script type="text/javascript">
$(document).on('click',function(){
	if($('.collapse').hasClass('in')){
		$('.collapse').removeClass('in');
    	$('.collapse').toggle('slow');
	}
})
$('.main').on('click',function(){
	$('.main').hide();
    $('.collapse').toggle('slow');
    $('.main').show('slow');
})
	$(function(){
		$('#mypage ul li a').on("click", function(){
			if($('a').first().text().trim() == "Login"){
				$("#login-modal").modal();
				return false;
			}
		});
		$(".main").css('z-index','10000');
	});
</script>