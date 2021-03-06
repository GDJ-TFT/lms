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
            <div class="col-md-12 grid-margin">
              <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                  <div><h3>???????????????</h3></div>
                </div>
                <div class="col-12 col-xl-4">
                 <div class="justify-content-end d-flex">
                 </div>
                </div>
              </div>
            </div>
          </div>
          		<div>
	          		<c:if test="${sessionLv > 2}">
	          			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addSubjectModal">????????????</button>
	          		</c:if>
                </div>
                <!-- addSubject modal start -->
				<div class="modal fade" id="addSubjectModal" tabindex="-1" role="dialog" aria-labelledby="addSubjectModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="addSubjectModalLabel">????????????</h5>
				        <button type="button" id= "close" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				       	 <form id="addSubjectForm" method="post" action="${pageContext.request.contextPath}/loginCheck/addSubject">
				       	 <div class="modal-body">
				       	 	<span id="addSubjectHelper" class="helper"></span>
							<div>????????????</div>
							<div> </div>
					       	 <div><input type="text" name="subjectName" id="subjectName"></div>
						 </div>
						 <div class="modal-footer">
							<button id="addSubjectBtn"type="button" class="btn btn-primary">??????</button>
							<button type="button" id="btn"class="btn btn-secondary" data-dismiss="modal">??????</button>
						 </div>
				      </form>
				    </div>
				  </div>
				</div>
				<!-- addSubject modal end -->
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <!-- partial -->
        
          <div class="row">
            <div class="col-lg-10 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">??????</h4>
                  <p class="card-description">
                  </p>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>????????????</th>
                          <th>????????????</th>
                          <th>????????????</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="l" items="${list}">
                      	<tr>
                      		<td>${l.subjectName}</td>
                      		<td>${l.createDate}</td>
                      		<td><a class="btn btn-danger" href="${pageContext.request.contextPath}/loginCheck/removeSubject?subjectName=${l.subjectName}">??????</a></td>
                      	</tr>
                      </c:forEach>                
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>	
      </div>
      
      <!-- main-panel ends -->
    </div>   
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="${pageContext.request.contextPath}/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="${pageContext.request.contextPath}/vendors/chart.js/Chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="${pageContext.request.contextPath}/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="${pageContext.request.contextPath}/js/dataTables.select.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/js/hoverable-collapse.js"></script>
  <script src="${pageContext.request.contextPath}/js/template.js"></script>
  <script src="${pageContext.request.contextPath}/js/settings.js"></script>
  <script src="${pageContext.request.contextPath}/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${pageContext.request.contextPath}/js/dashboard.js"></script>
  <script src="${pageContext.request.contextPath}/js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->
<script>
	<!-- ????????? ??????-->
	$('#addSubjectBtn').click(function(){
		if($('#subjectName').val() == '') {
			$('#addSubjectHelper').text('????????? ???????????????.');
		} else {
			$('#addSubjectHelper').text('');
			$('#addSubjectForm').submit();
		}
	});
	<!-- ???????????? ????????? ???????????? ????????? ?????????-->
	$('#btn').click(function(){
		$('#subjectName').val('')	
	});
	$('#close').click(function(){
		$('##subjectName').val('')
	});
	
</script>
</body>
</html>

