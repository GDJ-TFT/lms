<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LMS-TFT</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/feather/feather.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/tftace.jpg" />
<style type="text/css">/* Chart.js */
	@
	keyframes chartjs-render-animation {
		from {opacity: .99
	}
	
	to {
		opacity: 1
	}
	
	}
	.chartjs-render-monitor {
		animation: chartjs-render-animation 1ms
	}
	
	.chartjs-size-monitor, .chartjs-size-monitor-expand,
		.chartjs-size-monitor-shrink {
		position: absolute;
		direction: ltr;
		left: 0;
		top: 0;
		right: 0;
		bottom: 0;
		overflow: hidden;
		pointer-events: none;
		visibility: hidden;
		z-index: -1
	}
	
	.chartjs-size-monitor-expand>div {
		position: absolute;
		width: 1000000px;
		height: 1000000px;
		left: 0;
		top: 0
	}
	
	.chartjs-size-monitor-shrink>div {
		position: absolute;
		width: 200%;
		height: 200%;
		left: 0;
		top: 0
	}
	
	.title {
		position: relative;
		top: 65px;
		left: 65px;
	}
	
	.content {
		position: relative;
		top: 20px;
	}
</style>

</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<jsp:include page="/inc/topbar.jsp" />
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.html -->

			<!-- partial -->
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<jsp:include page="/inc/sidebar.jsp" />
			</nav>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-md-5 grid-margin stretch-card">
							<div class="card tale-bg">
								<h1 class="title">LMS-TFT</h1>
								<div class="card-people mt-auto">
									<img
										src="${pageContext.request.contextPath}/images/dashboard/people.svg"
										alt="people">
									<div class="weather-info">
										<div class="content d-flex">
											<div>
												<h4>${year}???${month}??? ${day}??? ${dayOfWeek}</h4>
												<br>
												<div style="display: flex;">
													<h2 class="mb-0 font-weight-normal">
														<span id="weather"></span><span id="tmp"></span><sup>??C</sup>
													</h2>
													<div style="display: block;">
														<h4 class="location font-weight-normal float-right">?????????</h4>
														<br>
														<h4 class="font-weight-normal float-right">?????????</h4>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-5 grid-margin">
							<div class="card">
								<div class="card-body">
								
									<select id="lectureName" class="custom-select">
										<option value="" selected="selected">?????? ??????</option>
										<c:forEach var="m" items="${lectureList}">
											<option value="${m.lectureName}">${m.lectureName}</option>
										</c:forEach>
									</select>
									<div id="myChart" width="100%"></div>
									
								</div>

							</div>
						</div>


						<div class="col-lg-11 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">????????? ??????</h4>
									<div id="addJobListDivOne" class="row"></div>
								</div>

							</div>
							<div style="text-align: center;">
								<button id="reducePage" class="btn btn-outline-dark btn-fw">??????</button>
								<button id="addPage" class="btn btn-outline-dark btn-fw">??????</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- content-wrapper ends -->
		<!-- partial:partials/_footer.html -->
		<jsp:include page="/inc/footer.jsp" />
		<!-- partial -->
	</div>
	<!-- main-panel ends -->
	</div>
	</div>
	</div>
	<!-- plugins:js -->
	<script
		src="${pageContext.request.contextPath}/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script
		src="${pageContext.request.contextPath}/vendors/chart.js/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/datatables.net/jquery.dataTables.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/dataTables.select.min.js"></script>

	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="${pageContext.request.contextPath}/js/off-canvas.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/hoverable-collapse.js"></script>
	<script src="${pageContext.request.contextPath}/js/template.js"></script>
	<script src="${pageContext.request.contextPath}/js/settings.js"></script>
	<script src="${pageContext.request.contextPath}/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="${pageContext.request.contextPath}/js/dashboard.js"></script>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/Chart.roundedBarCharts.js"></script>
	<!-- End custom js for this page-->
	<script type="text/javascript">
		$
				.ajax({
					url : '/lms/weather',
					type : 'get',
					timeout : 30000,
					contentType : 'application/json',
					dataType : 'json',
					success : function(data, status, xhr) {
						let dataHeader = data.result.response.header.resultCode;
						if (dataHeader == '00') {
							console.log('success ==>');
							console.log(data);
							let arr = data.result.response.body.items.item;

							if (arr[7].fcstValue >= 80) { // ????????? 80??? ????????? ???
								if (arr[6].fcstValue == 0) { // ?????? ?????? ???
									if (arr[5].fcstValue == 1) { // ?????? ????????? ???
										$('#weather')
												.append(
														'<i class="icon-sun mr-2" width="20"></i>');
									} else { // ?????? ????????? ???
										$('#weather')
												.append(
														'<i class="icon-cloud mr-2" width="20"></i>');
									}
								} else if (arr[6].fcstValue == 1) { // ??? ????????? ???
									$('#weather')
											.append(
													'<i class="icon-umbrella mr-2" width="20"></i>');
								} else if (arr[6].fsctValue == 2
										|| arr[6].fsctValue == 3) { // ???/??? or ???/??? ????????? ???
									if (arr[0].fcstValue < -5) { // ????????? -5??? ????????? ???
										$('#weather')
												.append(
														'<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-snow" viewBox="0 0 16 16"><path d="M8 16a.5.5 0 0 1-.5-.5v-1.293l-.646.647a.5.5 0 0 1-.707-.708L7.5 12.793V8.866l-3.4 1.963-.496 1.85a.5.5 0 1 1-.966-.26l.237-.882-1.12.646a.5.5 0 0 1-.5-.866l1.12-.646-.884-.237a.5.5 0 1 1 .26-.966l1.848.495L7 8 3.6 6.037l-1.85.495a.5.5 0 0 1-.258-.966l.883-.237-1.12-.646a.5.5 0 1 1 .5-.866l1.12.646-.237-.883a.5.5 0 1 1 .966-.258l.495 1.849L7.5 7.134V3.207L6.147 1.854a.5.5 0 1 1 .707-.708l.646.647V.5a.5.5 0 1 1 1 0v1.293l.647-.647a.5.5 0 1 1 .707.708L8.5 3.207v3.927l3.4-1.963.496-1.85a.5.5 0 1 1 .966.26l-.236.882 1.12-.646a.5.5 0 0 1 .5.866l-1.12.646.883.237a.5.5 0 1 1-.26.966l-1.848-.495L9 8l3.4 1.963 1.849-.495a.5.5 0 0 1 .259.966l-.883.237 1.12.646a.5.5 0 0 1-.5.866l-1.12-.646.236.883a.5.5 0 1 1-.966.258l-.495-1.849-3.4-1.963v3.927l1.353 1.353a.5.5 0 0 1-.707.708l-.647-.647V15.5a.5.5 0 0 1-.5.5z"/></svg>');
									} else { // ????????? -5??? ????????? ???
										$('#weather')
												.append(
														'<i class="icon-umbrella mr-2" width="20"></i>');
									}
								} else { // ??? ????????????
									$('#weather')
											.append(
													'<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-snow" viewBox="0 0 16 16"><path d="M8 16a.5.5 0 0 1-.5-.5v-1.293l-.646.647a.5.5 0 0 1-.707-.708L7.5 12.793V8.866l-3.4 1.963-.496 1.85a.5.5 0 1 1-.966-.26l.237-.882-1.12.646a.5.5 0 0 1-.5-.866l1.12-.646-.884-.237a.5.5 0 1 1 .26-.966l1.848.495L7 8 3.6 6.037l-1.85.495a.5.5 0 0 1-.258-.966l.883-.237-1.12-.646a.5.5 0 1 1 .5-.866l1.12.646-.237-.883a.5.5 0 1 1 .966-.258l.495 1.849L7.5 7.134V3.207L6.147 1.854a.5.5 0 1 1 .707-.708l.646.647V.5a.5.5 0 1 1 1 0v1.293l.647-.647a.5.5 0 1 1 .707.708L8.5 3.207v3.927l3.4-1.963.496-1.85a.5.5 0 1 1 .966.26l-.236.882 1.12-.646a.5.5 0 0 1 .5.866l-1.12.646.883.237a.5.5 0 1 1-.26.966l-1.848-.495L9 8l3.4 1.963 1.849-.495a.5.5 0 0 1 .259.966l-.883.237 1.12.646a.5.5 0 0 1-.5.866l-1.12-.646.236.883a.5.5 0 1 1-.966.258l-.495-1.849-3.4-1.963v3.927l1.353 1.353a.5.5 0 0 1-.707.708l-.647-.647V15.5a.5.5 0 0 1-.5.5z"/></svg>');
								}
							} else { // ????????? 80??? ????????? ???
								if (arr[5].fcstValue == 1) { // ?????? ????????? ???
									$('#weather')
											.append(
													'<i class="icon-sun mr-2" width="20"></i>');
								} else { // ?????? ????????? ???
									$('#weather')
											.append(
													'<i class="icon-cloud mr-2" width="20"></i>');
								}
							}

							for (let i = 0; i < arr.length; i++) {
								if (arr[i].category == 'TMP') {
									$('#tmp').append(arr[i].fcstValue);
								}
							}
						} else {
							console.log('fail ==>');
							console.log(data);
						}
					},
					error : function(e, status, xhr, data) {
						console.log('error ==>');
						console.log(e);
					}
				});
		$('#addJobListDivOne').ready(function() {

			//xhr.send('')
		});
		$(function() {
			var xhr = new XMLHttpRequest();
			var url = '${pageContext.request.contextPath}'; /*URL*/
			xhr.open('GET', url); //????????? ??????????????? ???????????? ???????????????
			xhr.onreadystatechange = function() {
				if (this.readyState == xhr.DONE) { // <== ??????????????? ??????????????????
					if (xhr.status == 200 || xhr.status == 201) { // <== ?????? ????????? ???????????????
						alert('Status: ' + this.status + '\nHeaders: '
								+ JSON.stringify(this.getAllResponseHeaders())
								+ '\nBody: ' + this.responseText);
					}
				}
			}
			//????????? ????????? 
			$
					.ajax({
						type : 'get',
						cache : "false",
						url : '/lms/adRestController',
						data : {
							currentPage : currentPage,
							rowPerPage : rowPerPage
						},
						success : function(a) {
							console.log(typeof (a));
							console.log(a);
							var a2 = JSON.parse(a);
							console.log(a2);
							var arr = a2.GetJobInfo.row;

							console.log(arr);
							totalCount = a2.GetJobInfo.list_total_count;
							console.log(totalCount);
							for (let i = 0; i < arr.length; i++) {

								$('#addJobListDivOne')
										.append(
												"<div class='col-lg-3 text-center' style='border : 1px solid #555555;'>\
 						<button class='btn btn-primary ' type='button'  aria-haspopup='true' aria-expanded='true'>"
														+ arr[i].CMPNY_NM
														+ "</button>\
 						<a class='dropdown-item' href='#'>"
														+ arr[i].BSNS_SUMRY_CN
														+ "</a>\
 						<a class='dropdown-item' href='#'>"
														+ arr[i].HOPE_WAGE
														+ "</a>\
 						<a class='dropdown-item' href='#'>"
														+ arr[i].RCEPT_CLOS_NM
														+ "</a><br>\
 						<a class='dropdown-item' href='#'>"
														+ arr[i].WORK_PARAR_BASS_ADRES_CN
														+ "</a></div>");
							}
							// currentPage 12, rowPerPage12 ??? ??????
							currentPage += 12;
							rowPerPage += 12;
							console.log(currentPage);
							console.log(rowPerPage);
						}
					})
		});

		//????????? ????????? ???????????? ?????? ?????? currentPage 1 ~ rowPerPage 12
		var totalCount;
		var currentPage = 1;
		var rowPerPage = 12;

		console.log(currentPage);
		if (currentPage == 1) {
			$('#reducePage').hide();
		}

		//????????? ?????? ??????
		$('#addPage')
				.click(
						function() {
							$('#addJobListDivOne').empty();
							$
									.ajax({
										type : 'get',
										cache : "false",
										url : '/lms/adRestController',
										data : {
											currentPage : currentPage,
											rowPerPage : rowPerPage
										},
										success : function(a) {
											console.log(typeof (a));
											console.log(a);
											var a2 = JSON.parse(a);
											console.log(a2);
											var arr = a2.GetJobInfo.row;

											console.log(arr);
											totalCount = a2.GetJobInfo.list_total_count;
											console.log(totalCount);
											for (let i = 0; i < arr.length; i++) {

												$('#addJobListDivOne')
														.append(
																"<div class='col-lg-3 text-center' style='border : 1px solid #555555;'>\
								<button class='btn btn-primary ' type='button'  aria-haspopup='true' aria-expanded='true'>"
																		+ arr[i].CMPNY_NM
																		+ "</button>\
								<a class='dropdown-item' href='#'>"
																		+ arr[i].BSNS_SUMRY_CN
																		+ "</a>\
								<a class='dropdown-item' href='#'>"
																		+ arr[i].HOPE_WAGE
																		+ "</a>\
								<a class='dropdown-item' href='#'>"
																		+ arr[i].RCEPT_CLOS_NM
																		+ "</a><br>\
								<a class='dropdown-item' href='#'>"
																		+ arr[i].WORK_PARAR_BASS_ADRES_CN
																		+ "</a></div>");
											}
											//currentPage??? +12=13, rowPerPage12 +12=24
											currentPage += 12;
											rowPerPage += 12;
											console.log(currentPage);
											console.log(rowPerPage);
											if (currentPage != 1) {
												$('#reducePage').show();
											}
										}
									})
						});
		//????????? ?????? ??????
		$('#reducePage')
				.click(
						function() {
							$('#addJobListDivOne').empty();
							$
									.ajax({
										type : 'get',
										cache : "false",
										url : '/lms/adRestController',
										data : {
											currentPage : currentPage,
											rowPerPage : rowPerPage
										},
										success : function(a) {
											console.log(typeof (a));
											console.log(a);
											var a2 = JSON.parse(a);
											console.log(a2);
											var arr = a2.GetJobInfo.row;

											console.log(arr);
											totalCount = a2.GetJobInfo.list_total_count;
											console.log(totalCount);
											for (let i = 0; i < arr.length; i++) {

												$('#addJobListDivOne')
														.append(
																"<div class='col-lg-3 text-center' style='border : 1px solid #555555;'>\
					<button class='btn btn-primary ' type='button'  aria-haspopup='true' aria-expanded='true'>"
																		+ arr[i].CMPNY_NM
																		+ "</button>\
					<a class='dropdown-item' href='#'>"
																		+ arr[i].BSNS_SUMRY_CN
																		+ "</a>\
					<a class='dropdown-item' href='#'>"
																		+ arr[i].HOPE_WAGE
																		+ "</a>\
					<a class='dropdown-item' href='#'>"
																		+ arr[i].RCEPT_CLOS_NM
																		+ "</a><br>\
					<a class='dropdown-item' href='#'>"
																		+ arr[i].WORK_PARAR_BASS_ADRES_CN
																		+ "</a></div>");
											}

											//currentPage??? ??????currentPage1 -12 rowPerPage12 +12=24
											currentPage -= 12;
											rowPerPage -= 12;
											if (currentPage == 1) {
												$('#reducePage').hide();
											}
											console.log(currentPage);
											console.log(rowPerPage);
										}
									})
						});
	</script>

	<script>
		//???????????? ????????? ??????(?????????)??? ??????

		// ???????????? ??????
		$('#lectureName').change(function() {
			var myData =  [['lable','data']];
			var lecture = $(this).val();
			// ???????????? ??????
			$.ajax({
				type : 'get',
				url : '/lms/employment',
				data : {lectureName : lecture},
				success : function(jsonData) {
					for (var i = 0; i < jsonData.length; i++) {
						myData.push([ jsonData[i].lable, jsonData[i].data ])
					}

		console.log(myData);
		
		
		// ????????? ????????? ??????
		
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
		   var data = google.visualization.arrayToDataTable(myData);
			
		      var options = {
		    	        width: 600,
		    	        height: 400,
		    	        legend: { position: 'top', maxLines: 3 },
		    	        bar: { groupWidth: '75%' },
		    	        isStacked: true,
		    	      };
			var chart = new google.visualization.ColumnChart(document.getElementById('myChart'));
			  chart.draw(data, options);
			};

		
		}
		});
		});
	
	</script>
</body>
</html>