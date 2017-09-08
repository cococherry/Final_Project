<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date" %>
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
	background: url("/dajob/resources/images/page-header2.jpg") no-repeat;
}
       #map {
        height: 400px;
        width: 100%;
       }
       .promo_box .pb_action a.btn{
       float: none;
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
                    <h2>PowerLink Offer</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li>You are here:</li>
                            <li><a href="index.do">Home</a></li>
                            <li>PowerLink Offer</li>
                        </ul>
                    </nav>
                </div>
            </div> <!--./row-->
        </div> <!--./Container-->
        </header>
        
        <section class="wrapper">
		<section class="content typography">
			<div class="container">
				<div class="row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="dividerHeading">
							<h4><span>결제하기</span></h4>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate value="${today}" type="DATE" pattern="yyyy-MM-dd" var="todate"/>
<c:set var="tomorrow" value="<%= new Date(new Date().getTime() + 5*(60*60*24*1000)) %>"/>
<fmt:formatDate value="${tomorrow}" type="DATE" pattern="yyyy-MM-dd" var="tomdate"/>					
						<h2 align="center">결제내용</h2>
						<p align="center" style="line-height: 20pt;">
							 ${todate} 부터 ${tomdate} 까지 신청합니다.<br>
                     	 	결제 금액은 60만원 입니다.
                     	 	<br>
                     	 	<button onclick="pay()" style="border: 0; outline: 0; background-color: white;" >
                     	 		<a class="btn btn-small btn-default">결제하기</a>
                     	 	</button>
						</p>
					</div>
				</div>
			</div>
		</section>
		</section>
     
        <c:import url="../footer.jsp"/>
        
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
        <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
        <script type="text/javascript">
        $(function(){
        	var IMP = window.IMP; // 생략가능
        	IMP.init('imp99940489'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        });
        function pay(){
        IMP.request_pay({
            pg : 'uplus', // version 1.1.0부터 지원.
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '주문명 : Power Loink 등록',
            amount : 600000,
            buyer_email : 'iamport@siot.do',
            buyer_name : '<c:out value="${member.member_name}"/>',
            buyer_tel : '<c:out value="${member.member_phone}" />',
            buyer_addr : '<c:out value="${member.member_address}" />',
            buyer_postcode : '123-456',
            m_redirect_url : 'https://www.yourdomain.com/payments/complete'
        }, function(rsp) {
            if ( rsp.success ) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
        };
        </script>
</body>
</html>