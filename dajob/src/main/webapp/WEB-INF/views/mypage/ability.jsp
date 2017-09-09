<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>DA JOB : find Direct your job</title>
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

</head>
<body>
	<!--Start Header-->
	<header>
		<c:import url="../header.jsp"/>
        <div class="container page_head">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <h2>내 능력 분석</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li>You are here:</li>
                            <li><a href="index.html">Home</a></li>
                            <li><a href="index.html">Mypage</a></li>
                            <li>My ability</li>
                        </ul>
                    </nav>
                </div>
            </div> <!--./row-->
        </div> <!--./Container-->
    </header>
	<!--End Header-->
	
	<!--start wrapper-->
	<section class="wrapper">
		<section class="content about">
			<div class="container">
			
			
				<div class="row sub_content">
					<div class="who">
<!-- 					<div class="col-lg-8 col-md-8 col-sm-8">
							<div class="dividerHeading">
								<h4><span>Who we are?</span></h4>
							</div>
								<img class="left_img img-thumbnail" src="images/about_1.png" alt="about img">
                            <p>Veos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum. </p>
							<p>Donec rutrum erat non arcu gravida porttitor. Nunc et magna nisi. Lore aliquam at erat in lorem purus aliquet mollis. Fusce elementum velit vel dolor iaculis egestas. Maecenas ut nulla quis eros scelerisque posuere vel vitae nibh eros scelerisque. </p>
							<p>Fusce lacinia tempor malesuada. Ut lacus sapien, placerat a ornare nec, elementum sit amet felis. Maecenas pretium lorem hendrerit eros sagittis fermentum. Donec in ut odio libero, at vulputate urna. Nulla tristique mi a massa convallis cursus. Nulla eu mi magna. Etiam suscipit commodo ad gravida. Cras suscipit, quam vitae adipiscing faucibus, risus nibh laoreet odio, a porttitor metus.</p>
							
						</div> -->
						
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="dividerHeading">
								<h4><span>보유 자격증 개수 : ○개</span></h4>
							</div>
							<p>자신이 사용가능한 기술에 대한 지표를 나타내주는 그래프입니다. 이를 통해 자신의 능력을 확인하세요! </p>
							<ul class="progress-skill-bar">
								<li>
									<span class="lable">1개</span>
									<div class="progress_skill">
										<div class="bar" data-value="10" role="progressbar" data-height="100">
											HTML
										</div>
									</div>
								</li>
								<li>
									<span class="lable">2개</span>
									<div class="progress_skill">
										<div class="bar" data-value="20" role="progressbar" data-height="100">
											CSS
										</div>
									</div>
								</li>
								<li>
									<span class="lable">3개</span>
									<div class="progress_skill">
										<div class="bar" data-value="30" role="progressbar" data-height="100">
											JavaScript
										</div>
									</div>
								</li>
								<li>
									<span class="lable">5개</span>
									<div class="progress_skill">
										<div class="bar" data-value="50" role="progressbar" data-height="100">
											MySQL
										</div>
									</div>
								</li>
								<li>
									<span class="lable">4개</span>
									<div class="progress_skill">
										<div class="bar" data-value="40" role="progressbar" data-height="100">
											PHP
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				

                <div class="row sub_content">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="promo_box">
                            <div class="col-sm-9">
                                <div class="promo_content">
                                    <h3>취득 자격증 기준 ○○○님의 전문 능력은 ○○○입니다.</h3>
                                    <p>자신의 능력 분석을 통해, 지금 바로 이력서를 작성해 보세요!</p>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="pb_action">
                                    <a href="#fakelink" class="btn btn-default btn-lg">
                                        <i class="fa fa-pencil-square-o"></i>
                                        	이력서 작성
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row  sub_content">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="dividerHeading">
                            <h4><span>관련 자격증 추천</span></h4>
                            <!-- <p>능력분석을 통해 자신에게 필요한 자격증을 추천합니다.</p> -->
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6">
                        <div class="team_prof">
                            <h3 class="names">정보처리기사<small>관련직업명</small></h3>
                            <p class="description">정보처리기사는 컴퓨터 언어를 이용해 프로그램을 제작할 뿐만 아니라 컴퓨터 조직을 효과적으로 이용하기 위해 업무를 분석·설계하고 자료처리나 계산 순서를 작성·운용하는 일을 한다.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6">
                        <div class="team_prof">
                            <h3 class="names">정보처리기사<small>관련직업명</small></h3>
                            <p class="description">정보처리기사는 컴퓨터 언어를 이용해 프로그램을 제작할 뿐만 아니라 컴퓨터 조직을 효과적으로 이용하기 위해 업무를 분석·설계하고 자료처리나 계산 순서를 작성·운용하는 일을 한다.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6">
                        <div class="team_prof">
                            <h3 class="names">SQLD<small>관련직업명</small></h3>
                            <p class="description">SQL은 데이터베이스를 직접적으로 액세스할 수 있는 언어로, 데이터를 정의하고, 조작하며, 조작한 결과를 적용하거나 취소할 수 있고, 접근권한을 제어하는 처리들로 구성된다.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6">
                        <div class="team_prof">
                            <h3 class="names">SQLD<small>관련직업명</small></h3>
                            <p class="description">SQL은 데이터베이스를 직접적으로 액세스할 수 있는 언어로, 데이터를 정의하고, 조작하며, 조작한 결과를 적용하거나 취소할 수 있고, 접근권한을 제어하는 처리들로 구성된다.</p>
                        </div>
                    </div>
                </div>
                
                <div class="row sub_content">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="dividerHeading">
                            <h4><span>연봉 측정</span></h4>
                            <p>능력분석을통해서 자신과 비슷한 사람의 연봉을 비교해보세요!</p><br>
                        </div>
                        <div class="progress">
						  <div class="progress-bar progress-bar-success progress-bar-striped active" style="width: 25%">
						  	하위연봉
						    <span class="sr-only">35% Complete (success)</span>
						  </div>
						  <div class="progress-bar progress-bar-warning progress-bar-striped active" style="width: 50%">
						  	평균연봉
						    <span class="sr-only">20% Complete (warning)</span>
						  </div>
						  <div class="progress-bar progress-bar-danger progress-bar-striped active" style="width: 25%">
						  	상위연봉
						    <span class="sr-only">10% Complete (danger)</span>
						  </div>
						</div>
						<div class="col-lg-4 col-sm-4">
	                        <div class="alert alert-success alert-dismissable">
		                        <center><strong>하위연봉</strong> 2400이하</center>
		                    </div>
	                    </div>
						<div class="col-lg-4 col-sm-4">
		                    <div class="alert alert-warning alert-dismissable">
		                        <center><strong>평균연봉</strong> 2400~2800</center>
		                    </div>
	                    </div>
						<div class="col-lg-4 col-sm-4">
		                    <div class="alert alert-danger alert-dismissable">
		                        <center><strong>상위연봉 </strong> 2800이상</center>
		                    </div>
	                    </div>
	                    <div class="col-lg-4 col-sm-4">
	                    	<div class="pb_action">
                                    <a href="#fakelink" class="btn btn-default btn-lg">
                                        <i class="fa fa-pencil-square-o"></i>
                                        	현재내위치
                                    </a>
                             </div>
	                    </div>
	                    <div class="col-lg-4 col-sm-4"><h2 style="text-align:center; margin:0; padding:0">현재 내위치</h2><i class="fa fa-pencil-square-o"></i></div>
	                    <div class="col-lg-4 col-sm-4"></div>
                   	</div>
                </div> <!--./row-->  
			</div>
		</section>
	</section>
	<!--end wrapper-->

	<!--start footer-->
	<c:import url="../footer.jsp"/>
	<!--end footer-->
	
</body>
</html>