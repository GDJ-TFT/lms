<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
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
<style>
table {
	width: 100%;
	text-align: center;
}

td {
	background: white;
}

a {
	width: 100%;
	text-align: center;
	display: table;
}

a:link {
	color: black;
	text-decorration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: #ffcc00;
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
						<div class="col-md-12 grid-margin">
							<div class="row">
								<div class="col-12 col-xl-8 mb-4 mb-xl-0">
									<div class="col-lg-11 grid-margin stretch-card">
										<div class="card">
											<div class="card-body">
												<h4 class="card-title">${lectureName}</h4>
												<c:if test="${level>2}">
													<select id="lectureName"
														onchange="window.open(value,'blank');">
														<option value="">과목 선택</option>
														<c:forEach var="m" items="${lectureNameList}">
															<option
																value="${pageContext.request.contextPath}/loginCheck/getAssignmentExam?lectureName=${m.lectureName}">${m.lectureName}</option>
														</c:forEach>
													</select>
												</c:if>
												<p class="card-description"></p>
												<div class="table-responsive">
													<div class="container">
														<form
															action="${pageContext.request.contextPath}/loginCheck/getAssignmentExam?lectureName=${lectureName}"
															method="post">
															<table class="table table-hover">
																<thead>
																	<tr>
																		<th>과제 이름</th>
																		<th>시작일</th>
																		<th>기한</th>
																	</tr>
																	</theads>
																<tbody>
																	<c:forEach var="m" items="${assignmentExamList}">
																		<tr>
																			<td><a
																				href="${pageContext.request.contextPath}/loginCheck/getAssignmentOne?assignmentExamNo=${m.assignmentExamNo}&lectureName=${lectureName}">${m.assignmentExamTitle}</a></td>
																			<td>${m.createDate}</td>
																			<td>${m.assignmentDeadLine}</td>

																		</tr>
																	</c:forEach>
																</tbody>
															</table>
															<c:if test="${level==2}">
																<button type="submit" class="btn btn-primary ">과제 입력</button>
															</c:if>
														</form>
													</div>

												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="col-12 col-xl-4">
									<div class="justify-content-end d-flex"></div>
								</div>
							</div>
						</div>
					</div>


				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<footer class="footer">
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
						<span
							class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright
							© 2021. Premium <a href="https://www.bootstrapdash.com/"
							target="_blank">Bootstrap admin template</a> from BootstrapDash.
							All rights reserved.
						</span> <span
							class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted
							& made with <i class="ti-heart text-danger ml-1"></i>
						</span>
					</div>
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
						<span
							class="text-muted text-center text-sm-left d-block d-sm-inline-block">Distributed
							by <a href="https://www.themewagon.com/" target="_blank">Themewagon</a>
						</span>
					</div>
				</footer>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

	<!-- container-scroller -->

	<!-- plugins:js -->
	<script
		src="${pageContext.request.contextPath}/vendors/js/vendor.bundle.base.js"></script>
	<script>
		var selectValue = document.getElementById('selectBox').value;
		alert(selectValue);
	</script>
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
	<script
		src="${pageContext.request.contextPath}/js/Chart.roundedBarCharts.js"></script>
	<!-- End custom js for this page-->
</body>

</html>

