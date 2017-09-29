<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	background: url("/dajob/resources/images/page-header4.jpg") no-repeat;
}
.itinfo .it a{
	color: #fdffc6;
}
.itinfo .it a:hover{
	color: #64eac6;
}
.info-content{
	background-color: rgba(0,0,0,0.5);
}
.dragAndDropDiv {
	border: 2px dashed #fffcd6;
	margin: 20px 0 20px 0;
	width: 100%;
	height: 150px;
	color: #fffcd6;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px 10px 10px;
	font-size: 120%;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 250px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}
#filePreview, #filePreview img{
	width : 100%;
	height : auto;
	color: #fffcd6;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px 10px 10px;
	font-size: 120%;
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
					<h2 style="color:#0e1f3d;">IT Info</h2>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav id="breadcrumbs">
						<ul>
							<li style="color:#0e1f3d;">You are here:</li>
							<li style="color:#0e1f3d;"><a href="index.do">Home</a></li>
							<li style="color:#0e1f3d;">IT info Insert</li>
						</ul>
					</nav>
				</div>
			</div>
			<!--./row-->
		</div>
		<!--./Container-->
	</header>
	<!--End Header-->
	<section class="wrapper">
		<!--start itinfo service-->
		<section class="parallax parallax-1">
			<div class="container">
				<!--<h2 class="center">Testimonials</h2>-->
				<div class="row">
					<div id="parallax-testimonial-carousel"
						class="parallax-testimonial carousel">
						<div class="col-md-12">
							<div class="clearfix">
							<div class="dividerHeading">
							<h2 style="color: #e5fff8; line-height: 32pt;">IT Info Insert</h2>
						</div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<form action="itinsert.do" method="post">
								<input type="hidden" id="itinfo_img" name="itinfo_img" value="">
								<input type="text" name="itinfo_title" style="width:100%; height:40px; font-size:15pt;"value="" placeholder="IT info 제목을 입력하세요.">
								<div id="fileUpload" class="dragAndDropDiv">이미지 업로드</div>
								<div id="filePreview" class="preview">이미지 미리보기</div>
								<textarea id="editor" name="itinfo_content"></textarea>
								<br>
								<p align="center"><button class="btn btn-success" type="submit">작성 하기</button>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
								<button class="btn btn-warning" type="button" onclick="javascript:history.back();">작성 취소</button>
								</p>
						</form>
					</div>
					<p align="center">
							<a href="javascript:history.back();"
								class="btn btn-default btn-lg back_home"><i
								class="fa fa-arrow-circle-o-left"></i> Go to Back </a>
						</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</section>
	<!--end wrapper-->
	<c:import url="../footer.jsp" />
	<script src="${pageContext.request.contextPath}/resources/api/CKeditor/ckeditor.js"></script>
	<!-- CKeditor korean language pack -->
	<script src="${pageContext.request.contextPath}/resources/api/CKeditor/lang/ko.js"></script>
	<script>
	$(function(){
		CKEDITOR.config.customConfig = '${pageContext.request.contextPath}/resources/api/CKeditor/config.js';
		CKEDITOR.replace( 'editor', {
			enterMode : 2,
			height: 200
		});
	});
	
	$(function() {
		var objDragAndDrop = $(".dragAndDropDiv");

		$(document).on("dragenter", ".dragAndDropDiv",
				function(e) {
					e.stopPropagation();
					e.preventDefault();
					$(this).css('border', '2px solid #0B85A1');
				});
		$(document).on("dragover", ".dragAndDropDiv",
				function(e) {
					e.stopPropagation();
					e.preventDefault();
				});
		$(document).on("drop", ".dragAndDropDiv", function(e) {

			$(this).css('border', '2px dotted #0B85A1');
			e.preventDefault();
			var files = e.originalEvent.dataTransfer.files;
			
			handleFileUpload(files, objDragAndDrop);
		});

		$(document).on('dragenter', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});
		$(document).on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			objDragAndDrop.css('border', '2px dotted #0B85A1');
		});
		$(document).on('drop', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});

		function handleFileUpload(files, obj) {
			if(files.length < 2){
				for (var i = 0; i < files.length; i++) {
					var fd = new FormData();
					fd.append('file', files[i]);
	
					var status = new createStatusbar(obj); //Using this we can set progress.
					status.setFileNameSize(files[i].name,
							files[i].size);
					sendFileToServer(fd, status);
				}
			} else {
				alert("파일은 하나만 등록이 가능합니다.");
			}
		}

		var rowCount = 0;
		function createStatusbar(obj) {

			rowCount++;
			var row = "odd";
			if (rowCount % 2 == 0)
				row = "even";
			this.statusbar = $("<div class='statusbar "+row+"'></div>");
			this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
			this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
			this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
			this.abort = $("<div class='abort'>중지</div>")
					.appendTo(this.statusbar);

			obj.after(this.statusbar);

			this.setFileNameSize = function(name, size) {
				var sizeStr = "";
				var sizeKB = size / 1024;
				if (parseInt(sizeKB) > 1024) {
					var sizeMB = sizeKB / 1024;
					sizeStr = sizeMB.toFixed(2) + " MB";
				} else {
					sizeStr = sizeKB.toFixed(2) + " KB";
				}

				this.filename.html(name);
				this.size.html(sizeStr);
			}

			this.setProgress = function(progress) {
				var progressBarWidth = progress
						* this.progressBar.width() / 100;
				this.progressBar.find('div').animate({
					width : progressBarWidth
				}, 10).html(progress + "% ");
				if (parseInt(progress) >= 100) {
					this.abort.hide();
				}
			}

			this.setAbort = function(jqxhr) {
				var sb = this.statusbar;
				this.abort.click(function() {
					jqxhr.abort();
					sb.hide();
				});
			}
		}

		function sendFileToServer(formData, status) {
			var uploadURL = "itinfofileUpload.do"; //Upload URL
			var extraData = {}; //Extra Data.
			var jqXHR = 
				$.ajax({
						xhr : function() {
							var xhrobj = $.ajaxSettings.xhr();
							if (xhrobj.upload) {
								xhrobj.upload.addEventListener('progress',function(event) {
													var percent = 0;
													var position = event.loaded || event.position;
													var total = event.total;
													if (event.lengthComputable) {
														percent = Math.ceil(position/ total * 100);
													}
													//Set progress
													status.setProgress(percent);
												}, false);
							}
							return xhrobj;
						},
						url : uploadURL,
						type : "POST",
						contentType : false,
						processData : false,
						cache : false,
						data : formData,
						dataType : "json",
						success : function(data) {
							$("#itinfo_img").val(decodeURIComponent(data.path.replace(/\+/g, " ")));
							$("#filePreview").html("");
							$("#filePreview").html("<img src='"+$("#itinfo_img").val()+"' style='width:100%; height: auto;'>");
							alert($("#itinfo_img").val());
							status.setProgress(100);
							//$("#status1").append("File upload Done<br>");
						}
					});
			status.setAbort(jqXHR);
		}
	});
	</script>
</body>
</html>