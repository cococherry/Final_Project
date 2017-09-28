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
	
	<!-- 기본CSS FILES -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>" media="screen" data-name="skins">
    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/animate.css'/>"/>

	<!-- CKeditor CSS FILES -->
	<link href="${pageContext.request.contextPath}/resources/api/CKeditor/contents.css"" rel="stylesheet">
	<%-- <link rel="stylesheet" href="<c:url value='/resources/css/sntest.css'/>"/> --%>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    body {
    	margin : 0;
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
                    <h2>나의 이력서</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li>You are here:</li>
                            <li><a href="index.html">Home</a></li>
                            <li><a href="index.html">Mypage</a></li>
                            <li>My resume</li>
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
		        <!-- ===========================
		        HEADER
		        ============================ -->
		        <div id="header" class="row">
		            <div class="col-lg-2" style="padding-bottom:15px">
		            <c:if test="${!user.member_profile_img}">
		            	<img class="propic" src="/dajob/resources/images/userImage/${user.member_profile_img}" alt="" height="165px" width="165px">
		            </c:if><c:if test="${user.member_profile_img}">
		                <img class="propic" src="/dajob/resources/images/img-style.png" alt="" height="165px" width="165px">
		            </c:if>
		            </div>
		            <!-- photo end-->
		
		            <div class="col-lg-10">
		                    <div class="row">
		                        <div class="col-lg-7">
		                            <h1>${user.member_id}</h1>
		                        </div>
		                    </div>
		                    <h2>${user.member_name}</h2>
		                <!-- Title end-->
		
		                <!-- ===========================
		                SOCIAL & CONTACT
		                ============================ -->
		                <div class="row">
		                	<div style="pointer-events: none">
			                    <div class="col-sm-4">
			                        <ul class="list-unstyled">
			                            <li><a><span class="social fa fa-envelope-o"></span> : ${user.member_email}</a>
			                            </li>
			                            <li><a><span class="social fa fa-phone"></span> : ${user.member_phone}</a>
			                            </li>
			                            <li>
			                            
			                            <a><span class="social fa fa-location-arrow"></span> : 
			                            <c:forTokens var="addr" items="${user.member_address}" delims="," varStatus="vs">
				                            <c:if test="${ vs.index ne 0 }">
				                            ${addr}
				                            </c:if>
			                            </c:forTokens>
			                            </a>
			                            </li>
			                        </ul>
			                    </div><!-- social 1st col end-->
			
			                    <div class="col-sm-4">
			                        <ul class="list-unstyled">
			                            <li>
			                            <c:if test="${ user.gender eq 'F' }">
			                            <a><span class="social fa fa-child"></span> : 여</a>
			                            </c:if><c:if test="${ user.gender eq 'M' }">
			                            <a><span class="social fa fa-child"></span> : 남</a>
			                            </c:if>
			                            </li>
			                            <li><a><span class="social fa fa-calendar"></span> : ${user.birthday}</a>
			                            </li>
			                            <li><a><span class="social fa fa-list-alt"></span> : 
			                            		<c:if test="${ empty countCert }">
			                            			0개 보유
			                            		</c:if>
			                            		<c:forEach items="${countCert}"  var="countCert" varStatus="vs">
			                            			<c:if test="${ countCert.cert_value eq '총합' }">
			                            				${ countCert.cert_count }개 보유
			                            			</c:if>
			                            		</c:forEach>
			                            	</a>
			                            </li>
			                        </ul>
			                    </div><!-- social 2nd col end-->
		                    
		                    </div>
		                </div><!-- header social end-->
		            </div><!-- header right end-->
		        </div><!-- header end-->
		
		        <hr class="firsthr">
		
		        <!-- ===========================
		        BODY LEFT PART
		        ============================ -->
		        <div class="col-md-8 mainleft">
		        
		        	<!-- <div>
		        		<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
			            <div id="statement" class="row mobmid">
			                <div class="col-sm-1">
			                    <span class="secicon fa fa-question-circle"><strong>&nbsp;help</strong></span>
			                </div>
			
			                <div class="col-sm-11">
			                    <h3>이력서를 마음껏 꾸며보세요! </h3>
			                    <p>자신의 프로필을 자유롭게 꾸며보세요,</p>
			                    <p>자신의 <b>경력</b>, <b>학력</b>, <b>프로젝트 참여</b> 등과 같은 자신의 정보를 사진과 함께 자유롭게 만들어 보세요!<br>
			                   		이력서에 관한 <b>첨부파일</b>을 우측 파일첨부란에 첨부가능합니다!</p>    
				                <button class="btn btn-primary btn-sm" type="button" href='#ex-modal' 
				                data-toggle='modal' data-target='#ex-modal' onclick="exView()">예제보기</button>
			                </div>
			            </div>
			            <hr>
					</div> -->
					
					<c:if test="${!empty user.resume_data}">
					<div class="row">
						<div class="col-sm-12">
							<a href="resumeUpdate.do" style="float: right;">수정하기</a>
						</div>
						<div class="col-sm-12">
							<div>
								${user.resume_data}
							</div>
						</div>
					</div>
					
					<hr>
					
					</c:if><c:if test="${empty user.resume_data}">
					<div class="row">
						<p style="margin-top:30%; margin-bottom:30%;" align="center">
						등록하신 <b style="color:#339933">이력서</b>가 없네요
						<br> 지금바로 추가하세요!
						<br><br>
						<a href="resumeUpdate.do"><button class="btn btn-success btn-md" type="button"><i class="fa fa-pencil"></i> 이력서 등록하기</button></a>
						</p>
					</div>
					</c:if>

		        </div><!--left end-->
		        <!-- ===========================
		        SIDEBAR
		        =========================== -->
		        <div class="col-md-4 mainright">
		            <div class="row">
		                <div class="col-sm-1 col-md-2 mobmid">
		                </div><!--icon end-->
		                <div class="col-sm-11 col-md-10" style="padding-left:0;">
		                    <h3 class="mobmid" style="margin-bottom:20px;"><span class="secicon fa fa-tasks">&nbsp;&nbsp; 보유 자격증 현황</span></h3>
		                    
		                    <c:if test="${!empty totalCert}">
		                    
		                    <c:forEach items="${countCert}"  var="countCert" varStatus="vs">
			                	<c:if test="${ countCert.cert_value eq '공통' }">
			                		
				                	<h4>공통</h4>
									<p>≫
									<c:forEach items="${totalCert}"  var="totalCert" varStatus="vs">
										<c:if test="${totalCert.cert_type eq '공통'}">
											 ${totalCert.cert_name}
					                    </c:if>
				                    </c:forEach>
				                    </p> 
				                    <div class="progress">
				                	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100" style="width: ${ countCert.cert_count * 17 }%">
				                    	<span class="sr-only"></span>
				                    </div>
				                	</div>         
			                		
			                	</c:if>
			               	</c:forEach>
			               	
			               	<c:forEach items="${countCert}"  var="countCert" varStatus="vs">
			                	<c:if test="${ countCert.cert_value eq 'DB' }">
			                		
				                	<h4>DB</h4>
									<p>≫
									<c:forEach items="${totalCert}"  var="totalCert" varStatus="vs">
										<c:if test="${totalCert.cert_type eq 'DB'}">
											 ${totalCert.cert_name}
					                    </c:if>
				                    </c:forEach>
				                    </p> 
				                    <div class="progress">
				                	<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100" style="width: ${ countCert.cert_count * 17 }%">
				                    	<span class="sr-only"></span>
				                    </div>
				                	</div>         
			                		
			                	</c:if>
			               	</c:forEach>
			               	
			               	<c:forEach items="${countCert}"  var="countCert" varStatus="vs">
			                	<c:if test="${ countCert.cert_value eq 'JAVA' }">
			                		
				                	<h4>JAVA</h4>
									<p>≫
									<c:forEach items="${totalCert}"  var="totalCert" varStatus="vs">
										<c:if test="${totalCert.cert_type eq 'JAVA'}">
											 ${totalCert.cert_name}
					                    </c:if>
				                    </c:forEach>
				                    </p> 
				                    <div class="progress">
				                	<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100" style="width: ${ countCert.cert_count * 34 }%">
				                    	<span class="sr-only"></span>
				                    </div>
				                	</div>         
			                		
			                	</c:if>
			               	</c:forEach>
			               	
			               	</c:if><c:if test="${empty totalCert}">
			               		<p style="margin-top:50px; margin-bottom:50px;" align="center">
			               		보유한 <b style="color:#00bdd2">자격증</b>이 없습니다.
			               		<br><br><a href="myinfo.do"><button class="btn btn-info btn-xs" type="button">자격증 등록</button></a>
			               		</p>
			               	</c:if>
		                    
		                </div><!--info end-->
		            </div><!--tech skills end-->
		            
		            <hr>
		
		            <div class="row mobmid">
		                <div class="col-sm-1 col-md-2">
		                </div><!--icon end-->
			          	<div class="col-sm-11 col-md-10" style="padding-left:0;">
							<h3 style="margin-bottom:20px;"><span class="secicon fa fa-star"></span>&nbsp;&nbsp; 선호 기업 리스트</h3>
							<c:if test="${ !empty likeList }">			                    
			                    <c:forEach items="${ likeList }" var="likeList" varStatus="vs">
			                    <div class="award">
			                        <h4>${ likeList.company_name }</h4>
			                        <p>{ likeList.work_title }</p>
			                        <p class="sub"><a href="">자세히 보기</a></p>
			                    </div>
			                    </c:forEach>
			                </c:if><c:if test="${ empty likeList }">
		                			<p style="margin-top:50px; margin-bottom:50px;" align="center">
		                			선호하는 <b style="color:#00bdd2">기업</b>이 없습니다.
		                			<br><br><a href="likeCompList.do"><button class="btn btn-info btn-xs" type="button">선호기업 등록</button></a>
		                			</p>
		                	</c:if>
			        	</div><!--awards end-->
		            </div>
		            
		            <hr>
		
					<div class="row">
		                <div class="col-sm-1 col-md-2 mobmid">
		                </div><!--icon end-->
		                <div class="col-sm-11 col-md-10" style="padding-left:0;">
		                    <h3 class="mobmid" style="margin-bottom:20px;"><span class="secicon fa fa-file-text-o"></span>&nbsp;&nbsp; 증명 파일 첨부</h3>
		                   	
		                   	<c:if test="${ empty user.resumefile1 }">
			                   	<p style="margin-top:50px; margin-bottom:50px;" align="center">
			                		업로드한 <b style="color:#00bdd2">파일</b>이 없습니다.
			                		<br><br><a href="resumeUpdate.do"><button class="btn btn-info btn-xs" type="button">첨부파일 등록</button></a>
			                	</p>
		                   	</c:if><c:if test="${ !empty user.resumefile1 }">
		                   		<p align="center">
		                    		<span style="display: block; width:100%;"><a href="${pageContext.request.contextPath}/resources/userFiles/${user.member_id}/${ user.resumefile1 }" download>${ user.resumefile1 }</a></span>
		                    		<c:if test="${ !empty user.resumefile2 }">
		                    			<span style="display: block; width:100%;"><a href="${pageContext.request.contextPath}/resources/userFiles/${user.member_id}/${ user.resumefile2 }" download>${ user.resumefile2 }</a></span>
		                    		</c:if>
		                    		<c:if test="${ !empty user.resumefile3 }">
		                    			<span style="display: block; width:100%;"><a href="${pageContext.request.contextPath}/resources/userFiles/${user.member_id}/${ user.resumefile3 }" download>${ user.resumefile3 }</a></span>
		                    		</c:if>
		                    		<c:if test="${ empty user.resumefile3 }">
		                    			<br><a href="resumeUpdate.do"><button class="btn btn-info btn-xs" type="button">파일추가 등록</button></a>
		                    		</c:if><c:if test="${ !empty user.resumefile3 }">
		                    			<br><a href="resumeUpdate.do"><button class="btn btn-info btn-xs" type="button">첨부파일 관리</button></a>
		                    		</c:if>
		                    	</p>
		                   	</c:if>
						</div>
					</div>
					
					<hr>
					
		        </div><!--right end-->
		    </div><!--container end-->
		</section>
	</section>
	<!--end wrapper-->
	
	<!--start footer-->
	<c:import url="../footer.jsp"/>
	<!--end footer-->

	<!-- CKeditor js -->
	<script src="${pageContext.request.contextPath}/resources/api/CKeditor/ckeditor.js?ver=1"></script>
	<!-- summer note korean language pack -->
	<script src="${pageContext.request.contextPath}/resources/api/CKeditor/lang/ko.js?ver=1"></script>
	<script src="${pageContext.request.contextPath}/resources/api/CKeditor/config.js?ver=1"></script>
	
	<!-- CKeditor script -->
	<script>
	/* var test = '${pageContext.request.contextPath}'; */
	console.log(test);
		CKEDITOR.replace( 'resumeData', {
			customConfig: '${pageContext.request.contextPath}/resources/api/CKeditor/config.js',
			filebrowserImageUploadUrl: 'fileUpload.do',
			height: 400
		} );
	</script>
	
	<!-- modal script -->
	<script type="text/javascript">
    function exView() {
     var text = document.getElementById("resumeData").value;
     document.getElementById("ex").innerHTML = text;
    }
 	</script>
	
<!-- ex-modal -->	
<div class="modal fade" id="ex-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
<!-- 			<div class="modal-header">
				<p class="modal-title" id="myModalLabel" align="center">예제입니다.</p>
			</div> -->
			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal" style="margin : 20">×</button>
				<div id="ex">
			 	</div>
				<script type="text/javascript">
				</script>
			</div>

			<!-- <div class="modal-footer">
			</div> -->

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- Modal End -->

<!-- modal -->	
<div class="modal fade" id="miri-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
<!-- 			<div class="modal-header">
				<p class="modal-title" id="myModalLabel" align="center">예제입니다.</p>
			</div> -->
			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal" style="margin : 20">×</button>
				<div id="ex">
			 	</div>
				<script type="text/javascript">
				</script>
			</div>

			<!-- <div class="modal-footer">
			</div> -->

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- Modal End -->
	
</body>
</html>