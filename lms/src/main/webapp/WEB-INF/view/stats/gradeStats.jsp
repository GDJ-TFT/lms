<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>LMS-TFT</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/feather/feather.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/tftace.jpg" />
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
</style>

</head>

<body>
	<div class="container-scroller">
  <!-- partial:partials/_navbar.html -->
    <jsp:include page="/inc/topbar.jsp"/>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
      
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <jsp:include page="/inc/sidebar.jsp"/>
      </nav>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="chartjs-size-monitor">
										<div class="chartjs-size-monitor-expand">
											<div class=""></div>
										</div>
										<div class="chartjs-size-monitor-shrink">
											<div class=""></div>
										</div>
									</div>
									<h4 class="card-title">Grade Average</h4>
									<canvas id="barChart"
										style="display: block; width: 642px; height: 321px;"
										width="642" height="321" class="chartjs-render-monitor"></canvas>
								</div>
							</div>
						</div>
					</div>



					<!-- content-wrapper ends -->
					<!-- partial:${pageContext.request.contextPath}/partials/_footer.html -->
					<!-- partial -->
				</div>
				<!-- main-panel ends -->
			</div>
			<!-- page-body-wrapper ends -->
		</div>
		<!-- container-scroller -->
		<!-- plugins:js -->
		<script
			src="${pageContext.request.contextPath}/vendors/js/vendor.bundle.base.js"></script>
		<!-- endinject -->
		<!-- Plugin js for this page -->
		<script
			src="${pageContext.request.contextPath}/vendors/chart.js/Chart.min.js"></script>
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
		<!-- End custom js for this page-->
		<script>
			var arr;
			$.ajax({
				type : 'get'
				,url : '/lms/addAvgScore'
				,success : function(jsonData) {
						let a = [];
						let b = [];
						arr=jsonData;
						console.log(arr);
						for(j=0;j<jsonData.length;j++) {
							a.push(arr[j].className);
							b.push(arr[j].avg);
						}
			var data = {
					labels : a,
					datasets : [ {
						label : "grade",
						data : b,
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1,
						fill : false
					} ]
				}
						var multiLineData = {
								labels : [ "Red", "Blue", "Yellow", "Green", "Purple", "Orange" ],
								datasets : [ {
									label : 'Dataset 1',
									data : [ 10, 19, 3, 5, 2, 3 ],
									borderColor : [ '#587ce4' ],
									borderWidth : 2,
									fill : false
								}, {
									label : 'Dataset 2',
									data : [ 5, 23, 7, 12, 42, 23 ],
									borderColor : [ '#ede190' ],
									borderWidth : 2,
									fill : false
								}, {
									label : 'Dataset 3',
									data : [ 15, 10, 21, 32, 12, 33 ],
									borderColor : [ '#f44252' ],
									borderWidth : 2,
									fill : false
								} ]
							};
							var options = {
								scales : {
									yAxes : [ {
										ticks : {
											beginAtZero : true
										}
									} ]
								},
								legend : {
									display : false
								},
								elements : {
									point : {
										radius : 0
									}
								}

							};
							var doughnutPieData = {
								datasets : [ {
									data : [ 30, 40, 30 ],
									backgroundColor : [ 'rgba(255, 99, 132, 0.5)',
											'rgba(54, 162, 235, 0.5)',
											'rgba(255, 206, 86, 0.5)',
											'rgba(75, 192, 192, 0.5)',
											'rgba(153, 102, 255, 0.5)',
											'rgba(255, 159, 64, 0.5)' ],
									borderColor : [ 'rgba(255,99,132,1)',
											'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
											'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
											'rgba(255, 159, 64, 1)' ],
								} ],

								// These labels appear in the legend and in the tooltips when hovering different arcs
								labels : [ 'Pink', 'Blue', 'Yellow', ]
							};
							var doughnutPieOptions = {
								responsive : true,
								animation : {
									animateScale : true,
									animateRotate : true
								}
							};
							var areaData = {
								labels : [ "2013", "2014", "2015", "2016", "2017" ],
								datasets : [ {
									label : '# of Votes',
									data : [ 12, 19, 3, 5, 2, 3 ],
									backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(255, 206, 86, 0.2)',
											'rgba(75, 192, 192, 0.2)',
											'rgba(153, 102, 255, 0.2)',
											'rgba(255, 159, 64, 0.2)' ],
									borderColor : [ 'rgba(255,99,132,1)',
											'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
											'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
											'rgba(255, 159, 64, 1)' ],
									borderWidth : 1,
									fill : true, // 3: no fill
								} ]
							};

							var areaOptions = {
								plugins : {
									filler : {
										propagate : true
									}
								}
							}

							var multiAreaData = {
								labels : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
										"Aug", "Sep", "Oct", "Nov", "Dec" ],
								datasets : [ {
									label : 'Facebook',
									data : [ 8, 11, 13, 15, 12, 13, 16, 15, 13, 19, 11, 14 ],
									borderColor : [ 'rgba(255, 99, 132, 0.5)' ],
									backgroundColor : [ 'rgba(255, 99, 132, 0.5)' ],
									borderWidth : 1,
									fill : true
								}, {
									label : 'Twitter',
									data : [ 7, 17, 12, 16, 14, 18, 16, 12, 15, 11, 13, 9 ],
									borderColor : [ 'rgba(54, 162, 235, 0.5)' ],
									backgroundColor : [ 'rgba(54, 162, 235, 0.5)' ],
									borderWidth : 1,
									fill : true
								}, {
									label : 'Linkedin',
									data : [ 6, 14, 16, 20, 12, 18, 15, 12, 17, 19, 15, 11 ],
									borderColor : [ 'rgba(255, 206, 86, 0.5)' ],
									backgroundColor : [ 'rgba(255, 206, 86, 0.5)' ],
									borderWidth : 1,
									fill : true
								} ]
							};

							var multiAreaOptions = {
								plugins : {
									filler : {
										propagate : true
									}
								},
								elements : {
									point : {
										radius : 0
									}
								},
								scales : {
									xAxes : [ {
										gridLines : {
											display : false
										}
									} ],
									yAxes : [ {
										gridLines : {
											display : false
										}
									} ]
								}
							}

							var scatterChartData = {
								datasets : [ {
									label : 'First Dataset',
									data : [ {
										x : -10,
										y : 0
									}, {
										x : 0,
										y : 3
									}, {
										x : -25,
										y : 5
									}, {
										x : 40,
										y : 5
									} ],
									backgroundColor : [ 'rgba(255, 99, 132, 0.2)' ],
									borderColor : [ 'rgba(255,99,132,1)' ],
									borderWidth : 1
								}, {
									label : 'Second Dataset',
									data : [ {
										x : 10,
										y : 5
									}, {
										x : 20,
										y : -30
									}, {
										x : -25,
										y : 15
									}, {
										x : -10,
										y : 5
									} ],
									backgroundColor : [ 'rgba(54, 162, 235, 0.2)', ],
									borderColor : [ 'rgba(54, 162, 235, 1)', ],
									borderWidth : 1
								} ]
							
							}

							var scatterChartOptions = {
								scales : {
									xAxes : [ {
										type : 'linear',
										position : 'bottom'
									} ]
								}
							}

							// Get context with jQuery - using jQuery's .get() method.
							if ($("#barChart").length) {
								var barChartCanvas = $("#barChart").get(0).getContext("2d");
								// This will get the first returned node in the jQuery collection.
								var barChart = new Chart(barChartCanvas, {
									type : 'bar',
									data : data,
									options : options
								});
							}
							
							if ($("#lineChart").length) {
								var lineChartCanvas = $("#lineChart").get(0).getContext("2d");
								var lineChart = new Chart(lineChartCanvas, {
									type : 'line',
									data : data,
									options : options
								});
							}

							if ($("#linechart-multi").length) {
								var multiLineCanvas = $("#linechart-multi").get(0).getContext(
										"2d");
								var lineChart = new Chart(multiLineCanvas, {
									type : 'line',
									data : multiLineData,
									options : options
								});
							}

							if ($("#areachart-multi").length) {
								var multiAreaCanvas = $("#areachart-multi").get(0).getContext(
										"2d");
								var multiAreaChart = new Chart(multiAreaCanvas, {
									type : 'line',
									data : multiAreaData,
									options : multiAreaOptions
								});
							}

							if ($("#doughnutChart").length) {
								var doughnutChartCanvas = $("#doughnutChart").get(0)
										.getContext("2d");
								var doughnutChart = new Chart(doughnutChartCanvas, {
									type : 'doughnut',
									data : doughnutPieData,
									options : doughnutPieOptions
								});
							}

							if ($("#pieChart").length) {
								var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
								var pieChart = new Chart(pieChartCanvas, {
									type : 'pie',
									data : doughnutPieData,
									options : doughnutPieOptions
								});
							}

							if ($("#areaChart").length) {
								var areaChartCanvas = $("#areaChart").get(0).getContext("2d");
								var areaChart = new Chart(areaChartCanvas, {
									type : 'line',
									data : areaData,
									options : areaOptions
								});
							}

							if ($("#scatterChart").length) {
								var scatterChartCanvas = $("#scatterChart").get(0).getContext(
										"2d");
								var scatterChart = new Chart(scatterChartCanvas, {
									type : 'scatter',
									data : scatterChartData,
									options : scatterChartOptions
								});
							}

							if ($("#browserTrafficChart").length) {
								var doughnutChartCanvas = $("#browserTrafficChart").get(0)
										.getContext("2d");
								var doughnutChart = new Chart(doughnutChartCanvas, {
									type : 'doughnut',
									data : browserTrafficData,
									options : doughnutPieOptions
								});
							}
				}
			});

			/* ChartJS
			 * -------
			 * Data and config for chartjs
			 */
		</script>
</body>
</html>