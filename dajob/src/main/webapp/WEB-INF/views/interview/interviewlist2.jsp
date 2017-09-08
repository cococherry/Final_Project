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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
                    <h2>구인신청자List</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li>You are here:</li>
                            <li><a href="index.do">Home</a></li>
                            <li>Contact Us</li>
                        </ul>
                    </nav>
                </div>
            </div> <!--./row-->
        </div> <!--./Container-->
    </header>
	
	<div class="container">
	<div class="row"> 
		<section class="content" style="width:100%"> 
				<div class="panel panel-default" >
					<div class="panel-body">
					<form action="">
                                <div align="right">                     
                                <select class="custom-select">
                                  <option selected>주거지</option>
                                    <option value="1">서울특별시</option>
                                    <option value="1">경기도</option>
                                    <option value="1">인천광역시</option>
                                    <option value="1">강원도</option>
                                    <option value="1">충청북도</option>
                                    <option value="1">충청남도</option>
                                    <option value="1">대전광역시</option>
                                    <option value="1">경상북도</option>
                                    <option value="1">대구광역시</option>
                                    <option value="1">울산광역시</option>
                                    <option value="1">경상남도</option>
                                    <option value="1">부산광역시</option>                                     
                                    <option value="1">전라북도</option>
                                    <option value="1">전라남도</option>
                                    <option value="1">광주광역시</option>                            
                                </select>
                                    
							</div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-6">
                            기술
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-6">
                            자격증
                        </div>
                    </div>
                    <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-3">
                    <div class="checkbox checkbox-primary">
                        <input id="checkbox1" type="checkbox">
                        <label for="checkbox1">
                            JAVA
                        </label>
                    </div>
                    <div class="checkbox checkbox-success">
                        <input id="checkbox2" type="checkbox">
                        <label for="checkbox2">
                           ORACLE
                        </label>
                    </div>
                    <div class="checkbox checkbox-info">
                        <input id="checkbox3" type="checkbox">
                        <label for="checkbox3">
                            Info
                        </label>
                    </div>
                    <div class="checkbox checkbox-warning">
                        <input id="checkbox4" type="checkbox">
                        <label for="checkbox4">
                            Warning
                        </label>
                    </div>
                    <div class="checkbox checkbox-danger">
                        <input id="checkbox5" type="checkbox">
                        <label for="checkbox5">
                            Check
                        </label>
                    </div>
                </div>
                    <div class="col-lg-3 col-md-3 col-sm-3" >
                    <div class="checkbox checkbox-primary">
                        <input id="checkbox6" type="checkbox" >
                        <label for="checkbox6">
                            JAVA
                        </label>
                    </div>
                    <div class="checkbox checkbox-success">
                        <input id="checkbox7" type="checkbox">
                        <label for="checkbox7">
                           ORACLE
                        </label>
                    </div>
                    <div class="checkbox checkbox-info">
                        <input id="checkbox8" type="checkbox">
                        <label for="checkbox8">
                            Info
                        </label>
                    </div>
                    <div class="checkbox checkbox-warning">
                        <input id="checkbox10" type="checkbox">
                        <label for="checkbox10">
                            Warning
                        </label>
                    </div>
                    <div class="checkbox checkbox-danger">
                        <input id="checkbox11" type="checkbox">
                        <label for="checkbox11">
                            Check
                        </label>
                    </div>
                 </div> 
                 
                        
                 <div class="col-lg-3 col-md-3 col-sm-3" >
                    <div class="checkbox checkbox-primary">
                        <input id="checkbox12" type="checkbox" >
                        <label for="checkbox12">
                            정보처리기사
                        </label>
                    </div>
                    <div class="checkbox checkbox-success">
                        <input id="checkbox13" type="checkbox">
                        <label for="checkbox13">
                           ORACLE
                        </label>
                    </div>
                    <div class="checkbox checkbox-info">
                        <input id="checkbox14" type="checkbox">
                        <label for="checkbox14">
                            Info
                        </label>
                    </div>
                    <div class="checkbox checkbox-warning">
                        <input id="checkbox15" type="checkbox">
                        <label for="checkbox15">
                            Warning
                        </label>
                    </div>
                    <div class="checkbox checkbox-danger">
                        <input id="checkbox16" type="checkbox">
                        <label for="checkbox16">
                            Check
                        </label>
                    </div>
                 </div> 
                 <div class="col-lg-3 col-md-3 col-sm-3" >
                    <div class="checkbox checkbox-primary">
                        <input id="checkbox17" type="checkbox" >
                        <label for="checkbox17">
                            JAVA
                        </label>
                    </div>
                    <div class="checkbox checkbox-success">
                        <input id="checkbox18" type="checkbox">
                        <label for="checkbox18">
                           ORACLE
                        </label>
                    </div>
                    <div class="checkbox checkbox-info">
                        <input id="checkbox19" type="checkbox">
                        <label for="checkbox19">
                            Info
                        </label>
                    </div>
                    <div class="checkbox checkbox-warning">
                        <input id="checkbox20" type="checkbox">
                        <label for="checkbox20">
                            Warning
                        </label>
                    </div>
                    <div class="checkbox checkbox-danger">
                        <input id="checkbox21" type="checkbox">
                        <label for="checkbox21">
                            Check
                        </label>
                    </div>
                 </div> 
                
            </div>
                       <input type="submit" value="검색" align="right">
                  </form>    
						<div class="table-container" style="padding-top: 50px">
							<table class="table" >
								<tbody>
									<tr data-status="pagado">
										<td>
											<div class="ckbox">
												<input type="checkbox" id="checkbox">
												<label for="checkbox"></label>
											</div>
										</td>
										<td>
											<a href="javascript:;" class="star">
												<i class="glyphicon glyphicon-star"></i>
											</a>
										</td>
										<td>
											<div class="media">
												<a href="jobofferdetail.do" class="pull-left">
													<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
												</a>
												<div class="media-body">
													<span class="media-meta pull-right">July 1, 2017</span>
													<h4 class="title">
														나상민
														<span class="pagado">(27)</span>
													</h4>
													<p class="summary">서울특별시 JAVA 정보처리기사</p>
												</div>
                                                
											</div>
										</td>
										<td>
										<span>
                                                <button type="button" class="btn btn-default btn-filter" data-target="pendiente">자세히보기</button><br>
                                                <button type="button" class="btn btn-danger btn-filter" data-target="cancelado">삭제</button>
                                                </span>
										</td>
									</tr>
									<tr data-status="pagado">
										<td>
											<div class="ckbox">
												<input type="checkbox" id="checkbox">
												<label for="checkbox"></label>
											</div>
										</td>
										<td>
											<a href="javascript:;" class="star">
												<i class="glyphicon glyphicon-star"></i>
											</a>
										</td>
										<td>
											<div class="media">
												<a href="jobofferdetail.do" class="pull-left">
													<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
												</a>
												<div class="media-body">
													<span class="media-meta pull-right">July 1, 2017</span>
													<h4 class="title">
														나상민2
														<span class="pagado">(27)</span>
													</h4>
													<p class="summary">인천광역시 JAVA ORACLE</p>
												</div>
                                                
											</div>
										</td>
										<td>
										<span>
                                                <button type="button" class="btn btn-default btn-filter" data-target="pendiente">자세히보기</button><br>
                                                <button type="button" class="btn btn-danger btn-filter" data-target="cancelado">삭제</button>
                                                </span>
										</td>
									</tr>
									
								</tbody>
							</table>
							<nav aria-label="Page navigation" align="center">
							  <ul class="pagination">
							    <li>
							      <a href="#" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
							    <li><a href="#">1</a></li>
							    <li>
							      <a href="#" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
							  </ul>
							</nav>
						</div>
						
					</div>
					
			</div>
		</section>
		
	</div>
</div>

	
	<!--start footer-->
	<c:import url="../footer.jsp"/>
	<!--end footer-->


</body>
</html>