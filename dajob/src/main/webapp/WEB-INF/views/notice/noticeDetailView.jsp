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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/style.css'/>" media="screen"
	data-name="skins">

<link rel="stylesheet"
	href="<c:url value='/resources/css/font-awesome.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/animate.css'/>" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
header {
	background: url("/dajob/resources/images/page-header7.jpg") no-repeat;
}

table tr {
	padding: 5px 0 0 5px;
}
</style>
</head>
<body>

	<!--Start Header-->
	<header>
		<c:import url="../header.jsp" />
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
			</div>
			<!--./row-->
		</div>
		<!--./Container-->
	</header>

	<section class="wrapper">
		<section class="content typography">
			<div class="container">
				<div class="row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="dividerHeading">
							<h4>
								<span style="line-height: 20pt;">${notice.notice_title}
								&nbsp;&nbsp; &nbsp;&nbsp;
								<c:url var="nupView" value="/nupdateView.do">
									<c:param name="notice_no" value="${notice.notice_no}"/>
								</c:url>
								<c:url var="ndel" value="/ndelete.do">
									<c:param name="notice_no" value="${notice.notice_no}"/>
								</c:url>
								<button class="btn btn-primary btn-sm" onclick="location.href='${nupView}';">수정하기</button>
								&nbsp;&nbsp;&nbsp;
								<button class="btn btn-primary btn-sm" onclick="location.href='${ndel}';">삭제하기</button>
								<br>
								<font size="3">작성일 : ${notice.notice_date}</font>
								<c:if test="${member.member_type_code eq 'A'}">
								
							</p>
						</c:if>
						</span>
							</h4>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<p>
							<font size="4" style="line-height: 17pt;">${notice.notice_content}</font>
						</p>
					</div>
				</div>
				<div class="row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="dividerHeading">
							<h4>
								<span>Comments...</span>
							</h4>
						</div>
					</div>
					<%-- ${noticeReply} --%>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<c:if test="${!empty noticeReply}">
						<%-- <jsp:useBean id="memberList" class="java.util.ArrayList<org.kh.dajob.member.model.vo.Member>" />
						<c:forEach items="${mlist}" var="mName">
						 	<c:set target="" value=""/>
						 </c:forEach>
						<c:set target="${animalList}" value="Sylvester"/>
						<c:set target="${animalList}" value="Goofy"/>
						<c:set target="${animalList}" value="Mickey"/>
						<c:forEach items="${animalList}" var="animal">
						${animal}<br>
						</c:forEach> --%>

							<div id="comment">
								<ul id="comment-list">
									<c:forEach var="nrep" items="${noticeReply}">
										<c:if test="${nrep.notice_rep_level eq 0}">
											<li class="comment">
												<div class="avatar"><img alt="" src="${pageContext.request.contextPath}/resources/images/blog/avatar_2.png" class="avatar"></div>
												<div class="comment-container">
													<h4 class="comment-author writer_ori">
														<a href="#">${nrep.notice_rep_writer}</a>
													</h4>
													<div class="comment-meta">
														<a href="#" class="comment-date link-style1">${nrep.notice_rep_date}</a>
														<c:if test="${member.member_id eq nrep.notice_rep_writer}">
														<a class="comment-reply-link link-style3 confirm" style="right:140px; display: none;" href='javascript:void(0);' onclick="repUpConfirm(this);">수정 완료</a>
														<a class="comment-reply-link link-style3 reUpdate" style="right:80px;" href='javascript:void(0);' onclick="repUp(this);">댓글 수정</a>
														<a class="comment-reply-link link-style3" href='javascript:void(0);' onclick="repDel(this);">댓글 삭제</a>
														</c:if>
														<c:if test="${member.member_id ne nrep.notice_rep_writer}">
														<a class="comment-reply-link link-style3" href="#">Reply &raquo;</a>
														</c:if>
													</div>
													<div class="comment-body">
														<p>${nrep.notice_rep_content}</p>
													</div>
												</div> <c:forEach var="nrepLv1" items="${noticeReply}">
													<c:if
														test="${(nrepLv1.notice_rep_level eq 1) and (nrepLv1.notice_rep_ref eq nrep.notice_repno)}">
														<ul class="children">
															<li class="comment">
																<div class="avatar"><img alt="" src="${pageContext.request.contextPath}/resources/images/blog/avatar_2.png" class="avatar"></div>
																<div class="comment-container">
																	<h4 class="comment-author writer_ref">
																		<a href="#">${nrepLv1.notice_rep_writer}</a>
																	</h4>
																	<div class="comment-meta">
																		<c:if test="${member.member_id eq nrepLv1.notice_rep_writer}">
																		<a class="comment-reply-link link-style3 confirm" style="right:140px; display: none;" href='javascript:void(0);' onclick="repUpConfirm(this);">수정 완료</a>
																		<a class="comment-reply-link link-style3 reUpdate" style="right:80px;" href='javascript:void(0);' onclick="repUp(this);">댓글 수정</a>
																		<a class="comment-reply-link link-style3" href='javascript:void(0);' onclick="repDel(this);">댓글 삭제</a>
																		</c:if>
																		<c:if test="${member.member_id ne nrepLv1.notice_rep_writer}">
																		<a class="comment-reply-link link-style3" href="#">Reply &raquo;</a>
																		</c:if>
																	</div>
																	<div class="comment-body">
																		<p>${nrepLv1.notice_rep_content}</p>
																	</div>
																</div> <c:forEach var="nrepLv2" items="${noticeReply}">
																	<c:if
																		test="${(nrepLv2.notice_rep_level eq 2) and (nrepLv2.notice_rep_ref eq nrepLv1.notice_repno)}">
																		<ul class="children">
																			<li class="comment">
																				<div class="avatar"><img alt="" src="${pageContext.request.contextPath}/resources/images/blog/avatar_2.png" class="avatar"></div>
																				<div class="comment-container">
																					<h4 class="comment-author writer_ref">
																						<a href="#">${nrepLv2.notice_rep_writer}</a>
																					</h4>
																					<div class="comment-meta">
																						<a href="#" class="comment-date link-style1">${nrepLv2.notice_rep_date}</a>
																						<c:if test="${member.member_id eq nrepLv2.notice_rep_writer}">
																						<a class="comment-reply-link link-style3 confirm" style="right:140px; display: none;" href='javascript:void(0);' onclick="repUpConfirm(this);">수정 완료</a>
																						<a class="comment-reply-link link-style3 reUpdate" style="right:80px;" href='javascript:void(0);' onclick="repUp(this);">댓글 수정</a>
																						<a class="comment-reply-link link-style3 reDelete" href='javascript:void(0);' onclick="repDel(this);">댓글 삭제</a>
																						</c:if>
																					</div>
																					<div class="comment-body">
																						<p>${nrepLv2.notice_rep_content}</p>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</c:if>
																</c:forEach>
															</li>
														</ul>
													</c:if>
												</c:forEach>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
						</c:if>
						<c:if test="${empty noticeReply}">
							<div id="comment">
								<p align="center">현재 작성된 댓글이 없습니다.</p>
							</div>
						</c:if>
						<c:if test="${!empty member}">
							<!-- /#comments -->
							<div class="dividerHeading">
								<h4>
									<span>Leave a comment</span>
								</h4>
							</div>
							<form>
							<div class="comment-box row">
								<div class="col-sm-12">
									<p>
										<textarea name="comments" class="form-control" rows="6"
											cols="40" id="comments"
											onfocus="if(this.value == 'Message') { this.value = ''; }"
											onblur="if(this.value == '') { this.value = 'Message'; }"
											placeholder="Message">Message</textarea>
									</p>
								</div>
							</div>
							<a class="btn btn-lg btn-default" href="#">Post Comment</a>
							</form>
						</c:if>
						<p align="center">
							<a href="javascript:history.back();"
								class="btn btn-default btn-lg back_home"><i
								class="fa fa-arrow-circle-o-left"></i> Go to Back </a>
						</p>
					</div>
				</div>
			</div>
		</section>
	</section>
	<!--end wrapper-->
	<!--start footer-->
	<c:import url="../footer.jsp" />
	<!--end footer-->
	
	<script type="text/javascript">
        var innerText = null;
	function repUp(event){
		var pDiv = $(event).parent().parent().find(".comment-body");
		var confirmTag = $(event).parent().find(".confirm");
        
		$(confirmTag).toggle('slow');
		if($(event).text() == '수정 취소'){
			$(".comment-body").remove("textarea");
            $(".comment-body").text(innerText);
            $(event).text('댓글 수정');
		} else {
            innerText = $(pDiv).text();
            //console.log(innerText);
			$(event).text('수정 취소');
			$(".comment-body").text("");
       	 	$(".comment-body").insertAfter("<textarea>"+innerText+"</textarea>");
		}
	};
	
	function repUpConfirm(event){
		var pDiv = $(event).parent().parent();
		var isOrigin = pDiv.find('h4').hasClass('writer_ori');
		var updateTag = $(event).parent().find(".reUpdate");
		$(updateTag).text('댓글 수정');
		$(event).toggle('slow');

        if(isOrigin){
			//ajax 실행
		} else {
			//ajax 실행
		}
	};
	
	function repDel(event){
		var pDiv = $(event).parent().parent();
		var isOrigin = pDiv.find('h4').hasClass('writer_ori');
		if(isOrigin){
			//ajax 실행
		} else {
			//ajax 실행
		}
	};
	</script>
</body>
</html>